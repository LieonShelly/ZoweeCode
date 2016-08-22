//
//  ZEMarkArrow.m
//  ZoweeSale
//
//  Created by apple on 16/5/20.
//  Copyright © 2016年 TH. All rights reserved.
//
#define delta  25
#define arrowPointWith 8
#define textLabelCornerRadius 5
#define textLabelDefaultHeight 44
#define arrowImage [UIImage imageNamed:@""] //mark_Arrow

#import "ZEMarkArrow.h"
#import "ZEMeasureTool.h"


@interface ZEMarkArrow ()<UIGestureRecognizerDelegate>
@property(nonatomic,weak) UIButton  * startBtn;
@property(nonatomic,weak) UIButton  * endBtn;
@property(nonatomic,weak) UIButton  * centerBtn;
@property(nonatomic,weak) CAShapeLayer  * shapelayer;
@property(nonatomic,weak) UILabel  * textLabel;
@property(nonatomic,weak) UITapGestureRecognizer  * tap;


@end

@interface ZEMarkArrow ()
@property(nonatomic,strong) UIPanGestureRecognizer * btnPan ;
@property(nonatomic,weak) UIPanGestureRecognizer * pan ;


@end

@implementation ZEMarkArrow
{
    CGRect _startBtnClickFrame;
    CGRect _endBtnClickFrame;
}

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
  //     self.backgroundColor = lieonRandomColor;
        [self setupStartBtn];
        [self setupEndBtn];
        [self setuptextLabel];
        [self setupShapeLayer];
        [self addGesture];
    }
    return self;
}

#pragma mark - 公共方法
/**
 *  设置箭头
 */
- (void)markArrowStart:(CGPoint)s end:(CGPoint)e
{
    // 控件的位置
    self.startBtn.center =s;
    self.endBtn.center = e;
    
   
    [self resetStartBtnAndEndBtn];
    
    // 重新设置textLabel的位置
    [self resetTextLabel];
    
    // layer的路径
    [self drawPath];
    
    // 重新布局子控件
    [self setNeedsLayout];
    
    //  更新数据模型(这些数据将要发送给服务器，用于二次还原)
    [self updateMarkArrowModel];
    
}

/**
 *  给箭头添加响应
 */
- (void)addTarget:(id)target action:(SEL)action
{
    [self.tap addTarget:target action:action];
}

/**
 *  显示标注
 */
- (void)setMarkVaule:(NSString *)markVaule
{
    _markVaule = markVaule;
    self.textLabel.text = markVaule;
    self.textLabel.backgroundColor = [UIColor blueColor];
    self.textLabel.layer .anchorPoint = CGPointMake(0.5, 0);
    [self.textLabel sizeToFit];
    [self updateMarkArrowModel];
}

#pragma mark - 内部控制方法

/**
 *  创建箭头的起点
 */
- (void)setupStartBtn
{
    UIButton * startBtn = [UIButton new];
    startBtn.backgroundColor = arrowColor;
    [startBtn setImage:arrowImage forState:UIControlStateNormal];
    startBtn.size = CGSizeMake(arrowPointWith,arrowPointWith);
    startBtn.layer.cornerRadius = startBtn.width * 0.5;
    startBtn.layer.masksToBounds = YES;
    [startBtn addTarget:self action:@selector(startBtnClick:) forControlEvents:(UIControlEventTouchDown)];
    [self addSubview:startBtn];
    self.startBtn = startBtn;
}
/**
 *  创建箭头的终点
 */
- (void)setupEndBtn
{
    UIButton * endBtn = [UIButton new];
    [endBtn setImage:arrowImage forState:UIControlStateNormal];
    endBtn.backgroundColor = [UIColor blueColor];
    endBtn.size = self.startBtn.size;
    endBtn.layer.cornerRadius = endBtn.width * 0.5;
    endBtn.layer.masksToBounds = YES;
    [endBtn addTarget:self action:@selector(endBtnClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:endBtn];
    self.endBtn =endBtn;
    
}
/**
 *  创建箭头的显示标签
 */
- (void)setuptextLabel
{
    UILabel * label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    label.layer.cornerRadius = textLabelCornerRadius;
    label.layer.masksToBounds = YES;
    label.layer.anchorPoint = CGPointMake(0.5, 0);
    [self addSubview:label];
    self.textLabel = label;
}
/**
 *  创建的箭头的路径
 */
- (void)setupShapeLayer
{
    CAShapeLayer * shapelayer = [CAShapeLayer layer];
    shapelayer.strokeColor = arrowColor.CGColor;
    shapelayer.fillColor = nil;
    [self.layer addSublayer:shapelayer];
    self.shapelayer = shapelayer;
}
/**
 *  添加手势
 */
- (void)addGesture
{
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveAction:)];
    [self addGestureRecognizer:pan];
    self.pan = pan;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;
    self.tap = tap;
    
    //UIPanGestureRecognizer * textLabelPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(textLabelPanAction:)];
    self.textLabel.userInteractionEnabled = YES;
    self.userInteractionEnabled = YES;
//    [self.textLabel addGestureRecognizer:textLabelPan];
    
    
    
}
/**
 *   移动整个view的手势
 */
- (void)moveAction:(UIPanGestureRecognizer*)pan
{
    [self selelctArrow];
    CGPoint point = [pan locationInView:pan.view.superview];
    NSLog(@"movepanaction---%@",NSStringFromCGPoint(point));
    pan.view.center = point;
   
    CGPoint pointSub = [pan.view.superview convertPoint:point toView:self];
     NSLog(@"pointSub---%@",NSStringFromCGPoint(pointSub));
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        [self normalArrow];
    }
}
/**
 *  移动箭头两个端点的手势
 */
- (void)moveBtnPanAction:(UIPanGestureRecognizer*)pan
{
    [self selelctArrow];
    CGPoint point = [pan locationInView:pan.view.superview];
    NSLog(@"movepanaction---%@",NSStringFromCGPoint(point));
    pan.view.origin = point;
    NSLog(@"self.startBtn.origin---%@self.endBtn.origin--%@",NSStringFromCGPoint(self.startBtn.center),NSStringFromCGPoint(self.endBtn.center));
 
    CGPoint s = [self convertPoint:self.startBtn.origin toView:self.superview];
    CGPoint e = [self  convertPoint:self.endBtn.origin toView:self.superview];
    CGPoint  arrowOrigin = [[ZEMeasureTool sharedZEMeasureTool]minimunPointBetweenStartPoint:s endPoint:e ];
    CGSize arrowRectSize =[[ZEMeasureTool sharedZEMeasureTool]rectSizePointBetweenStartPoint:self.startBtn.center endPoint:self.endBtn.center];
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        self.origin = arrowOrigin;
        self.size = arrowRectSize;
      
    
        NSLog(@"self.startBtn.origin---%@---self.endBtn.origin%@---self.frame---%@",NSStringFromCGPoint(self.startBtn.origin),NSStringFromCGPoint(self.endBtn.origin),NSStringFromCGRect(self.frame));
    }
    [self drawPath];
}

- (void)textLabelPanAction:(UIPanGestureRecognizer*)pan
{
    CGPoint point = [pan locationInView:pan.view.superview.superview];
    self.center = point;
}
/**
 *   选中箭头
 */
- (void)selelctArrow
{
    self.startBtn.backgroundColor = [UIColor yellowColor];
    self.endBtn.backgroundColor = self.startBtn.backgroundColor;
}

/**
 *  未选中箭头
 */
- (void)normalArrow
{
    
    self.startBtn.backgroundColor = [UIColor blueColor];
    self.endBtn.backgroundColor = self.startBtn.backgroundColor;
}

/**
 *  绘制箭头的路径
 */
- (void)drawPath
{
    // layer的路径
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:self.startBtn.center];
    [path addLineToPoint:self.endBtn.center];
    self.shapelayer.path = path.CGPath;
}

- (void)startBtnClick:(UIButton*)btn
{
    [self selelctArrow];
    [btn addGestureRecognizer:self.btnPan];
    NSLog(@"%s",__func__);
}

- (void)endBtnClick:(UIButton*)btn
{
    [self selelctArrow];
    [btn addGestureRecognizer:self.btnPan];
    NSLog(@"%s",__func__);
}

/**
 *  更新显示标签的状态
 */
- (void)resetTextLabel
{
    // 在用户没有设置标注值得情况下，texLabel的默认长度为两个端点之间的距离
    CGFloat width = [[ZEMeasureTool sharedZEMeasureTool]distanceBetweenTwoPointsFirstPoint:self.startBtn.center secondPoint:self.endBtn.center];
    self.textLabel.layer.anchorPoint = CGPointMake(0.5, 0.5);
    self.textLabel.size = CGSizeMake(width, textLabelDefaultHeight);
    
    CGPoint center = [[ZEMeasureTool sharedZEMeasureTool]centerBetweenTwoPionts:self.startBtn.center AndEndPoint:self.endBtn.center];
    self.textLabel.center = center;
    CGFloat angle =  [[ZEMeasureTool sharedZEMeasureTool]rotateAngleWithFirstPoint:self.startBtn.center endPoint:self.endBtn.center];
    self.textLabel.transform = CGAffineTransformMakeRotation(angle);
    
}

/**
 *  更新箭头两个端点的状态
 */
- (void)resetStartBtnAndEndBtn
{
    CGFloat angle =  [[ZEMeasureTool sharedZEMeasureTool]rotateAngleWithFirstPoint:self.startBtn.center endPoint:self.endBtn.center];
    self.startBtn.transform = CGAffineTransformMakeRotation(angle);
    self.endBtn.transform = CGAffineTransformMakeRotation(angle);
}
/**
 *  更新箭头的数据模型
 */
- (void)updateMarkArrowModel
{
    self.arrowModel.arrowContainerX = TwoBitNumber(self.origin.x);
    self.arrowModel.arrowContainerY = TwoBitNumber(self.origin.y);
    self.arrowModel.arrowContainerW = TwoBitNumber(self.width);
    self.arrowModel.arrowContainerH = TwoBitNumber(self.height);
    self.arrowModel.startCenterX = TwoBitNumber(self.startBtn.centerX);
    self.arrowModel.startCenterY = TwoBitNumber(self.startBtn.centerY);
    self.arrowModel.endCenterX = TwoBitNumber(self.endBtn.centerX);
    self.arrowModel.endCenterY = TwoBitNumber(self.endBtn.centerY);
    self.arrowModel.text = self.textLabel.text;
    // 缓存数据
    [ZEMeasureTool saveMarkArrowModel:self.arrowModel];
}


#pragma mark --手势并存协议

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

#pragma mark - getter

- (UIPanGestureRecognizer *)btnPan
{
    if (_btnPan == nil) {
        _btnPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveBtnPanAction:)];
        
    }
    return _btnPan;
}

- (ZEMarkArrowModel *)arrowModel
{
    if (_arrowModel == nil) {
        _arrowModel = [[ZEMarkArrowModel alloc]init];
   }
    return _arrowModel;
}
@end
