//
//  ZEQXTool.m
//  ZoweeSale
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#define userInfoFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"userInfo.data"]

#import "ZEQXTool.h"


@interface ZEQXTool ()
{
    // 企信模型数据
    NSArray * _QXes;
    BOOL _imageNeedCache;
}

@property(nonatomic,strong) NSMutableArray * selectedCityNames;
@end

@implementation ZEQXTool
singleton_implementation(ZEQXTool)


- (void)setNeedCache:(BOOL)needCache
{
    _needCache = needCache;
    _imageNeedCache = needCache;
}

+ (void)QXWithController:(UIViewController*)controller param:(id)param success:(void(^)( ZEQXRequestResult* result))sucess failure:(void(^)(THNetWorkError *error))failure
{
    [self accseAction:@"LoadBusinessLetterList" contronller:controller param:param resultClass:[ZEQXRequestResult class] success:sucess failure:failure];
}

+ (void)NoticeListWithController:(UIViewController *)controller param:(id)param success:(void (^)(ZELoadNoticeListRequestResult *))sucess failure:(void (^)(THNetWorkError *))failure
{
    [self accseAction:@"LoadNoticeList" contronller:controller param:param resultClass:[ZELoadNoticeListRequestResult class] success:sucess failure:failure];
}

+ (void)userDetailWithController:(UIViewController *)controller param:(id)param success:(void (^)(ZEPersonalInfo *))sucess failure:(void (^)(THNetWorkError *))failure
{
    [[THNetWork sharedInstance]accessServerWithUIViewController:controller WithAction:@"UserDetail" WithParam:param WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        if (sucess) {
            ZEPersonalInfo * info = [ZEPersonalInfo mj_objectWithKeyValues:dataDic[@"ReturnParList"]];
            sucess(info);
        }else
        {
            failure(error);
        }
        
    }];
}

+ (void)saveUseInfo:(ZEPersonalInfo *)info
{
 
    [NSKeyedArchiver archiveRootObject:info toFile: userInfoFilePath];
}

+ (ZEPersonalInfo *)userInfo
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:userInfoFilePath];
}


+ (void)clearUserInfo
{
    [NSKeyedArchiver archiveRootObject:@" " toFile: userInfoFilePath];
}
- (void)loadUserInfoInController:(UIViewController*)vc showFailure:(void(^)(THNetWorkError*error))failure
{
    
    
    [ZEQXTool userDetailWithController:vc param:[NSDictionary dictionary] success:^(ZEPersonalInfo *result) {
        
        lieonLog(@"result:%@",result.HeadUrl);
        // 存储用户信息
        [ZEQXTool saveUseInfo:result];
        
    } failure:^(THNetWorkError *error) {
        failure(error);
    }];
}

@end
