//
//  THNetWorkError.m
//  zowee_BusinessManage
//
//  Created by wanglj on 15/9/8.
//  Copyright (c) 2015年 zowee. All rights reserved.
//

#import "THNetWorkError.h"

@implementation THNetWorkError

+ (instancetype)initTHNetWorkErrorWithType:(THNetWorkErrorType)errorType withCode:(THNetWorkErrorCode)errorCode withDescription:(NSString *)errorDescription{
    THNetWorkError *error = [[THNetWorkError alloc]init];
    error.errorType = errorType;
    error.errorCode = errorCode;
    error.errorDescription = errorDescription;
    return error;
}

@end
