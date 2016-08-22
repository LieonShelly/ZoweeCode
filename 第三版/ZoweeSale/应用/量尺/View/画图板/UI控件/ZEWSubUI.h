//
//  ZEWSubUI.h
//  ZoweeSale
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 TH. All rights reserved.
//  ，

#import <UIKit/UIKit.h>
#import "ZEWSubInfo.h"
#import "ZWWallLayer.h"


@interface ZEWSubUI : UIButton 

/**
 *  墙体附加物模型
 */
@property (nonatomic,strong) ZEWSubInfo * wsubInfo;
/**
 *  属于哪一面墙
 */
@property (nonatomic,strong) ZWWallLayer * belongedWall;

/**
 *  记录是否在墙上
 */
@property(nonatomic)  BOOL   isInWall;

/**
 *  记录墙体附加物的类型（单开，双开）
 */
@property (nonatomic,strong) CAShapeLayer * shape;


/**
 *
 *  @return 单开门的开门路径---扇形
 */
+ (CAShapeLayer *)shapeOfSingalDoorWithCenter:(CGPoint)center endPoint:(CGPoint)endPoint startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle;

@end
