//
//  ZEMeasureTool.h
//  ZoweeSale
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "ZEDoorEditOption.h"
#import "ZEWallEditOption.h"
#import <UIKit/UIKit.h>
#import "ZEMarkArrowModel.h"

@class ZEMeasureTool;
@protocol ZEMeasureToolDelegate <NSObject>

@optional
- (void)measureTool:(ZEMeasureTool*)tool didSelectedModel:(Class)modelClass;

@end

@interface ZEMeasureTool : NSObject <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

singleton_interface(ZEMeasureTool)

@property (nonatomic,weak) id<ZEMeasureToolDelegate>delegate;

- (NSArray*)doorEditOptions;
- (NSArray*)wallEditOptions;
- (NSArray*)appendingObjects;

/**
 *  返回两点之间的距离
 * 
 */
- (CGFloat)distanceBetweenTwoPointsFirstPoint:(CGPoint)firstPoint secondPoint:(CGPoint)secondPoint;

/**
 *  返回需要旋转的角度
 */
- (CGFloat)rotateAngleWithFirstPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/**
 *  返回两点之间的中心点
 */
- (CGPoint)centerBetweenTwoPionts:(CGPoint)startPoint AndEndPoint:(CGPoint)endPoint;

/**
 *  返回两点之间最小的点（即找到x1,y1,x2,y2中两个最小的xy值）
*/

- (CGPoint)minimunPointBetweenStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/**
 *  返回两个点所在矩形的尺寸
 */
- (CGSize)rectSizePointBetweenStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

/**
 * 模拟返回窗的数据模型数组
 */
- (NSArray*)furnitureModelWithWindows;

/**
 *  模拟返回门的数据模型数组
 */
- (NSArray*)furnitureModelWithDoors;

/**
 *  保存拍照标注的标注数据
 */
+ (void)saveMarkArrowModel:(ZEMarkArrowModel*)model;

/**
 *  清除拍照标注的标注数据
 */
+ (void)clearMarkArrowModel;
/**
 *   返回拍照标注的数据
 */
+ (ZEMarkArrowModel*)markArrowModel;

@end
