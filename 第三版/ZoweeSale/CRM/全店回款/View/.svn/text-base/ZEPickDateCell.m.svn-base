//
//  ZETableViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPickDateCell.h"

@implementation ZEPickDateCell
{
    UILabel * _textLab;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setup{
    [super setup];
    self.backgroundColor = hexColorString(@"666666");
    
    _textLab = [UILabel new];
    [self.contentView addSubview:_textLab];
    _textLab.sd_layout
    .topEqualToView(self.contentView)
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .bottomEqualToView(self.contentView);
    
    _textLab.textAlignment = NSTextAlignmentCenter;
    _textLab.textColor = hexColorString(@"2e2e2e");
    _textLab.font = [UIFont systemFontOfSize:13];
    
    UIView * line = [UIView new];
    [self.contentView addSubview:line];
    line.sd_layout
    .leftEqualToView(self.contentView)
    .rightEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .heightIs(0.5);
    
    line.backgroundColor = hexColorString(@"666666");
}

- (void)setLabText:(NSNumber *)labText{
    _labText = labText;
    _textLab.text = [NSString stringWithFormat:@"%@",_labText];
}

@end
