//
//  ZECompanyNoticeCell.m
//  ZoweeSale
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECompanyNoticeCell.h"

@interface ZECompanyNoticeCell ()
@property (weak, nonatomic) IBOutlet UIImageView * icon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *contenLabel;
@property (weak, nonatomic) IBOutlet UILabel *dividerLine;

@end

@implementation ZECompanyNoticeCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = hexColorString(@"ffffff");
    self.titleLabel.textColor = hexColorString(@"2e2e2e");
    self.dateLabel.textColor =hexColorString(@"999999");
    self.timeLabel.textColor = hexColorString(@"999999");
    self.contenLabel.textColor = hexColorString(@"595959");
    self.dividerLine.backgroundColor =hexColorString(@"dbdbdb");

    
}

#pragma mark - 公共接口

+ (instancetype)cellWithTableView:(UITableView*)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier
{
    ZECompanyNoticeCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        
        cell = [[ZECompanyNoticeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (void)setDividerHidden:(BOOL)dividerHidden
{
    _dividerHidden = dividerHidden;
    self.dividerLine.hidden = dividerHidden;
}

- (void)setNoticeList:(ZENoticeList *)noticeList
{
    _noticeList = noticeList;
    self.titleLabel.text = noticeList.Title;
    self.contenLabel.text = noticeList.Content;
    lieonLog(@"%@",noticeList.PublishTime);
    // 2016-03-21 09:54:10
    NSRange  range = NSMakeRange(0, 10);
    NSString * pushlishDateStr = [noticeList.PublishTime substringWithRange:range];
    self.dateLabel.text = pushlishDateStr;
    range = NSMakeRange(range.length, 6);
    self.timeLabel.text = [noticeList.PublishTime substringWithRange:range];
}
@end
