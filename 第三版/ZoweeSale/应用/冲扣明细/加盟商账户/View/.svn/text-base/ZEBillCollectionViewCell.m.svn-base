//
//  ZEBillCollectionViewCell.m
//  ZoweeSale
//
//  Created by lieon on 16/6/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEBillCollectionViewCell.h"

@interface ZEBillCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIView *deductView;

@property (weak, nonatomic) IBOutlet UIView *rechargeView;

@property (weak, nonatomic) IBOutlet UILabel *rechargeLabel;
@property (weak, nonatomic) IBOutlet UILabel *rechargeValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *deductLabel;
@property (weak, nonatomic) IBOutlet UILabel *deductValueLabel;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ZEBillCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    self.deductView.backgroundColor = hexColorString(@"ffffff");
    self.rechargeView.backgroundColor = hexColorString(@"ffe5e5");
    self.deductLabel.textColor = hexColorString(@"999999");
    self.rechargeLabel.textColor = self.deductLabel.textColor;
    self.deductValueLabel.textColor = hexColorString(@"2e2e2e");
    self.rechargeValueLabel.textColor =   self.deductValueLabel.textColor ;
    self.containerView.layer.cornerRadius = 5;
    self.containerView.layer.masksToBounds = YES;
} 

#pragma mark - publickMethod

- (void)setMonthMoney:(ZEMonthMoney *)monthMoney
{
    _monthMoney = monthMoney;
    self.deductValueLabel.text = [NSString stringWithFormat:@"￥%.2f",[monthMoney.srAmount floatValue]];
    self.rechargeValueLabel.text = [NSString stringWithFormat:@"￥%.2f",[monthMoney.zcAmount floatValue]];
    self.dateLabel.text = monthMoney.strTime;
}
@end
