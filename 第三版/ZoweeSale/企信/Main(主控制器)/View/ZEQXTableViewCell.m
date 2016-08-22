//
//  ZEQXTableViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEQXTableViewCell.h"

@implementation ZEQXTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView*)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    ZEQXTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
        cell = [[ZEQXTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
- (void)setQX:(ZEQX *)QX
{
    _QX = QX;
    self.imageView.image = [UIImage imageNamed:QX.icon];
    self.textLabel.text = QX.Title;
    self.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow"]];
}
@end
