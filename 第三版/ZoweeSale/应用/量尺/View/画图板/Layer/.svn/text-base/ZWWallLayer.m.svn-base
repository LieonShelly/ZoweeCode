//
//  ZWWallLayer.m
//  easyMeasure
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#define     Int(value) ((NSInteger)value * 100) / 100;


#import "ZWWallLayer.h"
#import "ZEMeasureTool.h"

@interface ZWWallLayer ()



@end


@implementation ZWWallLayer



- (instancetype)init
{
    if (self = [super init]) {
    
        UIColor * fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"image_wall_normal"]];
        self.backgroundColor = fillColor.CGColor;
        self.fillColor = fillColor.CGColor;
        self.strokeColor = [UIColor blackColor].CGColor;
    }
    return self;
}
+ (instancetype)wallLayerWithWallModel:(ZEWallInfo *)wall
{
     double length = 0;
    double wthick = 0.0;
    ZWWallLayer * layer = [[ZWWallLayer alloc]init];
    if (wall ==nil) {
        return nil;
    }
    CGFloat sx = [wall.WSX doubleValue];
    CGFloat sy = [wall.WSY doubleValue];
    CGFloat ex = [wall.WEX doubleValue];
    CGFloat ey = [wall.WEY doubleValue];
    CGPoint point1 = CGPointMake(sx, sy);
    CGPoint point2 = CGPointMake(ex, ey);
    CGPoint point3 = CGPointMake(wall.WJSX.doubleValue, wall.WJSY.doubleValue);
    CGPoint point4 = CGPointMake(wall.WJEX.doubleValue, wall.WJEY.doubleValue);
    CGPoint arrowPoint0 = CGPointZero;
    CGPoint arrowpoint1 = CGPointZero;
    CGPoint textLayerOrigin = CGPointZero;
    CATextLayer * textLayer = [CATextLayer layer];
    length = [[ZEMeasureTool sharedZEMeasureTool]distanceBetweenTwoPointsFirstPoint:point1 secondPoint:point2];
    wall.WLength = TwoBitNumber(length);
    layer.wall = wall;
    
    NSString * lengthStr = [NSString stringWithFormat:@"%@", wall.WLength];
    if (sy - ey == 0) { // 水平
        if ( wall.WallNo.integerValue == 0) {
            
            // 水平向上
            // 确定水平向上的箭头的坐标
            arrowPoint0.x = point1.x;
            arrowPoint0.y = point1.y + 20;
            arrowpoint1.x = point2.x;
            arrowpoint1.y = arrowPoint0.y;
            // 显示标注
            textLayerOrigin = CGPointMake(arrowPoint0.x + 0.5 * length, arrowPoint0.y);
            textLayer = [layer textLayerWithOrigin:textLayerOrigin text:lengthStr];
            layer.textLayer = textLayer;
            [layer addSublayer:textLayer];
            
            layer.range = CGRectMake(wall.WSX.doubleValue, wall.WJEY.doubleValue , wall.WLength.doubleValue,wall.WSY.doubleValue- wall.WJEY.doubleValue);
            layer.direction = ZEWallLayerDirectionHorizontalUp;
            
        }else if (wall.WallNo.integerValue == 2){
            // 水平向下
      
            
            // 确定水平向上的箭头的坐标
            arrowPoint0.x = point1.x;
            arrowPoint0.y = point1.y - 20;
            arrowpoint1.x = point2.x;
            arrowpoint1.y = arrowPoint0.y;
            // 显示标注
            textLayerOrigin = CGPointMake(arrowPoint0.x - 0.5 * length, arrowPoint0.y- 20);
            textLayer = [layer textLayerWithOrigin:textLayerOrigin text:lengthStr];
            
        
            layer.textLayer = textLayer;
            [layer addSublayer:textLayer];

            layer.range = CGRectMake(wall.WEX.doubleValue, wall.WEY.doubleValue, wall.WLength.doubleValue, wall.WJEY.doubleValue - wall.WSY.doubleValue);
            layer.direction = ZEWallLayerDirectionHorizontalDown;
        }
        wthick = layer.range.size.height;
    }else if(ex - sx == 0){ // 垂直向右
        if (wall.WallNo.integerValue == 1) {
            
        
            
            // 确定水平向上的箭头的坐标
            arrowPoint0.x = point1.x  - 20;
            arrowPoint0.y = point1.y;
            arrowpoint1.x = arrowPoint0.x;
            arrowpoint1.y = point2.y;
            // 显示标注
            textLayerOrigin = CGPointMake(arrowPoint0.x  , arrowPoint0.y + 0.5 * length);
            textLayer = [layer textLayerWithOrigin:textLayerOrigin text:lengthStr];
            
             textLayer.anchorPoint = CGPointMake(0.5,0.5);
            textLayer.position = CGPointMake(textLayerOrigin.x- textLayer.width*0.5 , textLayerOrigin.y);
           
//            textLayer.transform = CATransform3DMakeRotation(- M_PI * 0.5, 0, 0, 1);
            layer.textLayer = textLayer;
            [layer addSublayer:textLayer];

            layer.range = CGRectMake(wall.WSX.doubleValue, wall.WSY.doubleValue, wall.WJSX.doubleValue - wall.WEX.doubleValue, wall.WLength.doubleValue);
            layer.direction =  ZEWallLayerDirectionVerticalRight;
        }else if (wall.WallNo.integerValue == 3)
        { // 垂直向左
           
            // 确定水平向上的箭头的坐标
            arrowPoint0.x = point1.x + 20;
            arrowPoint0.y = point1.y;
            arrowpoint1.x = arrowPoint0.x;
            arrowpoint1.y = point2.y;
            // 显示标注
            textLayerOrigin = CGPointMake(arrowPoint0.x , arrowPoint0.y - 0.5 * length);
            textLayer = [layer textLayerWithOrigin:textLayerOrigin text:lengthStr];
          
             textLayer.anchorPoint =  CGPointMake(0, 0);
            textLayer.position = textLayerOrigin;
//            textLayer.transform = CATransform3DMakeRotation(- M_PI * 0.5, 0, 0, 1);
            layer.textLayer = textLayer;
            [layer addSublayer:textLayer];
            
            layer.range = CGRectMake(wall.WJSX.doubleValue, wall.WEY.doubleValue, wall.WEX.doubleValue - wall.WJSX.doubleValue, wall.WLength.doubleValue);
            layer.direction = ZEWallLayerDirectionVerticalLeft;
        }
        wthick = layer.range.size.width;
    }
    NSArray * points = @[pointValue(point1),pointValue(point2),pointValue(point3),pointValue(point4),pointValue(arrowPoint0),pointValue(arrowpoint1)];
    layer.path = [layer pathWithPoints:points].CGPath;
    layer.orignalPoints = points;
    layer.points = points;
    layer.text = textLayer.string;
    layer.wall.WThick = @(wthick);
    return layer;
}

#pragma mark - publicMethod

- (UIBezierPath*)pathWithPoints:(NSArray *)points
{
    self.selectedWallPoints = points;
//    self.points = points;
    CGPoint point0 = [points[0] CGPointValue];
    CGPoint point1 = [points[1] CGPointValue];
    self.wall.WSX = TwoBitNumber(point0.x);
    self.wall.WSY = TwoBitNumber(point0.y);
    self.wall.WEX = TwoBitNumber(point1.x);
    self.wall.WEY = TwoBitNumber(point1.y);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    for (int i = 0; i < points.count; i++) {
        CGPoint point = [points[i] CGPointValue];
        if (i == 0 || i == 4) {
            [path moveToPoint:point];
        }else {
            [path addLineToPoint:point];
        }
    }
    return path;
}


- (CATextLayer*)textLayerWithOrigin:(CGPoint)origin text:(NSString*)text
{
    CGFloat textValue =( text.floatValue /100 * 1.00);
    CATextLayer * textLayer = [CATextLayer layer];
    UIFont * font = [UIFont systemFontOfSize:17];
    textLayer.string =  [NSString stringWithFormat:@"%.2fm",textValue];
    textLayer.foregroundColor = [UIColor grayColor].CGColor;
    textLayer.font = (__bridge CFTypeRef)font.fontName;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.fontSize = font.pointSize;
//    textLayer.backgroundColor = [UIColor greenColor].CGColor;
    CGSize textSize = [text sizeWithFont:font];
    textLayer.frame = CGRectMake(origin.x, origin.y, textSize.width+21, textSize.height);
    
    return textLayer;
}

- (UIBezierPath*)defaulutPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    for (int i = 0; i < self.orignalPoints.count; i++) {
        CGPoint point = [self.orignalPoints[i] CGPointValue];
        if (i == 0) {
            [path moveToPoint:point];
        }else{
            [path addLineToPoint:point];
        }
    }
    [path closePath];
    return path;
}

- (void)setText:(NSString *)text
{
    _text = text;
    
    UIFont * font = [UIFont systemFontOfSize:17];
    CGSize textSize = [text sizeWithFont:font];
    self.textLayer.string = text;
    NSArray * points = self.points;
    CGPoint arrow0 = [points[4] CGPointValue];
    CGPoint arrow1 = [points[5] CGPointValue];
    switch (self.wall.WallNo.integerValue) {
        case 0:
        {
            self.textLayer.origin = CGPointMake(arrow0.x + (arrow1.x - arrow0.x)*0.5 , arrow0.y);
            break;
        }
        case 2:
        {
            self.textLayer.origin = CGPointMake(arrow1.x + (arrow0.x - arrow1.x)*0.5 , arrow0.y);
            break;
        }
        case 1:
        {
            self.textLayer.origin = CGPointMake(arrow0.x , arrow0.y + (arrow1.y - arrow0.y) * 0.5);
            break;
        }
        case 3:
        {
            self.textLayer.origin = CGPointMake(arrow1.x , arrow1.y + (arrow0.y - arrow1.y) * 0.5);
            break;
        }
        default:
            break;
    }
    CGFloat x = 0;
    if (self.wall.WallNo.integerValue == 1) { // 对textlayer的x做处理
        x = self.textLayer.frame.origin.x-textSize.width;
    }else{
        x = self.textLayer.frame.origin.x;
    }
   self.textLayer.frame = CGRectMake(x, self.textLayer.frame.origin.y, textSize.width, textSize.height);
  
    
}

/**
 *  将墙的坐标转换为世界坐标系(参考点是屏幕的中点)
 *
 */

- (void)convertWallPositionWithReferPoint:(CGPoint)referPoint
{
    //平板上是：0.1pix -> 1mm
//  PC端是 1pix --> 1mm ,所以要 * 10
    
    CGFloat rx = referPoint.x;
    CGFloat ry = referPoint.y;
    
    //1.  获取各个点的坐标
    ZEWallInfo * wall = self.wall;
    CGFloat sx = wall.WSX.doubleValue;
    CGFloat sy = wall.WSY.doubleValue;
    CGFloat ex = wall.WEX.doubleValue;
    CGFloat ey = wall.WEY.doubleValue;
    CGFloat jsx = wall.WJSX.doubleValue;
    CGFloat jsy = wall.WJSY.doubleValue;
    CGFloat jex = wall.WJEX.doubleValue;
    CGFloat jey = wall.WJEY.doubleValue;
    
   // 2.开始转换(当前点减去参考点)
    CGFloat csx = (sx - rx) * convertRatio;
    CGFloat csy = (sy - ry) * convertRatio;
    CGFloat cex = (ex - rx) * convertRatio;
    CGFloat cey = (ey - ry) * convertRatio;
    CGFloat cjsx = (jsx - rx) * convertRatio;
    CGFloat cjsy = (jsy - ry) * convertRatio;
    CGFloat cjex = (jex - rx) * convertRatio;
    CGFloat cjey = (jey - ry)  * convertRatio;
    CGFloat wthick = wall.WThick.doubleValue * convertRatio;
    
    // 3.重新赋值模型
    wall.WSX = OneBitNumber(csx);
    wall.WSY = OneBitNumber(csy);
    wall.WEX = OneBitNumber(cex);
    wall.WEY = OneBitNumber(cey);
    wall.WJSX = OneBitNumber(cjsx);
    wall.WJSY = OneBitNumber(cjsy);
    wall.WJEX = OneBitNumber(cjex);
    wall.WJEY = OneBitNumber(cjey);
    wall.WThick = OneBitNumber(wthick);
    wall.WLength = OneBitNumber(wall.WLength.doubleValue);
//    NSLog(@"convertWallPositionWithReferPoint:%@",wall.mj_keyValues);
}

@end
