//
//  timeTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/29.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "timeTableViewCell.h"
#import "NSDate+string.h"

@interface timeTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *timelabel;


@end

@implementation timeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setTimeStr:(NSString *)timeStr {
    _timeStr = timeStr;
    self.timelabel.text = [NSDate stringFormateWithString:timeStr];
}
@end
