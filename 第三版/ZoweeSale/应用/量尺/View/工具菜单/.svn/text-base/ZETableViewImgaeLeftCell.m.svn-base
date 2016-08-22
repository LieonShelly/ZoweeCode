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


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    ZETableViewImgaeLeftCell * cell = [tableView dequeueReusableCellWithIdentifier:@"imageLeft"];
    if(cell == nil)
    {
        cell = [[ZETableViewImgaeLeftCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"imageLeft"];
    }
    cell.backgroundColor = hexColorString(@"f0f0f0");
    UIView * selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, cell.width, cell.height)];
    selectedView.backgroundColor = hexColorString(@"e7e7e7");
    cell.selectedBackgroundView = selectedView;
    return cell;
    
}

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

- (void)setWallEdtitOption:(ZEWallEditOption *)wallEdtitOption
{
    _wallEdtitOption = wallEdtitOption;
    self.iconImageView.image = [UIImage imageNamed:wallEdtitOption.iconName];
    self.nameLabel.text = wallEdtitOption.optionName;
    
}
@end
