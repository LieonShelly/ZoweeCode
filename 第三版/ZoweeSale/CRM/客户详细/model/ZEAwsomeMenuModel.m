//
//  ZEAwsomeMenuModel.m
//  ZoweeSale
//
//  Created by apple on 16/5/24.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAwsomeMenuModel.h"

@implementation ZEAwsomeMenuModel

- initWithIconName:(NSString*)iconName title:(NSString*)title
{
    if (self) {
        self.iconName = iconName;
        self.tittle = title;
    }
    return self;
}

+ (NSDictionary *)awsomeMenuModels
{
    ZEAwsomeMenuModel * model1 = [[ZEAwsomeMenuModel alloc]initWithIconName:@"Btn_jfdj" title:@"客户定单"];
    ZEAwsomeMenuModel * model2 = [[ZEAwsomeMenuModel alloc]initWithIconName:@"量尺出图" title:@"客户出图"];
    ZEAwsomeMenuModel * model3 = [[ZEAwsomeMenuModel alloc]initWithIconName:@"图纸审核" title:@"图纸审核"];
    ZEAwsomeMenuModel * model4 = [[ZEAwsomeMenuModel alloc]initWithIconName:@"价格审核" title:@"价格审核"];
    ZEAwsomeMenuModel * model5 = [[ZEAwsomeMenuModel alloc]initWithIconName:@"合同签约" title:@"合同签约"];
    ZEAwsomeMenuModel * model6 = [[ZEAwsomeMenuModel alloc]initWithIconName:@"icon_run-off" title:@"客户流失"];
    return @{@"1":model1,
             @"2":model2,
             @"3":model3,
             @"4":model4,
             @"5":model5,
             @"6":model6
             };
}
@end
