//
//  THNetWorkBaseModel.h
//  YTKNetworkDemo
//
//  Created by wanglj on 16/6/8.
//  Copyright © 2016年 yuantiku.com. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, NetworkResponeError) {
    /** 服务器返回为空 */
    NCODE_DATA_IS_NULL = 1000,
    /** 服务器返回r=0 */
    NCODE_RESPONSE_CODE_ZERO = 1001,
    /** 数据解析不支持的格式 */
    NCODE_PARSE_UNSUPPORTED_ENCODING = 1002,
    /** 网络超时 */
    NCODE_TIME_OUT = 1003,
    /** 服务器无法访问 */
    NCODE_SERVER_DISCONNECT = 1004,
    /** 数据解析错误 */
    NCODE_PARSE_ERROR = 1005,
    /** 登录过期 */
    NCODE_LOGIN_OUT = 1006,
    /** TOKEN验证失败 */
    NCODE_TOKEN_ERROR = 1007,
    /** 秘钥验证失败 */
    NCODE_SECRETKEY_ERROR = 1008,
    /** 无效的动作请求 */
    NCODE_NULLACTION_ERROR = 1009,
    /** 错误的用户名或者密码 */
    NCODE_LOGINUSER_ERROR = 1010,
    /** 无效的空对象 */
    NCODE_NULLOBJECT_ERROR = 1011,
    /** 登录版本过低 */
    NCODE_VERSIONLOW_ERROR = 1012,
    /**  数据验证失败*/
    NCODE_UZHENSHENQI_ERROR = 1013,
    /**  无操作权限*/
    NCODE_NULLPOWER_ERROR = 1014,
    /**  验证码错误*/
    NCODE_XYJ_ERROR = 1015,
    /**  账号重复*/
    NCODE_ACCOUNT_ERROR = 1016,
    
 
    
    NLocal_Model_Error,//本地实例化错误
    Nother_Error//其他错误
};

typedef NS_ENUM(NSUInteger, resultType) {
    resultTypeInvalid = 0,//失效,错误
    resultTypeEffective = 1,//有效,成功
};

@interface Body : NSObject<NSCoding>

//@property (nonatomic,assign) resultType Result;

@property (nonatomic,strong) id ReturnParList;

@end

@interface THNetWorkBaseModel : NSObject<NSCoding>

@property (nonatomic,assign) resultType r;

@property (nonatomic,assign) NetworkResponeError Err;

@property (nonatomic,copy) NSString *ErrMsg;

@property (nonatomic,strong) id d;

@end
