//
//  ApplicationManage.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ApplicationManage.h"
#import "workZoneModel.h"
#import "HZURLNavigation.h"
#import "ZEDesigeMission.h"
#import "ZEProejectImage.h"

@implementation ApplicationManage
static ApplicationManage * manage = nil;

+ (instancetype)shareManage {
    static dispatch_once_t once;
    dispatch_once(&once,^{
        manage = [[ApplicationManage alloc] init];
    });
    return manage;
}

- (void)LoadCircleWorkListWithPage:(NSNumber *)page MaxID:(NSNumber *)MaxID Controller:(UIViewController *)controller Block:(void (^)(THNetWorkError *, workZoneList *))block {
    NSDictionary *dic = @{
                          @"Page":page,
                          @"MaxID":MaxID,
                          };
    [[THNetWork sharedInstance]accessServerWithUIViewController:controller WithAction:@"LoadCircleWorkList" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        if (error) {
            block(error,nil);
        }else {
            NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
            //NSLog(@"%@",ReturnParList);
            NSMutableArray *ZoneList = [NSMutableArray array];
            for (NSDictionary *dic in ReturnParList) {
                if ([dic[@"TypeID"]isEqual:@0]) {
                    NSArray *workzone = dic[@"CircleList"];
                    workzone = [workZoneModel mj_objectArrayWithKeyValuesArray:workzone];
                    [ZoneList addObjectsFromArray:workzone];
                }
            }
            workZoneList *zoneList = [[workZoneList alloc] init];
            zoneList.MaxID = [ReturnParList objectAtIndex:0][@"MaxID"];
            zoneList.workZoneList = ZoneList;
            block(nil,zoneList);
        }
    }];
}

- (void)GetProjectListBlock:(void (^)(THNetWorkError *, NSArray *))block {
    UIViewController *controller = [HZURLNavigation currentViewController];
    [controller showMBProgressIndeterminate];
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"GetProjectList" WithParam:[NSDictionary dictionary] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"列表失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
            ReturnParList = [ZEDesigeMission mj_objectArrayWithKeyValuesArray:ReturnParList];
            block(nil,ReturnParList);
        }
    }];
}

- (void)SaveProjectInfoWith:(ZEOrderInfo *)orderInfo Block:(void (^)(THNetWorkError *, NSNumber *))block {
    UIViewController *controller = [HZURLNavigation currentViewController];
//    [controller showMBProgressIndeterminate];
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"SaveProjectInfo" WithParam:[orderInfo mj_keyValues] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"列表失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSDictionary * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
            NSNumber *projectID = ReturnParList[@"ProjectID"];
            block(nil,projectID);
        }
    }];
}


- (void) GetJsonDataWith:(NSNumber *)projectID Block:(void (^)(THNetWorkError *, ZEOrderInfo *))block {
    UIViewController *controller = [HZURLNavigation currentViewController];
    [controller showMBProgressIndeterminate];
    NSDictionary *dic = @{
                          @"ProjectID":projectID
                          };
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"GetJsonData" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"列表失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSDictionary * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
            NSNumber *jsonData = ReturnParList[@"JsonData"];
            ZEOrderInfo *order = [ZEOrderInfo mj_objectWithKeyValues:jsonData];
            block(nil,order);
        }
    }];
}

- (void)SaveProjectImageWiith:(ZEImageInfo *)image file:(upLoadFile *)loadFile Block:(void (^)(THNetWorkError *, NSNumber *))block {
    
    [[THNetWork sharedInstance] creatUploadTaskWithParameters:[image mj_keyValues] Action:@"SaveProjectImage" file:loadFile success:^(id response) {
        NSLog(@"%@",response);
        block(nil,nil);
    } failure:^(NSError *error) {
          block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
    }];
    
}

- (void)loadProjectImageWith:(NSNumber *)projectID Block:(void (^)(THNetWorkError *, NSArray *))block {
    UIViewController *controller = [HZURLNavigation currentViewController];
//    [controller showMBProgressIndeterminate];
    NSDictionary *dic = @{
                          @"ProjectID":projectID
                          };
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"LoadProjectImage" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"列表失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSLog(@"LoadProjectImage:%@",dataDic);
            NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
            ReturnParList =[ZEProejectImage mj_objectArrayWithKeyValuesArray:ReturnParList];
            block(nil,ReturnParList);
        }
    }];
}

//- (void)SendRulerCustomerListWithBlock:(void (^)(THNetWorkError *, NSArray *))block{
//    UIViewController *controller = [HZURLNavigation currentViewController];
//    [controller showMBProgressIndeterminate];
//    NSDictionary *dic = [NSDictionary dictionary];
//    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"SendRulerCustomerList" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
//        [controller hideAllProgress];
//        if (error) {
//            block(error,nil);
//        }else if ([dataDic valueForKey:@"Result"] == 0) {
//            NSLog(@"列表失败");
//            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
//            return ;
//        }else {
//            NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
//            ReturnParList =[ZEGaugeCustomerModel mj_objectArrayWithKeyValuesArray:ReturnParList];
//            block(nil,ReturnParList);
//        }
//    }];
//}

- (void)SaveSendRulerTaskWithParm:(NSDictionary *)parm Block:(void (^)(THNetWorkError *))block
{
    UIViewController *controller = [HZURLNavigation currentViewController];
    [controller showMBProgressIndeterminate];
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"SaveSendRulerTask" WithParam:parm WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"列表失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"]);
            return ;
        }else {
            block(nil);
        }
    }];

}

+ (void)sendRulerTaskLisWithParma:(ZESendRulerTaskParam*)param success:(void(^)(ZESendRulerTaskResult* result))success failure:(void(^)(THNetWorkError* error))failure
{
    UIViewController *controller = [HZURLNavigation currentViewController];
    [controller showMBProgressIndeterminate];
    
  
    [[THNetWork sharedInstance]accessServerWithUIViewController:controller WithAction:@"SendRulerTaskList" WithParam:param.mj_keyValues WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) { 
        [controller hideAllProgress];
        
        if (error) {
            failure(error);
            return ;
        }
        ZESendRulerTaskResult * result = [ZESendRulerTaskResult mj_objectWithKeyValues:dataDic[@"ReturnParList"]];
        success(result);
    }];
}
@end
