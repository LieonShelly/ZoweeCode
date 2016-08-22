//
//  voucherTableVeiwCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "voucherTableVeiwCell.h"

@implementation voucherTableVeiwCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setVouch:(ZEvoucher *)vouch{
    _vouch = vouch;
    self.nameLab.text = vouch.Title;
    self.headImage.sd_layout
        .heightIs(0);
}

@end
