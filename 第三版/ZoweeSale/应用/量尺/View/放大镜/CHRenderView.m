//
//  CHRenderView.m
//  Magnifier
//
//  Created by Chenhao on 14-2-25.
//  Copyright (c) 2014年 Chenhao. All rights reserved.
//

#import "CHRenderView.h"
#import "CHMagnifierView.h"
#import "ZEMeasureTool.h"
#import "ZEMarkArrow.h"
#import "ZEPhotoViewController.h"
@interface CHRenderView ()

@property (strong, nonatomic) NSTimer *touchTimer;
@property (strong, nonatomic) CHMagnifierView *magnifierView;
@property(nonatomic,weak) UIButton  * startBtn;
@property(nonatomic,weak) UIButton  * endBtn;
@property (nonatomic,strong) UIButton *  movingBtn;
@property (nonatomic, strong) NSMutableArray *paths;
@property (nonatomic,strong) UIBezierPath * path;
@property (nonatomic,strong) CAShapeLayer * shapleLayer;
@property (nonatomic,strong) NSMutableArray * layers;
@property(nonatomic,weak)  UIButton * markBtn ;
@property(nonatomic,weak) ZEMarkArrow * selectedMarkArrow;
@end

@implementation CHRenderView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self listenNotification];
}

#pragma mark - custom method

- (void)showLoupe:(NSTimer *)timer
{
    [self.magnifierView makeKeyAndVisible];
}

#pragma mark - touches

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.touchTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(showLoupe:)
                                                     userInfo:nil
                                                      repeats:NO];
    
    if (self.magnifierView == nil) {
        self.magnifierView = [[CHMagnifierView alloc] init];
        self.magnifierView.viewToMagnify = self.window;
    }
    self.magnifierView.pointToMagnify = [[touches anyObject] locationInView:self.window];
   
  
    // 创建箭头
    UITouch * touch = [touches anyObject];
    if (![touch.view isKindOfClass:[CHRenderView class]]) {
        return;
    }
    CGPoint point = [touch locationInView:self];
    UIButton * startBtn = [UIButton new];
    startBtn.backgroundColor = [UIColor blueColor];
    startBtn.center = point;
    startBtn.size  = CGSizeMake(8, 8);
    startBtn.layer.cornerRadius = startBtn.width * 0.5;
    startBtn.layer.masksToBounds = YES;
    [self addSubview:startBtn];
    self.startBtn = startBtn;
    
    // 3.当用户手指按下的时候创建一条路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 3.1设置路径的相关属性
    [path setLineJoinStyle:kCGLineJoinRound];
    [path setLineCapStyle:kCGLineCapRound];
    [path moveToPoint:point];
    [self.paths addObject:path];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.magnifierView.hidden == NO) {
        self.magnifierView.pointToMagnify = [[touches anyObject] locationInView:self.window];
    }
    
   
    UITouch *touch = [touches anyObject];
    if (![touch.view isKindOfClass:[CHRenderView class]]) {
        return;
    }
    CGPoint movePoint = [touch locationInView:touch.view];
    self.movingBtn.center  = movePoint;
    [self addSubview:self.movingBtn];
    UIBezierPath *currentPaht = [self.paths lastObject];
    [currentPaht removeAllPoints];
    [currentPaht moveToPoint:self.startBtn.center];
    [currentPaht addLineToPoint:movePoint];

    [self setNeedsDisplay];
    
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.touchTimer invalidate];
    [self.magnifierView setHidden:YES];
    
    UITouch *touch = [touches anyObject];
    if (![touch.view isKindOfClass:[CHRenderView class]]) {
        return;
    }
    
    // 绘制结束时的路径
    [self drawEndPath];
    
    // 创建箭头的容器视图
    [self createMarkArrow];
  
    // 通知控制器箭头绘制完毕
    if ([self.delegate respondsToSelector:@selector(CHRenderViewDidEndDrawMark:)]) {
        [self.delegate CHRenderViewDidEndDrawMark:self];
    }
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.touchTimer invalidate];
    [self.magnifierView setHidden:YES];
}

- (void)drawRect:(CGRect)rect
{
    UIImage * image = [UIImage imageWithData:self.photoData];
    [image drawInRect:self.bounds];
    
    //重绘UIBezierPath是为了正在绘制时，让用户看的路径

    // 边路数组绘制所有的线段
    for (UIBezierPath *path in self.paths) {
        [arrowColor set];
        [path stroke];
    }
    

}

/**
 *  处理关闭这个view的UserInterfaceEnable时，子控件的响应
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    // 1.判断自己能否接收事件
    if (self.userInteractionEnabled == NO){
        // 3.去找有没有比自己更合适的view
        // 从后往前遍历自己的子控件
        NSInteger count = self.subviews.count;
        
        for (NSInteger i = count - 1; i >= 0; i--) {
            // 获取子控件
            UIView *childView = self.subviews[i];
            
            // 转换坐标系
            // 把自己坐标系上的点转换成子控件做坐标系上的点
            CGPoint childPoint = [self convertPoint:point toView:childView];
            
            UIView *fitView = [childView hitTest:childPoint withEvent:event];
            // 找到最合适的view
            if (fitView) {
                return fitView;
            }
            
        }
        return  nil;
    }

    // 2.判断点在不在当前控件上面
    if (![self pointInside:point withEvent:event]) return nil;
    
    // 没有找到比自己更合适的view
    return self;
}


#pragma mark - selfMethod


- (void)listenNotification
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(displayMarkString:) name:markValueChanged object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cancilMarkBtnClick) name:canilMark object:nil];
}


- (void)cancilMarkBtnClick
{
    NSLog(@"%s",__func__);
}

- (void)displayMarkString:(NSNotification*)note
{
    NSString * str = note.userInfo[@"markStr"];
    NSLog(@"%@",str);
    self.selectedMarkArrow.markVaule = str;
    
}



- (void)btnClick:(UIButton*)btn
{
    NSLog(@"%s",__func__);
}

- (void)tapAction:(UITapGestureRecognizer*)tap
{
    [self.selectedMarkArrow normalArrow];
    ZEMarkArrow * markArrow = (ZEMarkArrow*)tap.view;
    self.selectedMarkArrow = markArrow;
    [markArrow selelctArrow];
    [[NSNotificationCenter defaultCenter]postNotificationName:markArrowClicked object:self userInfo:@{@"markArrow":self.selectedMarkArrow}];
}

- (void) createMarkArrow
{
    ZEMarkArrow * arrow = [[ZEMarkArrow alloc]init];
//    arrow.backgroundColor = [UIColor greenColor];
    [arrow addTarget:self action:@selector(tapAction:)];
    [self tapAction:arrow.gestureRecognizers.lastObject];
    CGPoint  arrowOrigin = [[ZEMeasureTool sharedZEMeasureTool]minimunPointBetweenStartPoint:self.startBtn.center endPoint:self.endBtn.center];
    CGSize arrowRectSize =[[ZEMeasureTool sharedZEMeasureTool]rectSizePointBetweenStartPoint:self.startBtn.center endPoint:self.endBtn.center];
    arrow.origin = arrowOrigin;
    arrow.size = arrowRectSize;
    [self addSubview:arrow];
    
    CGPoint s= [arrow convertPoint:self.startBtn.center fromView:self];
    CGPoint e = [arrow convertPoint:self.endBtn.center fromView:self];
    //设置箭头的两个端点
    [arrow markArrowStart:s end:e];
}

- (void)drawEndPath
{
    UIButton * endBtn = [UIButton new];
    endBtn.frame = self.movingBtn.frame;
    endBtn.layer.cornerRadius = endBtn.width * 0.5;
    endBtn.layer.masksToBounds = YES;
    [endBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:endBtn];
    self.endBtn = endBtn;
    [self.movingBtn removeFromSuperview];
    
    // 移除在手动绘制路径时的两个端点
    [self.startBtn removeFromSuperview];
    [self.endBtn removeFromSuperview];
    
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
    
}

#pragma mark publickMethod

- (void)setPhotoData:(NSData *)photoData
{
    _photoData = photoData;
    [self setNeedsDisplay];
}

- (void)setCanBeMark:(BOOL)canBeMark
{
    _canBeMark = canBeMark;
    self.userInteractionEnabled =canBeMark;
}

#pragma  mark - getter

- (NSMutableArray *)paths
{
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

- (UIButton *)movingBtn
{
    if (_movingBtn == nil) {
        _movingBtn = [[UIButton alloc]init];
        _movingBtn.size= CGSizeMake(8, 8);
        _movingBtn.backgroundColor = [UIColor blueColor];
        _movingBtn.layer.cornerRadius = _movingBtn.width * 0.5;
        _movingBtn.layer.masksToBounds = YES;
       
    }
    return _movingBtn;
}

- (UIBezierPath *)path
{
    if (_path == nil) {
        _path = [UIBezierPath bezierPath];
        [_path setLineJoinStyle:kCGLineJoinRound];
        [_path setLineCapStyle:kCGLineCapRound];
        [_path setLineWidth:5];
        
    }
    return _path;
}

- (CAShapeLayer *)shapleLayer
{
    if (_shapleLayer == nil) {
        _shapleLayer = [CAShapeLayer layer];
        _shapleLayer.strokeColor = [UIColor blueColor].CGColor;
    }
    return _shapleLayer;
}

- (NSMutableArray *)layers
{
    if (_layers == nil) {
        _layers = [NSMutableArray array];
    }
    return _layers;
}


@end
