//
//  ZEFurnitureModel.h
//  ZoweeSale
//
//  Created by apple on 16/5/12.
//  Copyright © 2016年 TH. All rights reserved.
// 该模型主要用于toolTable的显示，比如门，窗，供用户拖动


typedef enum {
    ZEFurnitureTypeSingleOpenDoor = 0,//  单开门
    ZEFurnitureTypeDoubleOpenDoor = 1,// 双开门
    ZEFurnitureTypePushAndPullDoor = 2,// 推拉门
    ZEFurnitureTypeSingleWindow = 3,//单扇窗
    ZEFurnitureTypeBayWindow = 4, // 飘窗
    ZEFurnitureTypeFrenchWindow = 5,// 落地窗
}ZEFurnitureType;


typedef enum {
    ZEFurnitureGroupTypeDoor = 0, // 门
    ZEFurnitureGroupTypeWindow = 1, // 窗
}ZEFurnitureGroupType;

#import <Foundation/Foundation.h>

@interface ZEFurnitureModel : NSObject

/**
 *  家具组
 */

/**
 *  家具的名称
 */
@property(nonatomic,copy) NSString * furnitureName;

/**
 *  家具的尺寸
 */
@property(nonatomic,copy) NSString * furnitureSzie;

/**
 *  家具的图片
 */
@property(nonatomic,copy) NSString * furnitureIcon;

/**
 *  Integer
 附加物类型
 0 代表门 
 1代表窗 
 2 代表 墙柱 
 3代表双开门
 */
@property(nonatomic) ZEFurnitureType furnitureType;

/**
 *  附加物组
 */
@property(nonatomic) ZEFurnitureGroupType furnitureGroupType;

@end
