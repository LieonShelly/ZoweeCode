//
//  ZEWorkTool.h
//  ZoweeSale
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEBaseTool.h"
#import "ZETaskFinishRequesetParam.h"
#import "ZETaskFinishRequestResult.h"
#import "ZEFinishScaleTaskRequestResult.h"

@interface ZEWorkTool : ZEBaseTool

/**
 * 工作完成请求工具
 *
 *  @param controller 指定的控制器
 *  @param param       请求参数
 *  @param sucess     成功后返回的结果模型
 *  @param failure    失败后返回的结果模型
 */

+ (void)finishWorkTaskWithController:(UIViewController*)controller param:(id)param success:(void(^)( ZETaskFinishRequestResult* result))sucess failure:(void(^)(THNetWorkError *error))failure;

/**
 * 完成量尺任务请求工具
 *
 *  @param controller 指定的控制器
 *  @param param       请求参数
 *  @param sucess     成功后返回的结果模型
 *  @param failure    失败后返回的结果模型
 */

+ (void)finishScaleTaskWithController:(UIViewController*)controller param:(id)param success:(void(^)( ZEFinishScaleTaskRequestResult* result))sucess failure:(void(^)(THNetWorkError *error))failure;


@end
