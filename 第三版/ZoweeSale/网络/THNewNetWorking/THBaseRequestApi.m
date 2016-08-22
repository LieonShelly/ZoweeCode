//
//  THBaseRequestApi.m
//  YTKNetworkDemo
//
//  Created by wanglj on 16/6/8.
//  Copyright © 2016年 yuantiku.com. All rights reserved.
//

#import "THBaseRequestApi.h"
#import "YTKNetworkPrivate.h"
#import "UIViewController+showMsg.h"
#import "HZURLNavigation.h"
#import "CYLTabBarController.h"
#import <objc/runtime.h>
#import "ZEGrabCustomerResult.h"

@implementation THBaseRequestApi

- (instancetype)initWithAction:(NSString *)action Requestparameter:(NSDictionary *)parameter{
    self = [ self initWithAction:action Requestparameter:parameter cacheTime:-1 ];
    if (self) {

    }
    return self;
}

- (instancetype)initWithAction:(NSString *)action Requestparameter:(NSDictionary *)parameter cacheTime:(NSInteger)time{
    self = [self initWithAction:action Requestparameter:parameter cacheTime:time ModelClassName:@""];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithAction:(NSString *)action Requestparameter:(NSDictionary *)parameter ModelClassName:(NSString *)className{
    self = [self initWithAction:action Requestparameter:parameter cacheTime:-1 ModelClassName:className];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithAction:(NSString *)action Requestparameter:(NSDictionary *)parameter cacheTime:(NSInteger)time ModelClassName:(NSString *)className{
    self = [super init];
    if (self) {
        _action = action;
        _parameter = parameter;
        _cacheTime = time;
        _className = className;
    }
    return self;
}
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}
- (NSInteger)cacheTimeInSeconds {
    return _cacheTime;
}

- (id)requestArgument{
    NSAssert(_action != nil || _action.length > 0, @"请求动作不能为空");
    NSAssert(_parameter != nil, @"请求参数不能为空");
    NSString *argument = [THNetworkPrivate requestCryptographyWithAction:_action Parameter:_parameter];
    return argument;
}
/**
 *  开始时
 *
 *  @param request 网络请求
 */
- (void)requestWillStart:(id)request{
    [[HZURLNavigation currentViewController] showLodingMBProgressWithMsg];
}
/**
 *  结束时
 *
 *  @param request 网络请求po
 */
- (void)requestWillStop:(id)request{
    [[HZURLNavigation currentViewController] hideAllProgress];
}
- (id)responseJSONObject {
    THNetWorkBaseModel *model = (THNetWorkBaseModel *)[THNetworkPrivate decipheringWithResponeData:[super responseJSONObject]];
    if (model.r == resultTypeInvalid) {
        YTKLog(@"\n请求返回结构%@",model);
        [[HZURLNavigation currentViewController] showToastWithMsg:model.ErrMsg];
        [self checkedResponseErrorCode:model.Err];
        return nil;
    }
    return [self getResponeClassWith:model];
}

- (id)getResponeClassWith:(THNetWorkBaseModel *)Model{
    if (_className.isNoEmpty) {
        const char *className = [_className cStringUsingEncoding:NSASCIIStringEncoding];
        Class newclass = objc_getClass(className);
        if (!newclass) {
            return Model.d.ReturnParList;
        }
        id respone = [newclass mj_objectWithKeyValues:Model.d.ReturnParList];
        if (respone) {
            return respone;
        }
        respone = [newclass mj_objectArrayWithKeyValuesArray:Model.d.ReturnParList];
        if (respone) {
            return respone;
        }
    }
    return Model.d.ReturnParList;
}

- (void)checkedResponseErrorCode:(NetworkResponeError)error{
    UIViewController *controller = [HZURLNavigation currentViewController];
    if (error == NCODE_LOGINUSER_ERROR)  {
        [controller showToastWithMsg:@"用户名或密码错误"];
    }else if (error == NCODE_LOGIN_OUT){
        if (![userManager sharedInstance].islogin) {
            return;
        }
        [[userManager sharedInstance] userUnLogin];
    }else if (error == NCODE_TOKEN_ERROR){
        [controller showToastWithMsg:@"TOKEN验证失败"];
    }else if (error == NCODE_SECRETKEY_ERROR){
        [controller showToastWithMsg:@"密匙验证失败"];
    }else if (error == NCODE_NULLACTION_ERROR){
        [controller showToastWithMsg:@"无效的动作请求"];
    }
}
@end
