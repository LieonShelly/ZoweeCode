//
//  ZESendRulerTasView.m
//  ZoweeSale
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZESendRulerTasView.h"
@interface ZESendRulerTasView ()

@property(nonatomic,weak) IBOutlet UIView  * dividedline;

@property(nonatomic,weak) IBOutlet UIView  * dividedline1;
@property(nonatomic,weak) IBOutlet UILabel * todayFinishedNumLabel;
@property(nonatomic,weak) IBOutlet UILabel * finishedLabel;
@property(nonatomic,weak) IBOutlet UILabel * unFinishedLabel;

@end

@implementation ZESendRulerTasView


- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dividedline.backgroundColor = hexColorString(@"f5f2f2");
    self.dividedline1.backgroundColor =self.dividedline.backgroundColor;

    self.backgroundColor = [UIColor whiteColor];
    self.todayFinishedNumLabel.textColor = hexColorString(@"666666");
    self.finishedLabel.textColor = self.todayFinishedNumLabel.textColor;
    self.unFinishedLabel.textColor = hexColorString(@"ff7f7f");
}

- (void)setResult:(ZESendRulerTaskResult *)result

{
    self.todayFinishedNumLabel.text = [NSString stringWithFormat:@"今日量尺:%ld",result.Sum];
    self.finishedLabel.text = [NSString stringWithFormat:@"已完成:%ld",result.FinshNum];
    self.unFinishedLabel.text = [NSString stringWithFormat:@"未完成:%ld",result.NoFinsh];


}
@end
