//
//  ZWWSubUIContainer.h
//  easyMeasure
//
//  Created by apple on 16/5/16.
//  Copyright © 2016年 TH. All rights reserved.
//  墙上附加物控件

typedef enum {
    ZWWSubUIRotateQuadrantFirst,
    ZWWSubUIRotateQuadrantSecond,
    ZWWSubUIRotateQuadrantThird,
    ZWWSubUIRotateQuadrantForth,

}ZWWSubUIRotateType;

#import <UIKit/UIKit.h>
#import "ZEWSubInfo.h"
#import "ZWWallLayer.h"
#import "ZEFurnitureModel.h"

@class ZWWSubUIContainer;
@protocol ZWWSubUIContainerDelegate <NSObject>

- (void)wsubUIContainerDidClick:(ZWWSubUIContainer*)wsubUi;

@end

@interface ZWWSubUIContainer : UIView 


@property(nonatomic,weak) UIButton  * btn;

/**
 * 旋转类型
 */
@property(nonatomic,assign)ZWWSubUIRotateType roateType;

/**
 *  设置图片
 */
@property(nonatomic,weak) UIImage   * image;

/**
 *  记录是否是垂直
 */
@property(nonatomic) BOOL isVertical;

/**
 *  记录是否是水平
 */
@property(nonatomic) BOOL isHorison;

/**
 *  属于哪一面墙
 */
@property (nonatomic,strong) ZWWallLayer * belongedWall;
/**
 *  墙体附加物模型
 */
@property (nonatomic,strong) ZEWSubInfo * wsubInfo;

@property(nonatomic,weak) id<ZWWSubUIContainerDelegate> delegate;

- (void)leftAndRightExchange;
- (void)outAndInnerExchange;

/**
 *  根据模型创建墙体附加物
 */
+ (instancetype)wsubUIWithWSubInfo:(ZEWSubInfo*)wsuInfo belongedWall:(ZWWallLayer*)wall;

/**
 *  更新数据模型
 */
- (void)updateSubUIInfo;

/**
 *  将墙体附加物转换为世界坐标系发送给PC端（参考点是墙体的起点坐标）
 */
- (void)convertWsubUIPositionToWorldCoordinate;

@end


typedef  enum{
    ZEWusbUIBtnHorizonDoor,
    ZEWusbUIBtnVerticalDoor,
    ZEWusbUIBtnHorizonWindow,
    ZEWusbUIBtnVerticalWindow,
    
}ZEWusbUIBtnType;

@interface ZEWusbUIBtn : UIButton

@property (nonatomic ,strong) CAShapeLayer * btnShapeLayer;

@property (nonatomic)ZEWusbUIBtnType shapeType;

@end
