//
//  mapLocationTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "mapLocationTableViewCell.h"

@interface mapLocationTableViewCell ()

@property (nonatomic ,strong)UILabel *addressNameLab;

@property (nonatomic ,strong)UILabel *addressDetailLab;

@end

@implementation mapLocationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setup {
    UIView *contentView = self.contentView;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    //self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    _addressNameLab = [UILabel new];
    _addressNameLab.textColor = [UIColor colorWithHexString:@"2e2e2e"];
    _addressNameLab.font = [UIFont systemFontOfSize:18];
    [contentView addSubview:_addressNameLab];
    _addressNameLab.sd_layout
    .topSpaceToView(contentView,10)
    .leftSpaceToView(contentView,20)
    .rightSpaceToView(contentView,10)
    .heightIs(20);
    
    _addressDetailLab = [UILabel new];
    _addressDetailLab.textColor = [UIColor colorWithHexString:@"666666"];
    _addressDetailLab.font = [UIFont systemFontOfSize:15];
    _addressDetailLab.numberOfLines = 0;
    [contentView addSubview:_addressDetailLab];
    _addressDetailLab.sd_layout
    .topSpaceToView(_addressNameLab,15)
    .leftSpaceToView(contentView,20)
    .rightSpaceToView(contentView,10)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:_addressDetailLab bottomMargin:10];
    
    
}

- (void)setModel:(mapLocation *)model {
    _model = model;
    self.addressNameLab.text = model.HouseName;
    self.addressDetailLab.text = model.Address;
}


@end
