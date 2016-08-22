//
//  followingStatusResponseResult.h
//  ZoweeSale
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 TH. All rights reserved.
// 从服务器放回的跟进情况结果模型

#import <Foundation/Foundation.h>

@interface followingStatusResponseResult : NSObject
/** 存放跟进情况模型 */
@property (nonatomic,strong) NSArray * ReturnParList;
/** 返回结果的状态码*/
@property(nonatomic,assign) NSInteger Result;

@end
