//
//  sourceTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "sourceTableViewCell.h"

@interface sourceTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *sourceLab;

@property (weak, nonatomic) IBOutlet UIImageView *select;
@end

@implementation sourceTableViewCell

- (void)awakeFromNib {
    // Initialization code
     self.select.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setType:(NSString *)type {
    _type = type;
    self.sourceLab.text = type;
}

- (void)setIsSelectd:(BOOL)isSelectd {
    _isSelectd = isSelectd;
    if (isSelectd) {
        self.select.hidden = NO;
    }else {
        self.select.hidden = YES;
    }
}
@end
