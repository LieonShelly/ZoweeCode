//
//  ZEShopTableViewCell.m
//  ZoweeSale
//
//  Created by lieon on 16/6/14.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEShopTableViewCell.h"


@interface ZEShopTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *dividerLine;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

@end

@implementation ZEShopTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.dividerLine.backgroundColor = hexColorString(@"dbdbdb");
}

- (void)setShop:(ZEJoinShop *)shop
{
    _shop = shop;
    self.titlelabel.text = shop.JoinShopName;
}

@end
