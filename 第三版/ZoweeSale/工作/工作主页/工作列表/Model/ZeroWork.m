//
//  ZeroWork.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZeroWork.h"

@implementation ZeroWork


- (NSString *)Content {
    if (_Content.length == 0) {
        return @"暂无任务描述";
    }
    return  _Content;
    
}

@end
