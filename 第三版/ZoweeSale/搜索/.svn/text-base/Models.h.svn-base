//
//  Models.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface searchResultModel : NSObject
/**
 *  客户ID
 */
@property (nonatomic) NSNumber *CustomerID;
/**
 *  客户名称
 */
@property (nonatomic) NSString *Name;
/**
 *  客户地址
 */
@property (nonatomic) NSString *Address;
/**
 *  客户电话
 */
@property (nonatomic) NSString *Mobile;
@end


@interface searchHistoryManage : NSObject

+ (NSArray *)insertHistory:(NSString *)searchStr;

+ (NSArray *)clearAllHistory;

+ (NSArray *)allHistory;

@end