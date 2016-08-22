//
//  ZECustomerDetailCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECustomerDetailCell.h"

@implementation ZECustomerDetailCell{
    UIImageView *icon;
    UIImageView *rightrow;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setup{
    [super setup];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
    UIView *contentView = self.contentView;
    //圆角视图
    self.backView = [UIView new];
    self.backView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:self.backView];
    self.backView.sd_layout
    .leftSpaceToView(contentView,10)
    .topSpaceToView(contentView,10)
    .rightSpaceToView(contentView,10);
    self.backView.sd_cornerRadius = @5;
    //标签图片
    icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"跟进标签"]];
    [self.backView addSubview:icon];
    icon.sd_layout
    .leftSpaceToView(self.backView,5)
    .topEqualToView(self.backView)
    .widthIs(8)
    .heightIs(16);
    //cell名label
    self.titleLab = [UILabel new];
    self.titleLab.font = [UIFont systemFontOfSize:17];
    self.titleLab.text = @"";
    self.titleLab.textColor = [UIColor colorWithHexString:@"ff5531"];
    [self.backView addSubview:self.titleLab];
    self.titleLab.sd_layout
    .leftSpaceToView(self.backView,20)
    .topSpaceToView(self.backView,15)
    .heightIs(17)
    .widthIs(68);
    
    //右箭头图标
    rightrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"箭头"]];
    [self.backView addSubview:rightrow];
    rightrow.sd_layout
    .centerYEqualToView(self.titleLab)
    .rightSpaceToView(self.backView,20)
    .widthIs(12)
    .heightIs(12);
    
    _customerView = [[UIView alloc]init];
    [self.backView addSubview:self.customerView];
    self.customerView.sd_layout
    .topSpaceToView(self.titleLab,0)
    .leftEqualToView(self.titleLab)
    .rightEqualToView(rightrow);
    [self.backView setupAutoHeightWithBottomView:self.customerView bottomMargin:0];
    [self setupAutoHeightWithBottomView:self.backView bottomMargin:0];
}

- (void)setDetailTitle:(NSString *)detailTitle{
    _detailTitle = detailTitle;
    self.titleLab.text = detailTitle;
}

- (void)setDetail:(customerDetail *)detail{
    _detail = detail;
}

@end
