//
//  implTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/29.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "implTableViewCell.h"

@interface implTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *executorNameLab;
@end

@implementation implTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setExecutorNameList:(NSString *)executorNameList {
    _executorNameList = executorNameList;
    self.executorNameLab.text = executorNameList;
}
@end
