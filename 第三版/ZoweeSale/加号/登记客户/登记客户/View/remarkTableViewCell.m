//
//  remarkTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/25.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "remarkTableViewCell.h"

@interface remarkTableViewCell ()



@end

@implementation remarkTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRemark:(NSString *)remark {
    _remark = remark;
    self.remarkText.text = remark;
}

@end
