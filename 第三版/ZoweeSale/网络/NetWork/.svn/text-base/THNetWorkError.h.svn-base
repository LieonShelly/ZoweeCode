//
//  THNetWorkError.h
//  zowee_BusinessManage
//
//  Created by wanglj on 15/9/8.
//  Copyright (c) 2015年 zowee. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    THErrorTypeService, //服务器错误
    THErrorTypeLocal //本地错误
}THNetWorkErrorType;

typedef enum{
    /** 服务器返回为空 */
    CODE_DATA_IS_NULL = 1000,
    /** 服务器返回r=0 */
    CODE_RESPONSE_CODE_ZERO = 1001,
    /** 数据解析不支持的格式 */
    CODE_PARSE_UNSUPPORTED_ENCODING = 1002,
    /** 网络超时 */
    CODE_TIME_OUT = 1003,
    /** 服务器无法访问 */
    CODE_SERVER_DISCONNECT = 1004,
    /** 数据解析错误 */
    CODE_PARSE_ERROR = 1005,
    /** 登录过期 */
    CODE_LOGIN_OUT = 1006,
    /** TOKEN验证失败 */
    CODE_TOKEN_ERROR = 1007,
    /** 秘钥验证失败 */
    CODE_SECRETKEY_ERROR = 1008,
    /** 无效的动作请求 */
    CODE_NULLACTION_ERROR = 1009,
    /** 错误的用户名或者密码 */
    CODE_LOGINUSER_ERROR = 1010,
    /** 无效的空对象 */
    CODE_NULLOBJECT_ERROR = 1011,
     /** 登录版本过低 */
    CODE_VERSIONLOW_ERROR = 1012,
    /**  登记客户重复*/
    CODE_USETREGISTER_ERROR = 1013,
    
    Local_Model_Error,//本地实例化错误
    other_Error//其他错误
}THNetWorkErrorCode;
@interface THNetWorkError : NSObject
/**
 *  错误类型
 */
@property(nonatomic,assign)THNetWorkErrorType errorType;
/**
 *  错误码
 */
@property(nonatomic,assign)THNetWorkErrorCode errorCode;
/**
 *错误描述
 */
@property(nonatomic,strong)NSString *errorDescription;
/**
 *  初始化错误
 *
 *  @param errrorType       错误类型
 *  @param errorCode        错误码
 *  @param errorDescription 错误描述
 *
 *  @return THNetWorkError
 */
+ (instancetype)initTHNetWorkErrorWithType:(THNetWorkErrorType)errorType withCode:(THNetWorkErrorCode)errorCode
                           withDescription:(NSString *)errorDescription;

@end
