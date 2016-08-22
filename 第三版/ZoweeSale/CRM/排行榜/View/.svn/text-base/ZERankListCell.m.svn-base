//
//  ZERankListCell.m
//  ZoweeSale
//
//  Created by apple on 16/6/27.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERankListCell.h"
#import "UIButton+Extension.h"
@interface ZERankListCell()
@property (weak, nonatomic) IBOutlet UIButton *rankBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *amountLab;
@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineHeight;

@end

@implementation ZERankListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _lineHeight.constant = 0.5;
    _line.backgroundColor = hexColorString(@"dbdbdb");
    self.backgroundColor = hexColorString(@"ffffff");
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _rankBtn.titleColor = [UIColor blackColor];
}
- (void)setListModel:(ZERankingList *)listModel{
    _listModel = listModel;
    NSString * ranking = [NSString stringWithFormat:@"%@",_listModel.Ranking];
    if([ranking isEqualToString:@"1"]){
        _rankBtn.bgImage = @"icon_reward_gold";
    }else if([ranking isEqualToString:@"2"]){
        _rankBtn.bgImage = @"icon_reward_copper";
    }else if([ranking isEqualToString:@"3"]){
        _rankBtn.bgImage = @"icon_reward_silver";
    }else{
        _rankBtn.bgImage = @" ";
    }
    
    _rankBtn.title = ranking;
    _nameLab.text = _listModel.UserName;
    _amountLab.text = [NSString stringWithFormat:@"%@",_listModel.Total];
    
}
@end
