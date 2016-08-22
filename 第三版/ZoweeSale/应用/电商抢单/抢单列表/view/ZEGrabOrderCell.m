//
//  ZEGrabOrderCell.m
//  ZoweeSale
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEGrabOrderCell.h"
#import "ZEAccountLabel.h"
@interface ZEGrabOrderCell()
@property(nonatomic,strong)UILabel * customerName;
@property(nonatomic,strong)UILabel * customerAddress;
@property(nonatomic,strong)ZEAccountLabel * grabState;
@property(nonatomic,strong)UILabel * grabOrder;
@end
@implementation ZEGrabOrderCell

- (void)setup{
    [super setup];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = hexColorString(@"ffffff");
    
    _customerName = [[UILabel alloc]init];
    [self.contentView addSubview:_customerName];
    _customerName.textColor = hexColorString(@"2e2e2e");
    _customerName.font = [UIFont systemFontOfSize:17];
    _customerName.sd_layout
    .topSpaceToView(self.contentView,20)
    .leftSpaceToView(self.contentView,10)
    .rightSpaceToView(self.contentView,70);
    
    _grabOrder = [UILabel new];
    [self.contentView addSubview:_grabOrder];
    _grabOrder.layer.masksToBounds = YES;
    _grabOrder.layer.cornerRadius = 3;
    _grabOrder.textAlignment = NSTextAlignmentCenter;
    _grabOrder.backgroundColor = hexColorString(@"fa5a5a");
    _grabOrder.font = [UIFont systemFontOfSize:10];
    _grabOrder.textColor = hexColorString(@"ffffff");
    _grabOrder.text = @"现在去抢";
    _grabOrder.sd_layout
    .rightSpaceToView(self.contentView,10)
    .bottomSpaceToView(self.contentView,10)
    .widthIs(60)
    .heightIs(22);
    
    _grabState = [[ZEAccountLabel alloc]init];
    [self.contentView addSubview:_grabState];
    _grabState.textAlignment = NSTextAlignmentCenter;
    [_grabState setVerticalAlignment:VerticalAlignmentTop];
    _grabState.textColor = hexColorString(@"808080");
    _grabState.font = [UIFont systemFontOfSize:12];
    _grabState.sd_layout
    .topSpaceToView(self.contentView,20)
    .rightSpaceToView(self.contentView,10)
    .heightIs(20)
    .widthIs(60);
    
    _customerAddress = [[UILabel alloc]init];
    _customerAddress.textColor = hexColorString(@"808080");
    _customerAddress.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_customerAddress];
    _customerAddress.sd_layout
    .bottomSpaceToView(self.contentView,10)
    .leftEqualToView(_customerName)
    .rightEqualToView(_grabOrder)
    .heightIs(20);
    
    //线
    UIView * line = [UIView new];
    [self.contentView addSubview:line];
    line.backgroundColor = hexColorString(@"dbdbdb");
    line.sd_layout
    .bottomEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .heightIs(0.5);
}

- (void)setModel:(ZEGrabCustomerList *)model{
    _model = model;
    _customerName.text = _model.CustomerName;
    _customerAddress.text = _model.Address;
    if ([_model.State integerValue] == 0) {
        _grabState.text = @"未抢单";
        _grabOrder.hidden = NO;
    }else{
        _grabState.text = @"已被抢";
        _grabOrder.hidden = YES;
    }
}

@end
