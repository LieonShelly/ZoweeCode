//
//  THBaseRequestApi.h
//  YTKNetworkDemo
//
//  Created by wanglj on 16/6/8.
//  Copyright © 2016年 yuantiku.com. All rights reserved.
//

#import "YTKRequest.h"
#import "THNetworkPrivate.h"

#define oneMinute  60
#define threeMinute  60*3
#define oneHour  60*60

@interface THBaseRequestApi : YTKRequest<YTKRequestAccessory>
/*
1. 继承本类的请求,不用自己去传递请求参数,会自动根据action和parameter通过各种加密合成正确的请求参数.
 - (id)requestArgument;重写会出错
2.THuploadApi 是上传图片 可以重写 requestArgument;
2. 统一使用post方法
 - (YTKRequestMethod)requestMethod {
 return YTKRequestMethodPost;
 }

*/
//

@property (nonatomic,readonly,copy) NSDictionary *parameter;

@property (nonatomic,readonly,copy) NSString *action;
/**
 *  缓存有效时间
 */
@property (nonatomic,readonly,assign) NSInteger cacheTime;
/**
 *  模型类名
 */
@property (nonatomic,readonly,copy) NSString *className;


/**
 *  基本请求初始化方法
 *
 *  @param action    请求动作
 *  @param parameter 参数
 *
 *  @return 请求
 */
- (instancetype)initWithAction:(NSString *)action Requestparameter:(NSDictionary *)parameter;
/**
 *  有缓存时间的初始化方法
 *
 *  @param action    请求动作
 *  @param parameter 参数
 *  @param time      缓存时间
 *
 *  @return 请求
 */
- (instancetype)initWithAction:(NSString *)action Requestparameter:(NSDictionary *)parameter cacheTime:(NSInteger)time;

/**
 *  有模型的初始化方法
 *
 *  @param action    请求动作
 *  @param parameter 请求参数
 *  @param className 模型名
 *
 *  @return 请求
 */
- (instancetype)initWithAction:(NSString *)action Requestparameter:(NSDictionary *)parameter ModelClassName:(NSString *)className;

/**
 *  有缓存时间和模型类名的初始化方法
 *
 *  @param action    请求动作
 *  @param parameter 请求参数
 *  @param time      缓存时间
 *  @param className 模型名
 *
 *  @return 请求
 */
- (instancetype)initWithAction:(NSString *)action Requestparameter:(NSDictionary *)parameter cacheTime:(NSInteger)time ModelClassName:(NSString *)className;
@end
