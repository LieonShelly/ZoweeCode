//
//  MGLoationTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "MGLoationTableViewCell.h"



@implementation MGLoationTableViewCell{
    UILabel *_titleLab;
    UILabel *_addressLab;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UIView *contentView = self.contentView;
    _titleLab = [UILabel new];
    _titleLab.textColor = hexColorString(@"2e2e2e");
    _titleLab.font = [UIFont systemFontOfSize:17];
    [contentView addSubview:_titleLab];
    _titleLab.sd_layout
    .topSpaceToView(contentView,5)
    .leftSpaceToView(contentView,15)
    .rightSpaceToView(contentView,15)
    .heightIs(17);
    
    _addressLab = [UILabel new];
    _addressLab.textColor = hexColorString(@"808080");
    _addressLab.font = [UIFont systemFontOfSize:14];
    [contentView addSubview:_addressLab];
    _addressLab.sd_layout
    .bottomSpaceToView(contentView,5)
    .leftSpaceToView(contentView,15)
    .rightSpaceToView(contentView,15)
    .heightIs(14);
    
}

- (void)setLocation:(MGLocation *)Location {
    _Location = Location;
    _titleLab.text = Location.Title;
    _addressLab.text = Location.Address;
}

@end
