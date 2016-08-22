//
//  orderAppointment.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/5.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "orderAppointment.h"
#import "userManager.h"

static NSString *fID = @"orderAppointmentFlowID";
static NSString *fName = @"orderAppointmentFlowName";
static NSString *shopID = @"shopOwnerID";
static NSString *shopName = @"shopOwnerName";
@implementation orderAppointment

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.OrderMoney = @0;
        self.Area = @0;
        self.HouseTypeID = @0;
        self.StyleID = @0;
        self.OrderDate = [self todayString];
        self.flowName = [self flowNameInit];
        self.FlowID = [self flowIDInit];
        [self guiderInit];
        self.ShopOwnerID = [self ShopOwnerIDInit];
        self.shopOwnerName = [self shopOwnerNameInit];
    }
    return self;
}

- (NSString *)entityisNoEmpty {
    if (!self.CustomerID.isNoEmpty) {
        return @"请选择客户";
    }
    if (!self.FlowID.isNoEmpty) {
        return @"请选择产品品类";
    }
    if (!self.OrderNo.isNoEmpty) {
        return @"请输入订单编号";
    }
    if (!self.OrderDate.isNoEmpty) {
        return @"请选择日期";
    }
    if (!self.GuiderID.isNoEmpty) {
        return @"请选择导购";
    }
    return nil;
}

- (NSString *)todayString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:[NSDate date]];
    return destDateString;
}

- (NSNumber *)flowIDInit {
    NSNumber *flow = [[NSUserDefaults standardUserDefaults] objectForKey:fID];
    return flow;
}
- (NSString *)flowNameInit{
    NSString *flow = [[NSUserDefaults standardUserDefaults] objectForKey:fName];
    return flow;
}

- (void)guiderInit{
   // NSDictionary *dic = [userManagershare loadingLoginMessagr];
    self.guiderName = [userManager sharedInstance].userName;
    self.GuiderID = [userManager sharedInstance].UserID;;
    
}

- (NSNumber *)ShopOwnerIDInit{
    NSNumber *ID = [[NSUserDefaults standardUserDefaults] objectForKey:shopID];
    if (ID) {
        return ID;
    }
    return @0;
}

- (NSString *)shopOwnerNameInit{
    NSString *name = [[NSUserDefaults standardUserDefaults] objectForKey:shopName];
    if (name) {
        return name;
    }
    return @"";
}

- (void)setShopOwnerID:(NSNumber *)ShopOwnerID{
    _ShopOwnerID = ShopOwnerID;
    [[NSUserDefaults standardUserDefaults]setObject:ShopOwnerID forKey:shopID];
}

- (void)setShopOwnerName:(NSString *)shopOwnerName{
    _shopOwnerName = shopOwnerName;
    [[NSUserDefaults standardUserDefaults]setObject:_shopOwnerName forKey:shopName];
}

- (void)setFlowID:(NSNumber *)FlowID {
    _FlowID = FlowID;
    [[NSUserDefaults standardUserDefaults]setObject:FlowID forKey:fID];
}
- (void)setFlowName:(NSString *)flowName {
    _flowName = flowName;
    [[NSUserDefaults standardUserDefaults]setObject:flowName forKey:fName];
}

@end
