//
//  mapTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/25.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "mapTableViewCell.h"
#import "UIColor+system.h"

@interface mapTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *addressLab;

@end

@implementation mapTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setAddress:(NSString *)address {
    _address = address;
    if (!(address.length > 0)) {
        self.addressLab.text = @"选择客户楼盘地址";
        self.addressLab.textColor = [UIColor colorWithHexString:@"cccccc"];
    }else {
        self.addressLab.text = address;
        self.addressLab.textColor = [UIColor blackColor];
    }
    
}

@end
