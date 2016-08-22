//
//  followingTool.m
//  ZoweeSale
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "followingTool.h"
#import "THNetWork.h"
#import "MJExtension.h"


@implementation followingTool

+ (void)followingStatusWithController:(UIViewController *)controller param:(followingRequestParam *)param success:(void (^)(followingStatusResponseResult * result))sucess failure:(void (^)(THNetWorkError * error))failure
{
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"LoadCustomerFollowInfo" WithParam:[param mj_keyValues] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        
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
@end
