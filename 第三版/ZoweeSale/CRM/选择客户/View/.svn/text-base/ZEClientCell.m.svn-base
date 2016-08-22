//
//  ZEClientCell.m
//  ZoweeSale
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEClientCell.h"

@implementation ZEClientCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = hexColorString(@"ffffff");
}

- (IBAction)InterestedBuyers:(UIButton *)sender {
    NSNumber * BtnTag = [NSNumber numberWithInteger:sender.tag];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clientBtnClick" object:BtnTag];
}

- (IBAction)TheCustomerOrder:(UIButton *)sender {
    NSNumber * BtnTag = [NSNumber numberWithInteger:sender.tag];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clientBtnClick" object:BtnTag];
}

- (IBAction)Subscribers:(UIButton *)sender {
    NSNumber * BtnTag = [NSNumber numberWithInteger:sender.tag];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"clientBtnClick" object:BtnTag];
}


@end
