//
//  ZEBaseTool.m
//  ZoweeSale
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEBaseTool.h"
#import "MJExtension.h"

@implementation ZEBaseTool

+ (void)accseAction:(NSString *)action contronller:(UIViewController *)VC param:(id)param resultClass:(Class)resultClass success:(void (^)(id result))success failure:(void (^)(THNetWorkError *error))failure
{
    
    [[THNetWork sharedInstance] accessServerWithUIViewController:VC WithAction:action WithParam:[param mj_keyValues] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        
        if(success){
            id result = [resultClass mj_objectWithKeyValues:dataDic];
            success(result);
        }else{
            failure(error);
            lieonLog(@"%@",error.errorDescription);
        }
    }];
}
@end
