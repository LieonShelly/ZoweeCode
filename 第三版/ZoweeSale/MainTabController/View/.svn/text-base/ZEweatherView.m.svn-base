//
//  ZEweatherView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/24.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEweatherView.h"
#import "NSDate+string.h"
#import "UILable+TH.h"

@implementation ZEweatherView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithWeather:(NSString *)weather{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 100);
        [self setup:weather];
    }
    return self;
}

- (void)setup:(NSString *)weather{
    NSString *today = [NSDate stringtodayYandMandD];
    NSArray *timeArray = [today componentsSeparatedByString:@" "];
    today = timeArray.firstObject;
    NSString *ccc = timeArray.lastObject;
    timeArray = [today componentsSeparatedByString:@"-"];
    NSString *day = timeArray.lastObject;
    NSString *yAndM = [NSString stringWithFormat:@"%@/%@",timeArray[1],timeArray[0]];
    if ([ccc isEqualToString:@"1"]) {
        ccc = @"星期天";
    }else if ([ccc isEqualToString:@"2"]){
        ccc = @"星期一";
    }else if ([ccc isEqualToString:@"3"]){
        ccc = @"星期二";
    }else if ([ccc isEqualToString:@"4"]){
        ccc = @"星期三";
    }else if ([ccc isEqualToString:@"5"]){
        ccc = @"星期四";
    }else if ([ccc isEqualToString:@"6"]){
        ccc = @"星期五";
    }else if ([ccc isEqualToString:@"7"]){
        ccc = @"星期六";
    }
    
    UILabel *dayLab = [UILabel new];
    dayLab.textColor = hexColorString(@"737373");
    dayLab.font = [UIFont systemFontOfSize:40];
    dayLab.textAlignment = NSTextAlignmentCenter;
    dayLab.text = day;
    [self addSubview:dayLab];
    dayLab.sd_layout
    .topSpaceToView(self,35)
    .leftSpaceToView(self,15)
    .widthIs([dayLab labelSizeWidth])
    .heightIs(dayLab.font.lineHeight);
    
    UILabel *cccLab = [UILabel new];
    cccLab.text = ccc;
    cccLab.textColor = hexColorString(@"737373");
    cccLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:cccLab];
    cccLab.sd_layout
    .topSpaceToView(self,42)
    .leftSpaceToView(dayLab,15)
    .widthIs(42)
    .heightIs(cccLab.font.lineHeight);
    
    UILabel *yanmLab = [UILabel new];
    yanmLab.textColor = hexColorString(@"737373");
    yanmLab.text = yAndM;
    yanmLab.font = [UIFont systemFontOfSize:14];
    [self addSubview:yanmLab];
    yanmLab.sd_layout
    .topSpaceToView(cccLab,2)
    .leftEqualToView(cccLab)
    .widthIs([yanmLab labelSizeWidth])
    .heightIs(yanmLab.font.lineHeight);
    
    UILabel *weathLab = [UILabel new];
    weathLab.font = [UIFont systemFontOfSize:14];
    weathLab.textColor = hexColorString(@"737373");
    weathLab.text = weather;
    [self addSubview:weathLab];
    weathLab.sd_layout
    .topSpaceToView(dayLab,10)
    .leftSpaceToView(self,17)
    .widthIs([weathLab labelSizeWidth])
    .heightIs(weathLab.font.lineHeight);
    
    UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"商之道"]];
    [self addSubview:icon];
    icon.sd_layout
    .topSpaceToView(self,43)
    .rightSpaceToView(self,15)
    .widthIs(100)
    .heightIs(65);
}

@end
