//
//  ZECustomerInfoTool.m
//  ZoweeSale
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECustomerInfoTool.h"
#import "THNetWork.h"
#import "MJExtension.h"


@implementation ZECustomerInfoTool

+ (void)followingStatusWithController:(UIViewController *)controller param:(followingRequestParam *)param success:(void (^)(followingStatusResponseResult * result))sucess failure:(void (^)(THNetWorkError * error))failure
{
    
// 1. 从文件中读取
    NSArray * parlist = [NSArray arrayWithContentsOfFile:customerDetailItemPath];
    if (parlist.count > 0) {
        
        NSDictionary * dict  = @{@"ReturnParList":parlist};
        // 字典转模型
        followingStatusResponseResult * obj = [followingStatusResponseResult mj_objectWithKeyValues:dict];
        sucess(obj);
    }else // 2.文件中没有，则从服务器中获取
    {
        
        [controller showLodingMBProgressWithMsg];
        [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"LoadCustomerFollowInfo" WithParam:[param mj_keyValues] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
            [controller hideAllProgress];
            if(error)
            {
                failure(error); //  block回调
            }else // 成功,返回结果模型
            {
                // 字典转模型
                followingStatusResponseResult * obj = [followingStatusResponseResult mj_objectWithKeyValues:dataDic];
                sucess(obj);
            }
        }];
    }
    
}

+ (void)customerActivityWithController:(UIViewController *)controller param:(ZECustomerActivityRequestParam *)param success:(void (^)(ZECustomerActivityRequestResult *))sucess failure:(void (^)(THNetWorkError *))failure
{
    // 1. 从文件中读取
    NSArray * parlist = [NSArray arrayWithContentsOfFile:customerDetailItemPath];
    if (parlist.count > 0) {
        
        NSDictionary * dict  = @{@"ReturnParList":parlist};
        // 字典转模型
        ZECustomerActivityRequestResult * obj = [ZECustomerActivityRequestResult mj_objectWithKeyValues:dict];
        sucess(obj);
    }else{
        [controller showLodingMBProgressWithMsg];
        [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"LoadCustomerStateInfo" WithParam:[param mj_keyValues] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
            [controller hideAllProgress];
            if(error)
            {
                failure(error); //  block回调
            }else // 成功,返回结果模型
            {
                // 字典转模型
                ZECustomerActivityRequestResult * obj = [ZECustomerActivityRequestResult mj_objectWithKeyValues:dataDic];
                sucess(obj);
            }
            
        }];

    }
}

+ (void)customerTeamWithController:(UIViewController *)controller param:(ZECustomerTeamRequsestParam *)param success:(void (^)(ZECustomerTeamRequestResult *))sucess failure:(void (^)(THNetWorkError *))failure
{
    // 1. 从文件中读取
    NSArray * parlist = [NSArray arrayWithContentsOfFile:customerDetailItemPath];
    if (parlist.count > 0) {
        
        NSDictionary * dict  = @{@"ReturnParList":parlist};
        // 字典转模型
        ZECustomerTeamRequestResult * obj = [ZECustomerTeamRequestResult mj_objectWithKeyValues:dict];
        sucess(obj);
    }else{
        [controller showLodingMBProgressWithMsg];
        [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"LoadCustomerTeamInfo" WithParam:[param mj_keyValues] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
            [controller hideAllProgress];
            if(error)
            {
                failure(error); //  block回调
            }else // 成功,返回结果模型
            {
                //            lieonLog(@"%@",dataDic);
                // 字典转模型
                ZECustomerTeamRequestResult * obj = [ZECustomerTeamRequestResult mj_objectWithKeyValues:dataDic];
                sucess(obj);
            }
            
        }];
    }
   

}

+(void)customerBaseInfoWithController:(UIViewController *)controller param:(ZEZECustomerBasicRequsestParam *)param success:(void (^)(ZECustomerBaseInfo *))sucess failure:(void (^)(THNetWorkError *))failure
{
    // 1. 从文件中读取
    NSDictionary * parlist = [NSDictionary dictionaryWithContentsOfFile:customerDetailItemPath];
    if (parlist.count > 0) {
        
        // 字典转模型
        ZECustomerBaseInfo * obj = [ZECustomerBaseInfo mj_objectWithKeyValues:parlist];
        sucess(obj);
    }else{
        [controller showLodingMBProgressWithMsg];
        [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"LoadCustomerBaseInfo" WithParam:[param mj_keyValues] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
            [controller hideAllProgress];
            if(error)
            {
                failure(error); //  block回调
            }else // 成功,返回结果模型
            {
                // 字典转模型
                ZECustomerBaseInfo * obj = [ZECustomerBaseInfo mj_objectWithKeyValues:dataDic[@"ReturnParList"]];
                NSLog(@"obj:%@",obj.CustomerName);
                sucess(obj);
            }
            
        }];

    }
   }

+ (void)followFinishTaskWithController:(UIViewController *)controller param:(ZEFollowFinishTaskRequestParam *)param success:(void (^)(ZEFollowFinishTaskRequestResult*))sucess failure:(void (^)(THNetWorkError *))failure
{
    [self accseAction:@"FollowFinishTask" contronller:controller param:param resultClass:[ZEFollowFinishTaskRequestResult class] success:sucess failure:failure];
}


+ (void)loadFollowTypeWithController:(UIViewController *)controller param:(id)param success:(void (^)(ZELoadFollowTypeRequestResult *))sucess failure:(void (^)(THNetWorkError *))failure
{
    [self accseAction:@"LoadFollowType" contronller:controller param:param resultClass:[ZELoadFollowTypeRequestResult class] success:sucess failure:failure];
}

@end
