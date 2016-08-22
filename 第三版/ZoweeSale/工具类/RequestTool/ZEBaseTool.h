//
//  ZEBaseTool.h
//  ZoweeSale
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "THBaseRequestApi.h"

@interface ZEBaseTool : THBaseRequestApi


/**
 *  所有的网络请求类，继承该类就行，不用再写block回调
 */
+ (void)accseAction:(NSString *)action contronller:(UIViewController *)VC param:(id)param resultClass:(Class)resultClass success:(void (^)(id result))success failure:(void (^)(THNetWorkError *error))failure;

@end
