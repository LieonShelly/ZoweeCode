//
//  NSCalendar+ST.h
//  STCalendarDemo
//
//  Created by https://github.com/STShenZhaoliang/STCalendar on 15/12/17.
//  Copyright © 2015年 ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (ST)

/**
 *  1.当前的日期数据元件模型
 *
 *  @return <#return value description#>
 */
+ (NSDateComponents *)currentDateComponents;

/**
 *  2.当前年
 *
 *  @return <#return value description#>
 */
+ (NSInteger)currentYear;

/**
 *  3.当前月
 *
 *  @return <#return value description#>
 */
+ (NSInteger)currentMonth;

/**
 *  4.当前天
 */
+ (NSInteger)currentDay;

/**
 *  5.当前周数
 */
+ (NSInteger)currnentWeekday;
/**
 *  获取指定年的月数
 *
 *  @param year 指定年
 *
 *  @return 如果是今年返回剩余月数
 */
+ (NSInteger)getMonthWithYear:(NSInteger)year;
/**
 *  获取指定年的第一月
 *
 *  @param year 指点年
 *
 *  @return 如果是今年返回当前月
 */
+ (NSInteger)getFirstMonthWithYear:(NSInteger)year;
/**
 *  获取指定年,月的第一天
 *
 *  @param year  指定年
 *  @param month 指定月
 *
 *  @return 如果是今天返回当日
 */
+ (NSInteger)getFirstDayWithYear:(NSInteger)year Month:(NSInteger)month;

/**
 *  6.获取指定年月的天数
 */
+ (NSInteger)getDaysWithYear:(NSInteger)year
                       month:(NSInteger)month;

/**
 *  7.获取指定年月的第一天的周数
 */
+ (NSInteger)getFirstWeekdayWithYear:(NSInteger)year
                               month:(NSInteger)month;
/**
 *  8.比较两个日期元件
 */
+ (NSComparisonResult)compareWithComponentsOne:(NSDateComponents *)componentsOne
                                 componentsTwo:(NSDateComponents *)componentsTwo;

/**
 *  9.获取两个日期元件之间的日期元件
 */
+ (NSMutableArray *)arrayComponentsWithComponentsOne:(NSDateComponents *)componentsOne
                                       componentsTwo:(NSDateComponents *)componentsTwo;
/**
 *  10.字符串转日期元件 字符串格式为：yy-MM-dd
 */
+ (NSDateComponents *)dateComponentsWithString:(NSString *)String;
@end
