//
//  ZETableViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZETableViewCell.h"

@implementation ZETableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setup{
    [super setup];
    UILabel * label = [UILabel new];
    [self.contentView addSubview:label];
    label.frame = self.contentView.bounds;
    
}

@end
