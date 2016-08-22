//
//  ZETableImageRightCell.m
//  ZoweeSale
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZETableImageRightCell.h"

@interface ZETableImageRightCell ()
@property (weak, nonatomic) IBOutlet UIImageView *doorImageView;
@property (weak, nonatomic) IBOutlet UILabel *doorTypeLable;
@property (weak, nonatomic) IBOutlet UILabel *doorSizeLable;

@property (weak, nonatomic) IBOutlet UIView *toolContentView;
@end


@implementation ZETableImageRightCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.toolContentView.backgroundColor = hexColorString(@"f5f5f5");
    self.toolContentView.layer.cornerRadius = 5;
    self.toolContentView.layer.masksToBounds = YES;
    self.doorSizeLable.textColor = hexColorString(@"2e2e2e");
    self.doorTypeLable.textColor = hexColorString(@"2e2e2e");
//    self.doorSizeLable.
    self.doorImageView.layer.cornerRadius = 5;
    self.doorImageView.layer.masksToBounds = YES;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    ZETableImageRightCell * cell = [tableView dequeueReusableCellWithIdentifier:@"imageRight"];
    if(cell == nil)
    {
        cell = [[ ZETableImageRightCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"imageRight"];
    }
    return cell;
    
}


@end
