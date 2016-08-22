//
//  ZEPersonalInfo.h
//  ZoweeSale
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface ZEPersonalInfo : NSObject

/**
 *  DepartmentID
 Integer
 部门ID
 */
@property(nonatomic,assign) NSInteger  TypeDepartmentID;


/**
 *  String
 姓名
 */
@property(nonatomic,copy) NSString * Name;
/**
 *
 String
 部门

 */

@property(nonatomic,copy) NSString *TypeDepartmentName;


/**
 *  String
 用户电话
 */
@property(nonatomic,copy) NSString * Mobile;

/**
 *  头像的url
 */
@property(nonatomic,copy) NSString * HeadUrl;
@end
