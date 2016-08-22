
//
//  CrmCustomerInterface.m
//  ZoweeSale
//
//  Created by apple on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "CrmCustomerInterface.h"
#import "MJExtension.h"
#import "customerDetail.h"
#import "ZEAttachment.h"

@implementation CrmCustomerInterface
static CrmCustomerInterface * crmCITF = nil;
+ (instancetype)shareCrmCustomInstance {
    static dispatch_once_t once;
    dispatch_once(&once,^{
        crmCITF = [[CrmCustomerInterface alloc] init];
    });
    return crmCITF;
}

- (void)loadCustomerDetailInfoWithController:(UIViewController *)controller customerID:(NSNumber *)ID Block:(void (^)(THNetWorkError *, customerDetail *))block {
    NSDictionary *dic = @{
                        @"CustomerID":ID
                        };
   // [controller showMBProgressIndeterminate];
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"LoadCustomerDetailInfo" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
       // [controller hideAllProgress];
        if (error) {
            block(error ,nil);
        }else {
            NSDictionary * ReturnPar = [dataDic valueForKey:@"ReturnParList"];
            customerDetail *detail = [customerDetail mj_objectWithKeyValues:ReturnPar];
            if (detail) {
                block(nil,detail);
            }else {
                block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:Local_Model_Error withDescription:@"初始化信息为空"],nil);
            }
        }
        
    }];
}

- (void)loadAllCustomerListWithInterface:(NSString *)inerface  Type:(customersSort)type Sort:(sortDirectionType)sort Block:(void(^)(THNetWorkError * error,NSArray * array))bolck{
    UIViewController *controller = HZURLNavigation.currentViewController;
    [controller showMBProgressIndeterminate];
    NSDictionary * dic = @{
                           @"Type":[NSNumber numberWithInteger:type],
                           @"Sort":[NSNumber numberWithInteger:sort],
                           };
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:inerface WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            bolck(error ,nil);
        }else {
            NSArray * ReturnPar = [dataDic valueForKey:@"ReturnParList"];
            NSArray *array = [IntentionEntityClass mj_objectArrayWithKeyValuesArray:ReturnPar];
            if (array) {
                bolck(nil,array);
            }else {
                bolck([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:Local_Model_Error withDescription:@"初始化信息为空"],nil);
            }
        }
        
    }];

}

- (void)concernWithOrderID:(NSNumber *)orderID IsAttention:(NSNumber *)IsAttention Block:(void (^)(THNetWorkError *))bolck{
    UIViewController *controller = HZURLNavigation.currentViewController;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:controller.view animated:YES];
    NSDictionary * dic = @{
                           @"OrderID":orderID,
                           @"IsAttention":IsAttention
                           };
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"Concern" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [hud hideAnimated:YES];
        if (error) {
            bolck(error);
        }else {
                bolck(nil);
        }
    }];
}

- (void)LossCustomerWithOrderID:(NSNumber *)orderID Block:(void (^)(THNetWorkError *))bolck{
    UIViewController *controller = HZURLNavigation.currentViewController;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:controller.view animated:YES];
    NSDictionary * dic = @{
                           @"OrderID":orderID
                           };
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"Loss" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [hud hideAnimated:YES];
        if (error) {
            bolck(error);
        }else {
            bolck(nil);
        }
    }];
}

- (void)GetWeatherWithcityName:(NSString *)cityName Block:(void (^)(THNetWorkError *, NSString *))bolck{
    UIViewController *controller = HZURLNavigation.currentViewController;
    NSDictionary * dic = @{
                           @"CityName":cityName
                           };
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"GetWeather" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        //[hud hideAnimated:YES];
        if (error) {
            bolck(error ,nil);
        }else {
            NSDictionary * ReturnPar = [dataDic valueForKey:@"ReturnParList"];
            if (ReturnPar) {
                bolck(nil,ReturnPar[@"WeatherSM"]);
            }else {
                bolck([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:Local_Model_Error withDescription:@"初始化信息为空"],nil);
            }
        }
    }];
}
- (void)GetCustomerFileListWithOrderID:(NSNumber *)orderID Block:(void (^)(THNetWorkError *, NSArray *))bolck{
    UIViewController *controller = HZURLNavigation.currentViewController;
    NSDictionary * dic = @{
                           @"OrderID":orderID
                           };
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"GetCustomerFileList" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        //[hud hideAnimated:YES];
        if (error) {
            bolck(error ,nil);
        }else {
            NSArray * ReturnPar = [dataDic valueForKey:@"ReturnParList"];
            ReturnPar = [ZEAttachment mj_objectArrayWithKeyValuesArray:ReturnPar];
            if (ReturnPar) {
                bolck(nil,ReturnPar);
            }else {
                bolck([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:Local_Model_Error withDescription:@"初始化信息为空"],nil);
            }
        }
    }];


}

@end
