//
//  NSDate+string.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/7.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "NSDate+string.h"

@implementation NSDate (string)
+ (NSDate *)dateFormateWithString:(NSString *)time {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *destDate= [dateFormatter dateFromString:time];
    
    return destDate;
}

+ (NSString *)dateStringFormateWithToday{
    NSDate *todate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:todate];
    return destDateString;
}

+ (NSString *)stringFormateWithDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"MM月dd日 HH:mm "];
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}

+ (NSString *)stringFormateWithToday{
    NSDate *todate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM月dd日HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:todate];
    return destDateString;
}

+ (NSString *)stringtodayYandMandD{
    NSDate *todate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd c"];
    NSString *destDateString = [dateFormatter stringFromDate:todate];
    return destDateString;
}

+ (NSString *)stringFormateWithString:(NSString *)time {
    return [self stringFormateWithDate:[self dateFormateWithString:time]];
}

+ (NSString *)dateArrivaltodaynumber:(NSDate *)date {
    NSDate *todate = [NSDate date];
    double timezoneFix = [NSTimeZone localTimeZone].secondsFromGMT;
    
    NSInteger daynum = (NSInteger)(([todate timeIntervalSince1970] + timezoneFix)/(24*3600)) -
    (NSInteger)(([date timeIntervalSince1970] + timezoneFix)/(24*3600));
    
    return [NSString stringWithFormat:@"%li",(long)daynum];
}
+ (NSString *)dateArrivaltodaynumberString:(NSString *)time {
    NSDate *day = [self dateFormateWithString:time];
    return [self dateArrivaltodaynumber:day];
}
@end
