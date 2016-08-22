//
//  ZEDetailTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEDetailTableViewCell.h"

@implementation ZEDetailTableViewCell{
    UILabel *_titleLab;
    UILabel *_describeLab;
    UILabel *_typeLab;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifie{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifie];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    UIView *contentView = self.contentView;
    _titleLab = [UILabel new];
    [contentView addSubview:_titleLab];
    _titleLab.sd_layout
    .centerYEqualToView(contentView)
    .leftSpaceToView(contentView,15)
    .heightIs(17)
    .widthRatioToView(contentView,0.25);
    
    _describeLab = [UILabel new];
    _describeLab.textAlignment = NSTextAlignmentRight;
    [contentView addSubview:_describeLab];
    _describeLab.sd_layout
    .centerYEqualToView(contentView)
    .heightIs(17)
    .leftSpaceToView(_titleLab,0)
    .rightSpaceToView(contentView,10);
    
//    _typeLab = [UILabel new];
//    [contentView addSubview:_typeLab];
//    _typeLab.sd_layout
//    .centerXEqualToView(contentView)
//    .centerYEqualToView(contentView)
//    .widthIs(68)
//    .heightIs(17);
    
    
}



- (void)setDetailModel:(ZEDetailModel *)detailModel
{
    _detailModel = detailModel;
    _titleLab.text = detailModel.title;
    _describeLab.text = detailModel.desc;
}
@end
