//
//  ZESendRulerTaskResult.m
//  ZoweeSale
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZESendRulerTaskResult.h"
#import "MJExtension.h"
#import "ZESendRulerTask.h"

@implementation ZESendRulerTaskResult

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"TaskList":[ZESendRulerTask class] };
    
}
@end
