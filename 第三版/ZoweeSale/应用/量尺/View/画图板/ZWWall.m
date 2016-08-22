//
//  ZWWall.m
//  easyMeasure
//
//  Created by wanglj on 16/4/6.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZWWall.h"
#import "UIView+ShortCut.h"
#import "UIColor+system.h"

@implementation ZWWall
{
    CGPoint _initialPoint ;
    UIPanGestureRecognizer* _recognizer;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setIsDraging:(BOOL)isDraging {
    _isDraging = isDraging;
    _recognizer.enabled = isDraging;
}
- (void)setup{
    self.isDraging = YES;
    [self  addTarget:self action:@selector(touchUpinsideClick) forControlEvents:UIControlEventTouchUpInside];
    _recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    [self addGestureRecognizer:_recognizer];
    self.backgroundColor = [UIColor colorWithHexString:@"C7B394"];
}
/**
 *  梯形layer
 */
- (void)setLayer {
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    UIBezierPath *bezier = [[UIBezierPath alloc]init];
    [bezier moveToPoint:CGPointMake(self.height, 0)];
    [bezier addLineToPoint:CGPointMake(0, self.height)];
    [bezier addLineToPoint:CGPointMake(self.width, self.height)];
    [bezier addLineToPoint:CGPointMake(self.width-self.height, 0)];
    [bezier addQuadCurveToPoint:CGPointMake(self.height,0) controlPoint:CGPointMake(0, 0)];
    layer.path = bezier.CGPath;
    self.layer.mask = layer;
    
}
/**
 *  垂直墙斜线
 */
- (void)drawVerticalLine{
    CGFloat RectWidth = 5;
    NSInteger count = self.height / RectWidth + 1;
    for (int i=0 ; i<count; i++) {
        CGContextRef context=UIGraphicsGetCurrentContext();
        [[UIColor blackColor] setStroke];
        //        折线
        CGPoint fPoint = CGPointMake(0, RectWidth * i);
        CGPoint tPoint = CGPointMake(self.width, fPoint.y - self.width);
        if (self.tag == HomeDesignWallRight) {
            fPoint = CGPointMake(self.width, RectWidth * i);
            tPoint = CGPointMake(0, fPoint.y + self.width);
        }
        CGContextSetLineWidth(context, 1.0);//线粗细
        CGContextMoveToPoint(context,fPoint.x,fPoint.y); // 0点数据
        CGContextAddLineToPoint(context, tPoint.x, tPoint.y);
        CGContextStrokePath(context);
    }
}
/**
 *  水平墙斜线
 */
- (void)drowHorizontalLine {
    CGFloat RectWidth = 5;
    NSInteger count = self.width / RectWidth + 1;
    for (int i=0 ; i<count; i++) {
        CGContextRef context=UIGraphicsGetCurrentContext();
        [[UIColor blackColor] setStroke];
        //        折线
        CGPoint fPoint = CGPointMake(RectWidth*i, 0);
        CGPoint tPoint = CGPointMake(fPoint.x -self.height , self.height);
        if (self.tag == HomeDesignWallDown) {
            fPoint = CGPointMake(RectWidth*i, self.height);
            tPoint = CGPointMake(fPoint.x+self.height, 0);
        }
        CGContextSetLineWidth(context, 1.0);//线粗细
        CGContextMoveToPoint(context,fPoint.x,fPoint.y); // 0点数据
        CGContextAddLineToPoint(context, tPoint.x, tPoint.y);
        CGContextStrokePath(context);
    }
}

- (void)drawRect:(CGRect)rect {
    if (self.tag == HomeDesignWallTop) {
        [self drowHorizontalLine];
        CAShapeLayer *layer = [[CAShapeLayer alloc]init];
        UIBezierPath *bezier = [[UIBezierPath alloc]init];
        [bezier moveToPoint:CGPointMake(0, 0)];
        [bezier addLineToPoint:CGPointMake(self.height, self.height)];
        [bezier addLineToPoint:CGPointMake(self.width-self.height, self.height)];
        [bezier addLineToPoint:CGPointMake(self.width,0)];
        [bezier addQuadCurveToPoint:CGPointMake(0,0) controlPoint:CGPointMake(0, 0)];
        layer.path = bezier.CGPath;
        self.layer.mask = layer;
    }else if (self.tag == HomeDesignWallLeft){
        [self drawVerticalLine];
        CAShapeLayer *layer = [[CAShapeLayer alloc]init];
        UIBezierPath *bezier = [[UIBezierPath alloc]init];
        [bezier moveToPoint:CGPointMake(0, 0)];
        [bezier addLineToPoint:CGPointMake(0, self.height)];
        [bezier addLineToPoint:CGPointMake(self.width, self.height-self.width)];
        [bezier addLineToPoint:CGPointMake(self.width, self.width)];
        [bezier addQuadCurveToPoint:CGPointMake(0,0) controlPoint:CGPointMake(0, 0)];
        layer.path = bezier.CGPath;
        self.layer.mask = layer;
    }else if (self.tag == HomeDesignWallDown){
        [self drowHorizontalLine];
        CAShapeLayer *layer = [[CAShapeLayer alloc]init];
        UIBezierPath *bezier = [[UIBezierPath alloc]init];
        [bezier moveToPoint:CGPointMake(self.height, 0)];
        [bezier addLineToPoint:CGPointMake(0, self.height)];
        [bezier addLineToPoint:CGPointMake(self.width, self.height)];
        [bezier addLineToPoint:CGPointMake(self.width-self.height, 0)];
        [bezier addQuadCurveToPoint:CGPointMake(self.height,0) controlPoint:CGPointMake(0, 0)];
        layer.path = bezier.CGPath;
        self.layer.mask = layer;
    }else if (self.tag == HomeDesignWallRight){
        [self drawVerticalLine];
        CAShapeLayer *layer = [[CAShapeLayer alloc]init];
        UIBezierPath *bezier = [[UIBezierPath alloc]init];
        [bezier moveToPoint:CGPointMake(self.width, 0)];
        [bezier addLineToPoint:CGPointMake(0, self.width)];
        [bezier addLineToPoint:CGPointMake(0, self.height-self.width)];
        [bezier addLineToPoint:CGPointMake(self.width, self.height)];
        [bezier addQuadCurveToPoint:CGPointMake(self.width,0) controlPoint:CGPointMake(self.width,0)];
        layer.path = bezier.CGPath;
        self.layer.mask = layer;
    }
    
}
- (void)touchUpinsideClick {
    UIView *superview = [self superview];
    for (UIView *view in superview.subviews) {
        if ([view isKindOfClass:[ZWWall class]]&&![view isEqual:self]) {
            ZWWall *wall = (ZWWall *)view;
            if (wall.selected) {
                wall.selected = NO;
                wall.backgroundColor = [UIColor colorWithHexString:@"C7B394"];
            }

        }
    }
    if (self.selected) {
        self.selected = NO;
        self.backgroundColor = [UIColor colorWithHexString:@"C7B394"];
    }else {
        self.selected = YES;
       self.backgroundColor = hexColorString(@"f4b37a");
    }
    __weak __typeof(&*self)weakSelf = self;
    if(self.touchup) {
        self.touchup(weakSelf);
    }
}

- (void)handleSwipeFrom:(UIPanGestureRecognizer *)sender {
    CGPoint recoginPoint = [sender translationInView:self];
    if (sender.state == UIGestureRecognizerStateBegan) {
        _initialPoint = self.frame.origin;
    }
    [self checkUIPanGestureRecognizerPoint:recoginPoint];
}

/**
 *  让画板移动的时候不会移除屏幕外
 *
 *  @param point 手势滑动距离
 *
 */
- (void) checkUIPanGestureRecognizerPoint:(CGPoint)point {
    self.left = _initialPoint.x + point.x;
    self.top = _initialPoint.y + point.y;
    
    if (self.left < SCREEN_WIDTH) {
        self.left = SCREEN_WIDTH;
    }
    if (self.right > SCREEN_WIDTH*4) {
        self.right = SCREEN_WIDTH*4;
    }
     //NSLog(@"%f,%f",self.right,self.superview.width);
    if (self.top < SCREEN_HEIGHT) {
        self.top = SCREEN_HEIGHT;
    }
    if (self.bottom > SCREEN_HEIGHT*4) {
        self.bottom = SCREEN_HEIGHT*4;
    }
    
}
@end
