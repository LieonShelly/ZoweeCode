//
//  ZEAttachment.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/3.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAttachment.h"

@implementation ZEAttachment

-(NSString *)CreateTime{
    return [_CreateTime componentsSeparatedByString:@" "].firstObject;
}

- (NSString *)FileName{
    return [_FileName componentsSeparatedByString:@"/"].lastObject;
}

@end
