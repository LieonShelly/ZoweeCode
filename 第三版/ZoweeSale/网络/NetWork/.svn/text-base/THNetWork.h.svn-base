//
//  THNetWork.h
//  zowee_BusinessManage
//
//  Created by wanglj on 15/9/8.
//  Copyright (c) 2015年 zowee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "THNetWorkError.h"
#import "upLoadFile.h"
#import "UIViewController+showMsg.h"

@interface THNetWork : NSObject
//网络接口地址
@property (nonatomic, strong) NSString *urlStr;
//Token
@property (nonatomic, strong) NSString *token;
//设备唯一码UUID
@property (nonatomic, strong) NSString *uuid;
/**
 *  返回网络工具的单例类
 *
 *  @return THNetWork
 */
+ (instancetype)sharedInstance;
/**
 *  执行网络请求
 *
 *  @param action   网络请求的动作
 *  @param ParamDic 网络请求的请求参数字典
 *  @param block    网络请求返回代码块
 */
- (void)accessServerWithUIViewController:(UIViewController *)Controller WithAction:(NSString *)action WithParam:(NSDictionary *)ParamDic WithBlock:(void(^)(THNetWorkError *error, NSDictionary *dataDic))block;
/**
 *  取消所有网络请求
 */
- (void)cancelAllNetWork;

/**
 *  上传图片
 *
 *  @param parameter 上传参数
 *  @param action    上传地址
 *  @param loadFile  上传实体
 *  @param success   成功
 *  @param failure   失败
 */
- (void )creatUploadTaskWithParameters:(NSDictionary *)parameter Action:(NSString *)action  file:(upLoadFile *)loadFile success:(void (^)(id response))success failure:(void(^)(NSError * error))failure;

@end
