//
//  ZETableViewImgaeLeftCell.m
//  ZoweeSale
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZETableViewImgaeLeftCell.h"

@interface ZETableViewImgaeLeftCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ZETableViewImgaeLeftCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = hexColorString(@"f0f0f0");
}



- (void)setEdtionOption:(ZEDoorEditOption *)edtionOption
{
    _edtionOption = edtionOption;
    self.iconImageView.image = [UIImage imageNamed:edtionOption.iconName];
    self.nameLabel.text = edtionOption.title;
}
@end
