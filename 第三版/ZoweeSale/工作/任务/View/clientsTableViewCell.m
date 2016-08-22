//
//  clientsTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/29.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "clientsTableViewCell.h"

@interface clientsTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *clientsLab;


@end

@implementation clientsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setClientStr:(NSString *)clientStr {
    _clientStr = clientStr;
    self.clientsLab.text = clientStr;
}

@end
