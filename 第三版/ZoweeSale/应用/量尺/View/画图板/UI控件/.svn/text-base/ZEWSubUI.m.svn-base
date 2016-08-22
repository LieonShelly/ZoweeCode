//
//  ZEWSubUI.m
//  ZoweeSale
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEWSubUI.h"

@implementation ZEWSubUI


+ (CAShapeLayer *)shapeOfSingalDoorWithCenter:(CGPoint)center endPoint:(CGPoint)endPoint startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle
{
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.backgroundColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 2;
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    CGFloat r = [self distanceBetweenTwoPointsFirstPoint:center secondPoint:endPoint];
    [path moveToPoint:center];
    [path addLineToPoint:endPoint];
    [path addArcWithCenter:center radius:r startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path addLineToPoint:center];
    [path closePath];
    layer.path = path.CGPath;
    return layer;
}


+ (CGFloat)distanceBetweenTwoPointsFirstPoint:(CGPoint)firstPoint secondPoint:(CGPoint)secondPoint
{
    // 在C语言中，可以使用库函数pow(x, y)来表示x^y（当y=2时，即表示x的平方）。
    
    CGFloat x1 = firstPoint.x;
    CGFloat y1 = firstPoint.y;
    CGFloat x2 = secondPoint.x;
    CGFloat y2 = secondPoint.y;
    
    CGFloat A = pow(x1 - x2, 2);
    CGFloat B = pow(y1 - y2, 2);
    
    return sqrt(A + B);
}




@end
