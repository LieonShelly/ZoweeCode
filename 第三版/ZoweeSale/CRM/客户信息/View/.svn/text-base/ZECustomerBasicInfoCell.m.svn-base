//
//  ZECustomerBasicInfoCell.m
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECustomerBasicInfoCell.h"

@interface ZECustomerBasicInfoCell ()

@property (weak, nonatomic) IBOutlet UILabel *CustomerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *MobileLabel;
@property (weak, nonatomic) IBOutlet UILabel *AddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *HouseNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *GuideNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *SourceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *Remark;
@property (weak, nonatomic) IBOutlet UILabel *decorationCompany;
@property (weak, nonatomic) IBOutlet UILabel *decorationDesigner;

@end

@implementation ZECustomerBasicInfoCell

- (void)setBaseInfo:(ZECustomerBaseInfo *)baseInfo
{
    _baseInfo = baseInfo;

    self.CustomerNameLabel.text = baseInfo.CustomerName;
    self.MobileLabel.text = baseInfo.Mobile;
    self.AddressLabel.text = baseInfo.Address;
    self.HouseNumberLabel.text = baseInfo.HouseNumber;
    self.GuideNameLabel.text = baseInfo.GuideName;
    self.SourceNameLabel.text = baseInfo.SourceName;
    self.Remark.text =  baseInfo.Remark;

    self.decorationCompany.text = baseInfo.DecorateName;
    self.decorationDesigner.text = baseInfo.DesignerName;
//    self.decorationCompany.text = baseInfo.


}

@end
