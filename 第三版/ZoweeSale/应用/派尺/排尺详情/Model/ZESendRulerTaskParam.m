//
//  ZESendRulerTaskParam.m
//  ZoweeSale
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZESendRulerTaskParam.h"

@implementation ZESendRulerTaskParam

+ (instancetype)sendRulerTaskParam
{
    ZESendRulerTaskParam * param = [[ZESendRulerTaskParam alloc]init];
    NSDateFormatter * dateformater = [[NSDateFormatter alloc]init];//生成一个时间按格式模板
    dateformater.dateFormat = @"yyy-MM-dd hh:mm:ss";
    NSString *strDate = [dateformater stringFromDate:[NSDate date]];
    param.NowTime = strDate;
    NSLog(@"param.NowTime ----%@",param.NowTime);
    return param;
}
@end
