//
//  choiceTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/25.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "choiceTableViewCell.h"
#import "UIColor+system.h"

@implementation choiceTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setChocieStr:(NSString *)chocieStr {
    _chocieStr = chocieStr;
    if (!chocieStr.isNoEmpty) {
        self.chocieText.textColor = [UIColor colorWithHexString:@"CCCCCC"];
    }else {
        self.chocieText.textColor = [UIColor blackColor];
        self.chocieText.text = chocieStr;
    }
}

@end
