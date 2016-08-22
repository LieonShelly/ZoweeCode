//
//  dynamicTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "dynamicTableViewCell.h"

@interface dynamicTableViewCell ( )

@end

@implementation dynamicTableViewCell{
    UILabel *contextLab;
}

- (void)setup{
    [super setup];
    UILabel *follLab = [UILabel new];
    follLab.textColor = hexColorString(@"999999");
    follLab.text = @"近期动态";
    [self.customerView addSubview:follLab];
    follLab.sd_layout
    .topSpaceToView(self.customerView,25)
    .leftEqualToView(self.customerView)
    .widthIs([follLab labelSizeWidth])
    .heightIs(follLab.font.lineHeight);
    
    UILabel *textLab = [UILabel new];
    textLab.font = [UIFont systemFontOfSize:15];
    textLab.textColor = hexColorString(@"666666");
    [self.customerView addSubview:textLab];
    textLab.sd_layout
    .leftEqualToView(follLab)
    .topSpaceToView(follLab,25)
    .rightEqualToView(self.customerView)
    .autoHeightRatio(0);
    contextLab = textLab;
    
    [self.customerView setupAutoHeightWithBottomView:textLab bottomMargin:15];

}
- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setDetail:(customerDetail *)detail{
    [super setDetail:detail];
    contextLab.text = detail.Customerdynamics;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
