//
//  workDetailed.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/29.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "workDetailed.h"
#import "NSDate+string.h"

@implementation workDetailed


- (NSString *)tagStr {
   
    
    return  [NSString stringWithFormat:@"%@来自%@",[NSDate stringFormateWithString:self.PublishTime],self.PublishTag];
    
}

- (NSString *)stateStr {
    if ([self.State isEqual:@0]) {
        return @"未开始";
    }else if ([self.State isEqual:@1]) {
        return @"进行中";
    }else if ([self.State isEqual:@2]) {
        return @"已完成";
    }else if ([self.State isEqual:@3]) {
        return @"已取消";
    }else if ([self.State isEqual:@4]) {
        return @"已过期";
    }
    
    return @"";
    
}

-  (NSString *)finishNumberStr {
    
    return [NSString stringWithFormat:@"%@/%@",self.FinishNumber,self.ExecutorNumber];
    
}


@end
