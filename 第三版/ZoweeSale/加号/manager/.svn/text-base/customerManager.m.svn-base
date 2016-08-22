//
//  customerManager.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "customerManager.h"
#import "HZURLNavigation.h"
#import "ZEvoucher.h"
@implementation customerManager


static customerManager * manager = nil;
+ (instancetype)sharecustomerInstance {
    static dispatch_once_t once;
    dispatch_once(&once ,^{
        manager = [[customerManager alloc] init];
    }
                  );
    return manager;
}

- (void)addCustomerWithController:(UIViewController *)controller parmaDic:(NSDictionary *)parm block:(void (^)(THNetWorkError *, NSNumber *))block {
    [controller showMBProgressIndeterminate];
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"AddCustomer" WithParam:parm WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error,nil);
        }else {
            NSDictionary *dic = [dataDic valueForKey:@"ReturnParList"];
            block(nil,dic[@"CustomerID"]);
        }
        
    }];
    
}



- (void)loadCustomerSourceWithController:(UIViewController *)controller block:(void (^)(THNetWorkError *, NSArray *))block {
    [controller showMBProgressIndeterminate];
    [[THNetWork sharedInstance]accessServerWithUIViewController:controller WithAction:@"LoadCustomerSource" WithParam:[NSDictionary dictionary] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"客户来源获取失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
            block(nil,ReturnParList);
        }
        
    }];
}

- (void)loadGuidListWithController:(UIViewController *)controller block:(void (^)(THNetWorkError *, NSArray *))block {
    [controller showMBProgressIndeterminate];
    [[THNetWork sharedInstance]accessServerWithUIViewController:controller WithAction:@"LoadGuidList" WithParam:[NSDictionary dictionary] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"登记客户接待人列表失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
            block(nil,ReturnParList);
        }
        
    }];
}


- (void)loadAllListWithController:(UIViewController *)controller typeDIc:(NSDictionary *)dic block:(void (^)(THNetWorkError *, NSArray *))block {
    NSMutableDictionary *prame = [NSMutableDictionary dictionary];
    NSString *interface ;
    if ([dic[@"type"] isEqualToString:@"设计师"]) {
        interface = @"LoadDesignerList";
        [prame setValue:dic[@"ID"] forKey:@"ID"];
    }else if ([dic[@"type"] isEqualToString:@"装饰公司"]){
        interface = @"LoadDecorateList";
    }else if ([dic[@"type"] isEqualToString:@"品类"]){
        interface = @"GetCateGoryList";
    }else if ([dic[@"type"] isEqualToString:@"户型"]){
        interface = @"GetHouseTypeList";
    }else if ([dic[@"type"] isEqualToString:@"风格"]){
        interface = @"GetStyleList";
    }else if ([dic[@"type"] isEqualToString:@"店长"]){
        interface = @"LoadShopOwnerList";
    }else if ([dic[@"type"] isEqualToString:@"派尺设计师"]){
        interface = @"SendRulerDesignerList";
    }else if ([dic[@"type"] isEqualToString:@"工厂活动"]){
        interface = @"LoadActivityList";
    }

    [controller showMBProgressIndeterminate];
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:interface WithParam:prame WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"列表失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
            ReturnParList = [choAllModel mj_objectArrayWithKeyValuesArray:ReturnParList];
            block(nil,ReturnParList);
        }
        
    }];
}

- (void)searchAddressWithController:(UIViewController *)controller searchKey:(NSString *)key block:(void (^)(THNetWorkError *, NSArray *))block {
    [controller showMBProgressIndeterminate];
    NSDictionary *dic = @{
                          @"SearchKey":key
                          };
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"SearchAddress" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"列表失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
            ReturnParList = [MGLocation mj_objectArrayWithKeyValuesArray:ReturnParList];
            block(nil,ReturnParList);
        }
    }];
}

//- (void)getCustomerListWithSortType:(NSNumber *)sortType block:(void (^)(THNetWorkError *, NSArray *))block {
//    UIViewController *controller = HZURLNavigation.currentViewController;
//    NSDictionary *dic = @{
//                          @"SortType":sortType
//                          };
//    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"GetCustomerList" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
//        if (error) {
//            block(error,nil);
//        }else if ([dataDic valueForKey:@"Result"] == 0) {
//            NSLog(@"列表失败");
//            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
//            return ;
//        }else {
//            NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
//            ReturnParList = [customer mj_objectArrayWithKeyValuesArray:ReturnParList];
//            block(nil,ReturnParList);
//        }
//    }];
//    
//}

- (void)DeliveryDepositWith:(orderAppointment *)ordre Block:(void (^)(THNetWorkError *))block
{
    UIViewController *controller = HZURLNavigation.currentViewController;
    NSMutableDictionary *dic = [ordre mj_keyValues];
    [dic removeObjectsForKeys:@[@"customerName",@"flowName",@"guiderName",@"houseTypeName",@"setyleName",@"shopOwnerName"]];
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"DeliveryDeposit" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
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

-(void)getOrderNoBlock:(void (^)(THNetWorkError *, NSString *))block{
    UIViewController *controller = HZURLNavigation.currentViewController;
    [controller showMBProgressIndeterminate];
    NSDictionary *dic = @{};
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"GetOrderNo" WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        [controller hideAllProgress];
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"列表失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSDictionary *orderID =[dataDic valueForKey:@"ReturnParList"];
            block(nil,orderID[@"OrderNo"]);
        }
    }];

}

//- (void)allCustomerListWithActivate:(NSString *)interface WithBlock:(void (^)(THNetWorkError *, NSArray *))block{
//    UIViewController *controller = [HZURLNavigation currentViewController];
//    [controller showMBProgressIndeterminate];
//    NSDictionary *dic = [NSDictionary dictionary];
//    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:interface WithParam:dic WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
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
//
//}

- (void)FigureOutWithPrame:(NSDictionary *) parme Block:(void(^)(THNetWorkError *error))block{
    UIViewController *controller = HZURLNavigation.currentViewController;
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"FigureOut" WithParam:parme WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
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

- (void)allReviewWithPrame:(NSDictionary *)prame interface:(NSString *)interface Block:(void (^)(THNetWorkError *))block{
    UIViewController *controller = HZURLNavigation.currentViewController;
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:interface WithParam:prame WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
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

- (void)OrderContractWithParm:(NSDictionary *)parm Block:(void (^)(THNetWorkError *))block{
    UIViewController *controller = HZURLNavigation.currentViewController;
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"OrderContract" WithParam:parm WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
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

- (void)customerLossWithParm:(NSDictionary *)parm Block:(void(^)(THNetWorkError *error))block
{
    UIViewController *controller = HZURLNavigation.currentViewController;
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"Loss" WithParam:parm WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
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
- (void)GetVoucherTypeWithBlock:(void (^)(THNetWorkError *, NSArray *))block{
    UIViewController *controller = HZURLNavigation.currentViewController;
    [[THNetWork sharedInstance] accessServerWithUIViewController:controller WithAction:@"GetVoucherType" WithParam:[NSDictionary dictionary] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        if (error) {
            block(error,nil);
        }else if ([dataDic valueForKey:@"Result"] == 0) {
            NSLog(@"列表失败");
            block([THNetWorkError initTHNetWorkErrorWithType:THErrorTypeService withCode:CODE_RESPONSE_CODE_ZERO withDescription:@"Result = 0"],nil);
            return ;
        }else {
            NSArray * ReturnParList = [dataDic valueForKey:@"ReturnParList"];
            ReturnParList =[ZEvoucher mj_objectArrayWithKeyValuesArray:ReturnParList];
            block(nil,ReturnParList);
        }
    }];

}

@end
