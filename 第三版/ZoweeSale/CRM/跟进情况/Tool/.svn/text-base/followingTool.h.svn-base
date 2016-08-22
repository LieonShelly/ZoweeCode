//
//  followingTool.h
//  ZoweeSale
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "followingStatusResponseResult.h"
#import "followingRequestParam.h"
#import "THNetWork.h"

@interface followingTool : NSObject

/**
 * *  跟进情况网络请求工具
 *
 *  @param param         请求参数
 *  @param follwoingInfo 网络返回的请求情况,请求成功返回服务器的结果模型,请求失败返回错误信息
 *  @param controller    指定的控制器
 */
+ (void)followingStatusWithController:(UIViewController*)controller param:(followingRequestParam *)param success:(void(^)(followingStatusResponseResult *result))sucess failure:(void(^)(THNetWorkError *error))failure;

@end
