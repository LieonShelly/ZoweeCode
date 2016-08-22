//
//  ZEContractBillCell.m
//  ZoweeSale
//
//  Created by lieon on 16/6/13.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEContractBillCell.h"


@interface ZEContractBillCell()
@property (weak, nonatomic) IBOutlet UILabel *contarctLabel;
@property (weak, nonatomic) IBOutlet UILabel *customerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIView *dividedLine;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@end

@implementation ZEContractBillCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contarctLabel.textColor = hexColorString(@"808080");
    self.dateLabel.textColor = self.contarctLabel.textColor;
    self.priceLabel.textColor = hexColorString(@"2e2e2e");
    
    self.customerNameLabel.textColor = self.priceLabel.textColor;
    self.dividedLine.backgroundColor = hexColorString(@"dbdbdb");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - publickMethod

- (void)setDetail:(ZEDetailed *)detail
{
    _detail = detail;
    NSRange range = NSMakeRange(0, detail.AccTime.length - 9);
    NSString * num = [detail.AccTime substringWithRange:range];
    self.contarctLabel.text = detail.ContractSelfNo;
    self.customerNameLabel.text = detail.CustomerName;
    self.dateLabel.text = num;
    self.priceLabel.text = [NSString stringWithFormat:@" ￥:%@",detail.Amount];
}

@end
