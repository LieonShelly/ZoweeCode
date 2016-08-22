//
//  ZELoadNoticeListRequestResult.m
//  ZoweeSale
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZELoadNoticeListRequestResult.h"
#import "ZENoticeList.h"

@implementation ZELoadNoticeListRequestResult

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"ReturnParList":[ZENoticeList class]};
}

@end
