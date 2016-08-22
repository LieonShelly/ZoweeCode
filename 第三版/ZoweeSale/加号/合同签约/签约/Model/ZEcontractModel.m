//
//  ZEcontractModel.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEcontractModel.h"


@implementation ZEcontractModel

- (NSDictionary *)dicKeyValue{
    NSMutableDictionary *dic = [self mj_keyValues];
    [dic removeObjectForKey:@"VoucherName"];
    return dic;
}

@end
