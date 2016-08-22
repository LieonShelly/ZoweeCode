//
//  ZECustomerActivityCellRightView.m
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECustomerActivityCellRightView.h"

@interface ZECustomerActivityCellRightView ()
@property (weak, nonatomic) IBOutlet UILabel *StateLabel;
@property (weak, nonatomic) IBOutlet UILabel *FinishDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *FinishDateHourLabel;


@end

@implementation ZECustomerActivityCellRightView

+ (instancetype)rightView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZECustomerActivityCellRightView" owner:nil options:nil]lastObject];
}

// init方法优先于awake方法,
- (void)awakeFromNib
{
    self.backgroundColor = [UIColor colorWithHexString:@"fcfcfc"];
    self.StateLabel.textColor = [UIColor colorWithHexString:@"2e2e2e"];
    self.FinishDateLabel.textColor = [UIColor colorWithHexString:@"999999"];
    self.FinishDateHourLabel.textColor = [UIColor colorWithHexString:@"999999"];
    
}

#pragma mark - 公共接口

- (void)setActivity:(ZECustomerActivity *)activity
{
    _activity = activity;
    self.StateLabel.text = activity.TypeName;
    NSRange  daterange = NSMakeRange(0, 10);
    NSString * dateStr = [activity.FinishDate substringWithRange:daterange];
    self.FinishDateLabel.text =dateStr;
    self.FinishDateHourLabel.text = [activity.FinishDate substringFromIndex:daterange.length];
    
}

@end
