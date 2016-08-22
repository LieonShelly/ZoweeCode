//
//  ZESettingViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZESettingViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZESettingViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImagview;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation ZESettingViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = hexColorString(@"ffffff");
    self.nameLabel.textColor = hexColorString(@"2e2e2e");

}

+ (instancetype)cellWithTableView:(UITableView*)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    ZESettingViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
        cell = [[ZESettingViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

@end
