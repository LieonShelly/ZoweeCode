//
//  ZEQXTool.h
//  ZoweeSale
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZEQX.h"
#import "Singleton.h"
#import "ZEBaseTool.h"
#import "ZEQXRequestResult.h"
#import "ZELoadNoticeListRequestParam.h"
#import "ZELoadNoticeListRequestResult.h"
#import "ZEPersonalInfo.h"



@interface ZEQXTool : ZEBaseTool

singleton_interface(ZEQXTool)
@property(nonatomic,getter=isNeedCache) BOOL needCache;

/**
 *  返回企信模型
 */
@property(nonatomic,strong,readonly) NSArray * QXes;

/**
 * 企信完成请求工具
 *
 *  @param controller 指定的控制器
 *  @param param       请求参数
 *  @param sucess     成功后返回的结果模型
 *  @param failure    失败后返回的结果模型
 */

+ (void)QXWithController:(UIViewController*)controller param:(id)param success:(void(^)( ZEQXRequestResult* result))sucess failure:(void(^)(THNetWorkError *error))failure;

/**
 * 集团公告完成请求工具
 *
 *  @param controller 指定的控制器
 *  @param param       请求参数
 *  @param sucess     成功后返回的结果模型
 *  @param failure    失败后返回的结果模型
 */

+ (void)NoticeListWithController:(UIViewController*)controller param:(id)param success:(void(^)(ZELoadNoticeListRequestResult* result))sucess failure:(void(^)(THNetWorkError *error))failure;

/**
 * 用户信息请求工具
 *
 *  @param controller 指定的控制器
 *  @param param       请求参数
 *  @param sucess     成功后返回的结果模型
 *  @param failure    失败后返回的结果模型
 */

+ (void)userDetailWithController:(UIViewController*)controller param:(id)param success:(void(^)(ZEPersonalInfo * result))sucess failure:(void(^)(THNetWorkError *error))failure;

/**
 * 存储用户信息
 */
+ (void)saveUseInfo:(ZEPersonalInfo*)info;

/**
 *  读取用户信息
 *
 *  @return ZEPersonalInfo
 */
+ (ZEPersonalInfo*)userInfo;

/**
 *  清除用户信息
 */
+ (void)clearUserInfo;

/**
 *  从网络上加载用户信息,进行存储
 */
- (void)loadUserInfoInController:(UIViewController*)vc showFailure:(void(^)(THNetWorkError*error))failure;
@end
