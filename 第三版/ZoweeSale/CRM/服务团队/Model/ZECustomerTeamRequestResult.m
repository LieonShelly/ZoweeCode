//
//  ZECustomerTeamRequestResult.m
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECustomerTeamRequestResult.h"
#import "MJExtension.h"
#import "ZECustomerTeam.h"

@implementation ZECustomerTeamRequestResult

+(NSDictionary *)mj_objectClassInArray
{
    return @{@"ReturnParList" : [ZECustomerTeam class]};
}

@end
