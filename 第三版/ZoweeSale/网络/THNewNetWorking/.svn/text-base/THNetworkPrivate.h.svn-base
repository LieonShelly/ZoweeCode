//
//  THNetworkPrivate.h
//  YTKNetworkDemo
//
//  Created by wanglj on 16/6/8.
//  Copyright © 2016年 yuantiku.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "THNetWorkBaseModel.h"

/*
 提供请求参数的格式化加密和返回数据的解密
 */
@interface THNetworkPrivate : NSObject
/**
 *  根据请求的action和parameter加密
 *
 *  @param action    请求动作
 *  @param parameter 参数
 *
 *  @return 加密后数据
 */
+ (NSString *)requestCryptographyWithAction:(NSString *)action Parameter:(NSDictionary *)parameter;

/**
 *  网络返回数据解析
 *
 *  @param responeData 返回数据
 *
 *  @return 解密后数据
 */
+ (NSDictionary *)decipheringWithResponeData:(NSData *)responeData;

@end
