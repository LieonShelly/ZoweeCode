//
//  ZEMarkView.m
//  ZoweeSale
//
//  Created by lieon on 16/6/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#define selfWidth 20
#define selfHeight selfWidth
#import "ZEMarkView.h"

@interface ZEMarkView ()

@property (nonatomic ,strong) ZEArrow * arrow;

@property(nonatomic) ZEMarkViewType  type;
@end

@implementation ZEMarkView


- (ZEArrow *)arrow
{
    if (_arrow == nil) {
        
        _arrow = [[ZEArrow alloc]init];
        
    }
    return _arrow;
}

- (UILabel *)textLabel
{
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc]init];
//        _textLabel.backgroundColor = lieonRandomColor;
        _textLabel.font = [UIFont systemFontOfSize:15];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _textLabel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.textLabel];
        [self addSubview:self.arrow];
   
        
        
    }
    return  self;
}


+ (instancetype)creatHorisonMarkView
{
    ZEMarkView * markView = [[ZEMarkView alloc]init];
    markView.type =ZEMarkViewTypeHorison;
    markView.height = selfHeight;
    markView.arrow.type = ZEArrowTypeHorision;
    
    // 布局子控件
    
    markView.arrow.sd_layout
    .bottomSpaceToView(markView,0)
    .heightIs(10)
    .leftSpaceToView(markView,0)
    .rightSpaceToView(markView,0);
    [markView.arrow updateLayout];
    
    markView.textLabel.sd_layout
    .topSpaceToView(markView,0)
    .bottomSpaceToView(markView.arrow,0)
    .leftSpaceToView(markView,0)
    .rightSpaceToView(markView,0);
    
    return markView;
}

+ (instancetype)creatVerticalMarkView
{
    ZEMarkView * markView = [[ZEMarkView alloc]init];
    markView.width = selfWidth;
    markView.type =ZEMarkViewTypeVertical;
    markView.arrow.type = ZEArrowTypeVertical;
    
    // 重新布局子控件
    [markView.textLabel sd_resetLayout];
    [markView.arrow sd_resetLayout];
    
    markView.arrow.sd_layout
    .rightSpaceToView(markView,0)
    .topSpaceToView(markView,0)
    .bottomSpaceToView(markView,0)
    .widthIs(10);
    [markView.arrow updateLayout];
    
    markView.textLabel.sd_layout
    .topSpaceToView(markView,0)
    .bottomSpaceToView(markView,0)
    .rightSpaceToView(markView.arrow,0)
    .leftSpaceToView(markView,0);
    
    markView.textLabel.transform = CGAffineTransformMakeRotation(M_PI_2);
    
    return markView;

}
#pragma mark - publickMethod

+ (instancetype)markViewWithType:(ZEMarkViewType)type
{
    switch (type) {
        case ZEMarkViewTypeHorison:
        {
            ZEMarkView * markView = [self creatHorisonMarkView];
            return markView;
            break;
        }
        case ZEMarkViewTypeVertical:
        {
           ZEMarkView * markView =[self creatVerticalMarkView];
            return markView;
        }
    }
}
- (void)setText:(NSString *)text
{
    _text = text;
    self.textLabel.text = text;
    [self.textLabel sizeToFit];
    [self setNeedsLayout];
}



@end



@implementation ZEArrow


- (CAShapeLayer *)shapeLayer
{
    if (_shapeLayer == nil) {
        _shapeLayer = [CAShapeLayer layer];
//        _shapeLayer.backgroundColor = lieonRandomColor.CGColor;
        _shapeLayer.fillColor = [UIColor darkGrayColor].CGColor;
        _shapeLayer.strokeColor = [UIColor darkGrayColor].CGColor;
    }
    return _shapeLayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [ super initWithFrame:frame]) {
        
        [self.layer addSublayer:self.shapeLayer];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.shapeLayer.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    //根据见箭头的类型来绘制路径
    switch (self.type) {
        case ZEArrowTypeHorision:
            [self drawHorisonArrowForShapeLayer:self.shapeLayer];
            break;
            
            case ZEArrowTypeVertical:
            [self drawVerticalArrowForShapeLayer:self.shapeLayer];
            break;
            
        default:
            break;
    }
}

- (void)drawHorisonArrowForShapeLayer:(CAShapeLayer*)shapeLayer
{
    shapeLayer.frame = self.bounds;
    CGFloat inset = 10;
    UIBezierPath * path = [UIBezierPath bezierPath];
    //1.绘制第一个三角形
    [path moveToPoint:CGPointMake(self.x, self.height * 0.5)];
    [path addLineToPoint:CGPointMake(inset, self.height)];
    [path addLineToPoint:CGPointMake(inset, 0)];
    [path closePath];

    //2.绘制直线
    [path addLineToPoint:CGPointMake(self.width, self.height * 0.5)];
    
    //3.绘制第二个三角形
    [path addLineToPoint:CGPointMake(self.width - inset, 0)];
    [path addLineToPoint:CGPointMake(self.width - inset, self.height)];
    [path addLineToPoint:CGPointMake(self.width, self.height * 0.5)];
    [path closePath];
    
    shapeLayer.path = path.CGPath;
    
    
}

- (void)drawVerticalArrowForShapeLayer:(CAShapeLayer*)shapeLayer
{
    
    shapeLayer.frame = self.bounds;
    CGFloat inset = 10;
    UIBezierPath * path = [UIBezierPath bezierPath];
    //1.绘制第一个三角形
    [path moveToPoint:CGPointMake(self.width * 0.5, 0)];
    [path addLineToPoint:CGPointMake(self.width, inset)];
    [path addLineToPoint:CGPointMake(0, inset)];
    [path closePath];
    
    //2.绘制直线
    [path addLineToPoint:CGPointMake(self.width * 0.5, self.height)];
    
    //3.绘制第二个三角形
    [path addLineToPoint:CGPointMake(self.width, self.height - inset)];
    [path addLineToPoint:CGPointMake(0, self.height- inset)];
    [path addLineToPoint:CGPointMake(self.width *0.5, self.height)];
    [path closePath];
    
    shapeLayer.path = path.CGPath;
}
@end


