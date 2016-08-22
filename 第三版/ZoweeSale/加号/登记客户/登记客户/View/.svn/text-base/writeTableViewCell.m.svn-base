//
//  writeTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/25.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "writeTableViewCell.h"

@interface writeTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *star;

@end

@implementation writeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.star.hidden = NO;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setIsNeed:(BOOL)isNeed {
    _isNeed = isNeed;
    if (!_isNeed) {
        self.star.hidden = YES;
    }else {
       self.star.hidden = NO;
    }
}

@end
