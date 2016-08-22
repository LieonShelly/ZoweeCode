//
//  ZESetTableViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZESetTableViewCell.h"

@interface ZESetTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLable;
@property (weak, nonatomic) IBOutlet UILabel *extLabel;

@end
@implementation ZESetTableViewCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor clearColor];
    self.titleLabel.textColor = hexColorString(@"2e2e2e");
    self.subTitleLable.textColor = hexColorString(@"2e2e2e");
    self.extLabel.textColor = hexColorString(@"fa5a5a");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
