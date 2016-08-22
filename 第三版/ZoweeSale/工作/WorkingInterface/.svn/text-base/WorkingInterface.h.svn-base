//
//  WorkingInterface.h
//  ZoweeSale
//
//  Created by apple on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "THNetWork.h"
#import "workDetailed.h"

@interface WorkingInterface : NSObject

+ (instancetype)shareWorkInstance;



/**
 *  工作列表
 *
 *  @param viewcontroller 请求界面
 *  @param parma          请求参数
 *  @param block          返回结果
 */
- (void)WorkTableViewController:(UIViewController *)viewcontroller ParmaDIC:(NSDictionary *)parma withBlock:(void(^)(THNetWorkError * error,NSDictionary * dic))block;
/**
 *  工作详情
 *
 *  @param controller 请求界面
 *  @param parma      请求参数
 *  @param block      返回结果
 */
- (void)workDetailWithController:(UIViewController *)controller ParmaDic:(NSDictionary *)parma Withblock:(void(^)(THNetWorkError *error,workDetailed *detail))block;
/**
 *  工作完成
 *
 *  @param controller 请求页面
 *  @param parma      请求参数
 *  @param block      返回结果
 */
- (void)workFinishWithController:(UIViewController *)controller ParmaDic:(NSDictionary *)parma Withblock:(void(^)(THNetWorkError *error))block;

@end
