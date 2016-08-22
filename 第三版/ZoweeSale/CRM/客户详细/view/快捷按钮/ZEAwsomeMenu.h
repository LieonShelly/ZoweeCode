//
//  ZEAwsomeMenu.h
//  ZoweeSale
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 TH. All rights reserved.
//  弹出菜单

#import <UIKit/UIKit.h>

@class ZEAwsomeMenu;
@protocol ZEAwsomeMenuDelegate <NSObject>

@optional

- (void)awsomeMenuBtnClick:(NSInteger)index;

@end
@interface ZEAwsomeMenu : UIView


/**
 *  CustomerOperationType	String	客户可操作类型
 1,交付定金
 2,量尺出图
 3,图纸审核
 4,价格审核
 5,合同签约
 6客户流失
 */

@property(nonatomic,copy)  NSString * CustomerOperationType;


@property(nonatomic,weak) id<ZEAwsomeMenuDelegate>  delegate;

@property (nonatomic,strong) NSArray * indexArray;

@end
