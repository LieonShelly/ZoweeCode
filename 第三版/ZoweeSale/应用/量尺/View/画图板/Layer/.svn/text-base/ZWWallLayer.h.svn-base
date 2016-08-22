//
//  ZWWallLayer.h
//  easyMeasure
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 TH. All rights reserved.
//





#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#import "ZEWallInfo.h"


typedef enum {
   
    ZEWallLayerDirectionHorizontalUp = 0,
    ZEWallLayerDirectionHorizontalDown,
    ZEWallLayerDirectionVerticalLeft,
    ZEWallLayerDirectionVerticalRight,
#warning 可以扩展更多的方向，可以用具体的角度表示
    
    
    
    
}ZEWallLayerDirection;



@interface ZWWallLayer : CAShapeLayer

@property(nonatomic,assign)NSInteger tag;
/**
 *  该面墙所表示的矩形区域
 */
@property(nonatomic,assign)CGRect range;
/**
 *  该面墙的数据模型
 */
@property (nonatomic,strong) ZEWallInfo*  wall;

/**
 *  记录墙上所有点
 */
@property (nonatomic,strong)  NSArray * points;

/**
 *  记录墙上的最初的点
 */
@property (nonatomic,strong)  NSArray * orignalPoints;

/**
 *  墙的方位
 */
@property(nonatomic) ZEWallLayerDirection  direction;

/**
 *  记录选中的墙的最新的尺寸
    为什么不直接用points记录？因为这样是为了防止墙体的改变的累加效果，防止外部改变一点点，墙体的厚度就变得很大
 */

@property (nonatomic,strong) NSArray *selectedWallPoints;

/**
 * 箭头的标注
 */
@property(nonatomic,weak) CATextLayer * textLayer;

@property (nonatomic ,copy) NSString * text;

/**
 * 根据参考点画出一面墙
 *  @return 返回一面墙
 */
+ (instancetype)wallLayerWithWallModel:(ZEWallInfo*)wall ;

/**
 * 画出一条路径
 */
- (UIBezierPath*)pathWithPoints:(NSArray *)points;
/*
 * 最初的路径
 */
- (UIBezierPath*)defaulutPath;

/**
 *  将墙所在的坐标参考点转换为世界坐标系
 *
 */
- (void)convertWallPositionWithReferPoint:(CGPoint)referPoint;
@end
