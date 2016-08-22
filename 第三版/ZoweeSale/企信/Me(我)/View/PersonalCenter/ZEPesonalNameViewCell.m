//
//  ZEPesonalNameViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPesonalNameViewCell.h"
#import "ZEPersonalInfo.h"
#import "ZEQXTool.h"
#import "UIImageView+WebCache.h"


@interface ZEPesonalNameViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;



@end

@implementation ZEPesonalNameViewCell



- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = hexColorString(@"ffffff");
    self.nameLabel.textColor = hexColorString(@"2e2e2e");
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = self.iconImageView.width * 0.5;

}

+ (instancetype)cellWithTableView:(UITableView*)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    ZEPesonalNameViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
        cell = [[ZEPesonalNameViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

#pragma mark - 公共接口 

- (void)setUserInfos:(ZEPersonalInfo *)userInfos
{
    _userInfos = userInfos;
    self.nameLabel.text = userInfos.Name;
      [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:self.userInfos.HeadUrl] placeholderImage:[UIImage imageNamed:@"男"]];
//    [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:[NSURL URLWithString:userInfos.HeadUrl] options:0 progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//             self.iconImageView.image = [UIImage imageWithData:data];
//        });
//    }];
}

@end
