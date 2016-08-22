//
//  ZEWorkTool.m
//  ZoweeSale
//
//  Created by apple on 16/3/14.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEWorkTool.h"

@implementation ZEWorkTool

+ (void)finishWorkTaskWithController:(UIViewController*)controller param:(id)param success:(void(^)( ZETaskFinishRequestResult* result))sucess failure:(void(^)(THNetWorkError *error))failure
{
    [self accseAction:@"FinishWorkTask" contronller:controller param:param resultClass:[ZETaskFinishRequestResult class] success:sucess failure:failure];
}

+ (void)finishScaleTaskWithController:(UIViewController *)controller param:(id)param success:(void (^)(ZEFinishScaleTaskRequestResult *))sucess failure:(void (^)(THNetWorkError *))failure
{
    [self accseAction:@"FinishScaleTask" contronller:controller param:param resultClass:[ZEFinishScaleTaskRequestResult class] success:sucess failure:failure];
}
@end
