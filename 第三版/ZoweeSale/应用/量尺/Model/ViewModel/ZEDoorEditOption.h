//
//  ZEDoorEditOption.h
//  ZoweeSale
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//  点击单个门的编辑功能模型

#import <Foundation/Foundation.h>

typedef void(^funcBlock)() ;

@interface ZEDoorEditOption : NSObject

/**
 *  图标的名称
 */
@property(nonatomic,copy) NSString * iconName;
/**
 *  对门编辑的功能名称
 */
@property(nonatomic,copy) NSString * title;

/**
 *  对应的功能
 */
@property(nonatomic,copy) funcBlock function;

- (instancetype)initWithIconName:(NSString*)iconName function:(funcBlock)f title:(NSString*)title;

@end
