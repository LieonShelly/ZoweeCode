//
//  searchResultTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "searchResultTableViewCell.h"

@implementation searchResultTableViewCell{
    UIImageView *_headImageView;
    UILabel *_nameLab;
    UILabel *_phoneNumberLab;
    UILabel *_addressLab;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         //self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setup];
    }
    return self;
}

- (void)setup {
    _headImageView = [[UIImageView alloc]init];
    _headImageView.image = [UIImage imageNamed:@"icon_SearchCustomer"];
    _nameLab = [[UILabel alloc]init];
    _nameLab.font = [UIFont systemFontOfSize:15];
    _nameLab.textColor = hexColorString(@"2e2e2e");
    _phoneNumberLab = [[UILabel alloc]init];
    _phoneNumberLab.textColor = hexColorString(@"808080");
    _phoneNumberLab.font = [UIFont systemFontOfSize:12];
    _addressLab = [[UILabel alloc]init];
    _addressLab.textColor = hexColorString(@"808080");
    _addressLab.font = [UIFont systemFontOfSize:12];
    _addressLab.numberOfLines = 0;
    
    
    UIView *contentView = self.contentView;
    
    [contentView addSubview:_headImageView];
    [contentView addSubview:_nameLab];
    [contentView addSubview:_phoneNumberLab];
    [contentView addSubview:_addressLab];
    
    _headImageView.sd_layout
    .topSpaceToView(contentView,10)
    .leftSpaceToView(contentView,20)
    .heightIs(32)
    .widthIs(32);
    
    _nameLab.sd_layout
    .topEqualToView(_headImageView)
    .leftSpaceToView(_headImageView,15)
    .heightIs(15)
    .widthIs(60);
    
    _phoneNumberLab.sd_layout
    .bottomEqualToView(_nameLab)
    .leftSpaceToView(_nameLab,10)
    .heightIs(12)
    .rightEqualToView(contentView);
    
    _addressLab.sd_layout
    .topSpaceToView(_nameLab,5)
    .leftEqualToView(_nameLab)
    .rightSpaceToView(contentView,20)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomViewsArray:@[_headImageView,_addressLab] bottomMargin:10];
    
}

- (void)setSearchResult:(searchResultModel *)searchResult {
    _searchResult = searchResult;
    _nameLab.text = searchResult.Name;
    _phoneNumberLab.text = searchResult.Mobile;
    _addressLab.text = searchResult.Address;
    
}

@end
