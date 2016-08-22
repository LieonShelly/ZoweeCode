//
//  ApplicationManage.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "THNetWork.h"
#import "workZoneModel.h"
#import "ZEOrderInfo.h"
#import "ZEImageInfo.h"
#import "ZESendRulerTaskParam.h"
#import "ZESendRulerTaskResult.h"
#import "ZEBaseTool.h"


@interface ApplicationManage : ZEBaseTool

+ (instancetype)shareManage;
/**
 *  获取朋友圈
 *
 *  @param page       页码
 *  @param MaxID      最大编号
 *  @param controller 请求页面
 *  @param block      返回结果
 */
- (void)LoadCircleWorkListWithPage:(NSNumber *)page MaxID:(NSNumber *)MaxID Controller:(UIViewController *)controller Block:(void(^)(THNetWorkError *error,workZoneList *list))block;

/**
 *  量尺首页列表
 *
 *  @param block 请求返回
 */
- (void)GetProjectListBlock:(void(^)(THNetWorkError *error,NSArray *list))block;
/**
 *  保存量尺房间数据
 *
 *  @param block 请求结果
 */
- (void)SaveProjectInfoWith:(ZEOrderInfo *)orderInfo Block:(void(^)(THNetWorkError *error,NSNumber *projectID))block;



/**
 *  获取量尺房间数据
 *
 *  @param projectID 订单ID;
 *  @param block     请求结果
 */
- (void)GetJsonDataWith:(NSNumber *)projectID Block:(void(^)(THNetWorkError *error,ZEOrderInfo *orderINfo))block;
/**
 *  保存量尺图片
 *
 *  @param image iamge
 *  @param block 请求
 */
- (void)SaveProjectImageWiith:(ZEImageInfo *)image file:(upLoadFile *)loadFile Block:(void(^)(THNetWorkError *error,NSNumber *ID))block;

/**
 *  获取相册图片
 *
 *  @param projectID 订单ID
 *  @param block     请求结果
 */
- (void)loadProjectImageWith:(NSNumber *)projectID Block:(void(^)(THNetWorkError *error,NSArray *imageList))block;
/**
 *  获取派尺客户列表
 *
 *  @param block 返回
 */
- (void)SendRulerCustomerListWithBlock:(void(^)(THNetWorkError *error,NSArray *customers))block;
/**
 *  提交派尺
 *
 *  @param parm  请求参数
 *  @param block 返回
 */
- (void)SaveSendRulerTaskWithParm:(NSDictionary *)parm Block:(void(^)(THNetWorkError *error))block;


/**
 *  查看量尺任务列表
 */
+ (void)sendRulerTaskLisWithParma:(ZESendRulerTaskParam*)param success:(void(^)(ZESendRulerTaskResult* result))success failure:(void(^)(THNetWorkError* error))failure;


@end
