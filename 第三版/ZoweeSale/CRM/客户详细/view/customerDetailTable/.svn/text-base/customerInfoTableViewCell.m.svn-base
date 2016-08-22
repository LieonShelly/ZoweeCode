//
//  customerInfoTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/8.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "customerInfoTableViewCell.h"
#import "UIColor+system.h"

@interface customerInfoTableViewCell ()


/**
 *  客户姓名lab
 */
@property (nonatomic ,strong)UILabel *nameLab;
/**
 *  电话号码lab
 */
@property (nonatomic ,strong)UILabel *mobileLab;
/**
 *  地址lab
 */
@property (nonatomic ,strong)UILabel *addressLab;
@end

@implementation customerInfoTableViewCell


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
   //


    // Configure the view for the selected state
}

- (void)setup {
    [super setup];
    //姓名
    UILabel *name = [UILabel new];
    name.textColor = [UIColor colorWithHexString:@"999999"];
    [self.customerView addSubview:name];
    name.text = @"姓名";
    name.sd_layout
    .leftEqualToView(self.customerView)
    .topSpaceToView(self.customerView,25)
    .widthIs(34)
    .heightIs(17);
    
    self.nameLab = [UILabel new];
    self.nameLab.textColor = [UIColor colorWithHexString:@"999999"];
    [self.customerView addSubview:self.nameLab];
    self.nameLab.sd_layout
    .leftSpaceToView(name,30)
    .centerYEqualToView(name)
    .heightIs(20)
    .rightEqualToView(self.customerView);
    
    //电话
    UILabel *mobile = [UILabel new];
    mobile.textColor = [UIColor colorWithHexString:@"999999"];
    mobile.text = @"电话";
    [self.customerView addSubview:mobile];
    mobile.sd_layout
    .leftEqualToView(name)
    .topSpaceToView(name,20)
    .widthIs(34)
    .heightIs(17);
    
    self.mobileLab = [UILabel new];
    self.mobileLab.textColor = [UIColor colorWithHexString:@"999999"];
    [self.customerView addSubview:self.mobileLab];
    self.mobileLab.sd_layout
    .leftSpaceToView(mobile,30)
    .centerYEqualToView(mobile)
    .heightIs(20)
    .rightEqualToView(self.customerView);
    
    //地址
    UILabel *address = [UILabel new];
    address.textColor = [UIColor colorWithHexString:@"999999"];
    address.text = @"地址";
    [self.customerView addSubview:address];
    address.sd_layout
    .leftEqualToView(mobile)
    .topSpaceToView(mobile,20)
    .widthIs(34)
    .heightIs(17);
    
    self.addressLab = [UILabel new];
    self.addressLab.textColor = [UIColor colorWithHexString:@"999999"];
    self.addressLab.numberOfLines = 0;
    [self.customerView addSubview:self.addressLab];
    self.addressLab.sd_layout
    .leftSpaceToView(address,30)
    .topSpaceToView(address,-20)
    .autoHeightRatio(0)
    .rightEqualToView(self.customerView);
    
    [self.customerView setupAutoHeightWithBottomView:self.addressLab bottomMargin:15];
}

- (void)setModel:(customerinfoModel *)model {
    _model = model;
    
    _nameLab.text = model.customerName;
    _mobileLab.text = model.Mobile;
    _addressLab.text = model.address;
}
@end
