//
//  WorkingInterface.m
//  ZoweeSale
//
//  Created by apple on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "WorkingInterface.h"
#import "ZeroWork.h"
#import "MJExtension.h"

@implementation WorkingInterface
static WorkingInterface * workITF = nil;
+ (instancetype)shareWorkInstance {
    static dispatch_once_t once;
    dispatch_once(&once ,^{
        workITF = [[WorkingInterface alloc] init];
    }
    );
    return workITF;
}

- (void)WorkTableViewController:(UIViewController *)viewcontroller ParmaDIC:(NSDictionary *)parma withBlock:(void (^)(THNetWorkError *,  NSDictionary*))block {
    [[THNetWork sharedInstance] accessServerWithUIViewController:viewcontroller WithAction:@"LoadWorkList" WithParam:parma WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"工作列表读取失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
            NSMutableArray *workList = [NSMutableArray array];
            for (NSDictionary *dic in ReturnParList) {
                if ([dic[@"TypeID"]isEqual:@0]) {
                    NSArray *work = dic[@"WorkList"];
                    work = [ZeroWork mj_objectArrayWithKeyValuesArray:work];
                    [workList addObjectsFromArray:work];
                }
            }
            NSDictionary *reDic = @{
                                    @"MaxID":[ReturnParList objectAtIndex:0][@"MaxID"],
                                    @"WorkList":workList
                                    };
            block(nil,reDic);
        }
    }];
}

- (void)workDetailWithController:(UIViewController *)controller ParmaDic:(NSDictionary *)parma Withblock:(void (^)(THNetWorkError *, workDetailed *))block {
    [controller showLodingMBProgressWithMsg];
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"LoadWorkDetailed" WithParam:parma WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"工作详细读取失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSDictionary *reDic = [dataDic valueForKey:@"ReturnParList"];
            workDetailed *detail = [workDetailed mj_objectWithKeyValues:reDic];
            if (detail) {
                block(nil,detail);
            }else {
                block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:Local_Model_Error withDescription:@"工作详情实例化出错"],nil);
            }
        }
    }];
    
}

- (void)workFinishWithController:(UIViewController *)controller ParmaDic:(NSDictionary *)parma Withblock:(void (^)(THNetWorkError *))block {
    [controller showMBProgressIndeterminate];
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"FinishWorkTask" WithParam:parma WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"完成工作失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"]);
            return ;
        }else {
            block(nil);
        }
        
    }];
    
}


@end
