//
//  ZETagModel.m
//  ZoweeSale
//
//  Created by lieon on 16/7/13.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZETagModel.h"

@interface ZETagModel()
@end
@implementation ZETagModel


//
/**
 *  
 
 风格: -135
 户型: -139
 空间:-134
 */
- (void)setGroupID:(NSNumber *)GroupID
{
    _GroupID = GroupID;
    switch (GroupID.integerValue) {
            
            
        case -135: // 风格
            self.type = ZETagModelTypeStyle;
            break;
            
            
        case -139: // 户型
            self.type = ZETagModelTypeHourseType;
            break;
            
        case -134: // 空间
            self.type = ZETagModelTypeRoomType;
            break;
         
            
        default:
            break;
    }
}

/**
 *  /
 风格: -135
 */
+ (void)requestStyle:(TagModelBlock)tagBlock failure:(YTKRequestCompletionBlock)failure
{
    THBaseRequestApi * api = [[THBaseRequestApi alloc]initWithAction:@"LoadTagList" Requestparameter:@{@"GroupIDList":@"-135 "} cacheTime:60];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSArray * models = [ZETagModel mj_objectArrayWithKeyValuesArray:request.responseJSONObject];
        tagBlock(models);
        
    } failure:^(__kindof YTKBaseRequest *request) {
        failure(request);
    }];
}

/**
 空间:-134
 */
+ (void)requestRoomType:(TagModelBlock)tagBlock failure:(YTKRequestCompletionBlock)failure
{
    THBaseRequestApi * api = [[THBaseRequestApi alloc]initWithAction:@"LoadTagList" Requestparameter:@{@"GroupIDList":@"-134 "} cacheTime:60];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSArray * models = [ZETagModel mj_objectArrayWithKeyValuesArray:request.responseJSONObject];
        tagBlock(models);
    } failure:^(__kindof YTKBaseRequest *request) {
        failure(request);

    }];
}

/**
 户型: -139
 */
+ (void)requestHourseType:(TagModelBlock)tagBlock failure:(YTKRequestCompletionBlock)failure
{
    THBaseRequestApi * api = [[THBaseRequestApi alloc]initWithAction:@"LoadTagList" Requestparameter:@{@"GroupIDList":@"-139 "} cacheTime:60];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSArray * models = [ZETagModel mj_objectArrayWithKeyValuesArray:request.responseJSONObject];
        tagBlock(models);
    } failure:^(__kindof YTKBaseRequest *request) {
        failure(request);
        
    }];
}


@end
