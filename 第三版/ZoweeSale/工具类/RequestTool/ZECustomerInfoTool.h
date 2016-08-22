//
//  ZECustomerInfoTool.h
//  ZoweeSale
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "followingStatusResponseResult.h"
#import "followingRequestParam.h"
#import "THNetWork.h"
#import "ZECustomerActivityRequestParam.h"
#import "ZECustomerActivityRequestResult.h"
#import "ZECustomerTeamRequestResult.h"
#import "ZECustomerTeamRequsestParam.h"
#import "ZECustomerBaseInfo.h"
#import "ZEZECustomerBasicRequsestParam.h"
#import "ZECustomerBasicInfoRequestResult.h"
#import "ZEBaseTool.h"
#import "ZEFollowFinishTaskRequestParam.h"
#import "ZELoadFollowTypeRequestResult.h"
#import "ZEFollowFinishTaskRequestResult.h"
#import "ZETaskFinishRequesetParam.h"

@interface ZECustomerInfoTool : ZEBaseTool

/**
*  跟进情况网络请求工具
*
*  @param controller 指定的控制器
*  @param param       请求参数
*  @param sucess     成功后返回的结果模型
*  @param failure    失败后返回的结果模型
*/

+ (void)followingStatusWithController:(UIViewController*)controller param:(followingRequestParam *)param success:(void(^)(followingStatusResponseResult *result))sucess failure:(void(^)(THNetWorkError *error))failure;


/**
 *  客户动态网络请求工具
 *
 *  @param controller 指定的控制器
 *  @param param       请求参数
 *  @param sucess     成功后返回的结果模型
 *  @param failure    失败后返回的结果模型
 */

+ (void)customerActivityWithController:(UIViewController*)controller param:(ZECustomerActivityRequestParam *)param success:(void(^)(ZECustomerActivityRequestResult *result))sucess failure:(void(^)(THNetWorkError *error))failure;

/**
 *  客户服务团队请求工具
 *
 *  @param controller 指定的控制器
 *  @param param       请求参数
 *  @param sucess     成功后返回的结果模型
 *  @param failure    失败后返回的结果模型
 */

+ (void)customerTeamWithController:(UIViewController*)controller param:(ZECustomerTeamRequsestParam *)param success:(void(^)(ZECustomerTeamRequestResult *result))sucess failure:(void(^)(THNetWorkError *error))failure;

/**
 *  客户基本信息请求工具
 *
 *  @param controller 指定的控制器
 *  @param param       请求参数
 *  @param sucess     成功后返回的结果模型
 *  @param failure    失败后返回的结果模型
 */

+ (void)customerBaseInfoWithController:(UIViewController*)controller param:(ZEZECustomerBasicRequsestParam *)param success:(void(^)(ZECustomerBaseInfo *result))sucess failure:(void(^)(THNetWorkError *error))failure;

/**
 *  完成跟进任务请求工具
 *
 *  @param controller 指定的控制器
 *  @param param       请求参数
 *  @param sucess     成功后返回的结果模型
 *  @param failure    失败后返回的结果模型
 */

+ (void)followFinishTaskWithController:(UIViewController*)controller param:(ZEFollowFinishTaskRequestParam *)param success:(void(^)( ZEFollowFinishTaskRequestResult *result))sucess failure:(void(^)(THNetWorkError *error))failure;


/**
 *  加载跟进类型请求工具
 *
 *  @param controller 指定的控制器
 *  @param param       请求参数
 *  @param sucess     成功后返回的结果模型
 *  @param failure    失败后返回的结果模型
 */

+ (void)loadFollowTypeWithController:(UIViewController*)controller param:(id)param success:(void(^)( ZELoadFollowTypeRequestResult* result))sucess failure:(void(^)(THNetWorkError *error))failure;



@end
