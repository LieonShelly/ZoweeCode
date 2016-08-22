//
//  ZERecomandRequestParam.m
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERecomandRequestParam.h"
#import "THloginMessage.h"

@implementation ZERecomandRequestParam

- (instancetype)init
{
    if (self = [super init]) {
        self.NetType = @([THloginMessage sharedInstance].NetType);
        self.Length = @(SCREEN_HEIGHT);
        self.Width = @(SCREEN_WIDTH);
        self.TagList = @"0"; // 默认传0
    }
    return self;
}
@end
