//
//  ZECustomerTeamCell.m
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECustomerTeamCell.h"
#import "ZEBoundCornorImageView.h"
#import "UIImageView+WebCache.h"


@interface ZECustomerTeamCell ()

@property (weak, nonatomic) IBOutlet ZEBoundCornorImageView *teamerIcon;
@property (weak, nonatomic) IBOutlet UILabel *teamerLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobNameLable;

@end


@implementation ZECustomerTeamCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.teamerLabel.backgroundColor = [UIColor colorWithHexString:@"2e2e2e"];
    self.teamerIcon.layer.cornerRadius = self.teamerIcon.height * 0.5;
    self.teamerIcon.layer.masksToBounds = YES;
}

- (void)setTeam:(ZECustomerTeam *)team
{
    _team = team;
    self.teamerLabel.text = team.UserName;
    [self.teamerIcon sd_setImageWithURL:[NSURL URLWithString:team.Url] placeholderImage:[UIImage imageNamed:@"头像"] options:SDWebImageRefreshCached];
    self.jobNameLable.text = team.JobName;
}

@end
