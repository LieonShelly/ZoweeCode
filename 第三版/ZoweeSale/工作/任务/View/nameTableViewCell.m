//
//  nameTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/29.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "nameTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface nameTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *photeImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskState;
@property (weak, nonatomic) IBOutlet UILabel *finishNumberLab;

@end

@implementation nameTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _photeImage.layer.masksToBounds = YES;
    _photeImage.layer.cornerRadius = _photeImage.width*0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPhoteUrl:(NSString *)photeUrl {
    _photeUrl = photeUrl;
    [_photeImage sd_setImageWithURL:StrURL(photeUrl) placeholderImage:ImageWithName(@"头像")];
}

- (void)setName:(NSString *)name {
    _name = name;
    self.nameLab.text = name;
}

- (void)setTagStr:(NSString *)tagStr {
    
    _tagStr = tagStr;
    self.tagLabel.text = tagStr;
}

- (void)setStateStr:(NSString *)stateStr {
    _stateStr = stateStr;
    self.taskState.text = stateStr;
}

- (void)setFinishNumber:(NSString *)finishNumber {
    _finishNumber = finishNumber;
    self.finishNumberLab.text = finishNumber;
}
@end
