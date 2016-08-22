//
//  ZECalendar.h
//  ZoweeSale
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JTCalendar.h"

@interface ZECalendar : NSObject <JTCalendarDelegate>
@property (weak, nonatomic)  JTCalendarMenuView *calendarMenuView;

@property (weak, nonatomic)  JTHorizontalCalendarView *calendarContentView;

@property (strong, nonatomic) JTCalendarManager *calendarManager;


@property (nonatomic,strong)    NSMutableDictionary * eventsByDate;
    
@property (nonatomic,strong)    NSDate * todayDate;
@property (nonatomic,strong)    NSDate * minDate;
@property (nonatomic,strong)    NSDate * maxDate;

@property (nonatomic,strong)    NSDate * dateSelected;

- (void)createRandomEvents;
- (void)createMinAndMaxDate;

@end
