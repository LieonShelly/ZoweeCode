//
//  floorTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "floorTableViewCell.h"

@interface floorTableViewCell()



@end

@implementation floorTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setup];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    if ([customerType isEqualToString:@"皮阿诺"]) {
      _floorTextField.enabled = YES;
    }else if ([customerType isEqualToString:@"玛格"]){
        _floorTextField.enabled = NO;
    }
    
}
- (void)setFloor:(NSString *)floor {
    _floor = floor;
    _floorTextField.text = floor;
}

- (void)setNumber:(NSString *)number {
    _number = number;
    _numberTextField.text = number;
    
}

@end
