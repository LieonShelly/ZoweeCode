//
//  serviceTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "serviceTableViewCell.h"
#import "servicePeopleView.h"
@interface serviceTableViewCell ()
@property (strong, nonatomic)  UILabel *numberLabel;
@property (nonatomic ,strong) NSArray*teamService;

@end

@implementation serviceTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}
- (void)setup{
    [super setup];
    self.numberLabel = [UILabel new];
    _numberLabel.textColor = hexColorString(@"9a9a9a");
    _numberLabel.font = [UIFont systemFontOfSize:12];
    [self.backView addSubview:_numberLabel];
    _numberLabel.sd_layout
    .leftSpaceToView(self.titleLab,10)
    .bottomEqualToView(self.titleLab)
    .widthIs(10)
    .heightIs(_numberLabel.font.lineHeight);
    
    
    
    
}
- (void)setDetail:(customerDetail *)detail{
    [super setDetail:detail];
    self.teamService = detail.TeamInfo;
    if (_teamService) {
        if (_teamService.count == 0) {
            [self PromptView];
        }
        else {
            [self teamScrollView];
        }
        
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)PromptView {
    self.numberLabel.text = @"0人";
    self.numberLabel.sd_layout.widthIs([_numberLabel labelSizeWidth]);
    UILabel *lab = [UILabel new];
    lab.text = @"暂无服务团队信息";
    lab.textColor = [UIColor colorWithHexString:@"666666"];
    lab.font = [UIFont systemFontOfSize:15];
    [self.customerView addSubview:lab];
    lab.sd_layout
    .leftEqualToView(self.customerView)
    .topSpaceToView(self.customerView,25)
    .heightIs(15)
    .widthIs([lab labelSizeWidth]);
    [self.customerView setupAutoHeightWithBottomView:lab bottomMargin:15];

}
- (void)teamScrollView {
    self.numberLabel.text = [NSString stringWithFormat:@"%lu人",(unsigned long)_teamService.count];
    self.numberLabel.sd_layout.widthIs([_numberLabel labelSizeWidth]);
    _teamService = [teamInfo mj_objectArrayWithKeyValuesArray:_teamService];
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.userInteractionEnabled = NO;
    [self.customerView addSubview:scrollView];
    scrollView.sd_layout
    .topSpaceToView(self.customerView,25)
    .leftEqualToView(self.customerView)
    .rightEqualToView(self.customerView)
    .heightIs(55);
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    UIView *leftView = scrollView;
    NSInteger leftSpace = 15;
    for (int i = 0; i < _teamService.count; i++) {
       teamInfo *info = _teamService[i];
        servicePeopleView *item = [[servicePeopleView alloc]initWithInfo:info];
        [scrollView addSubview:item];
        if (i == 0) {
            item.sd_layout
            .leftEqualToView(scrollView)
            .topEqualToView(scrollView)
            .heightIs(55)
            .widthIs(38);
        }else {
            item.sd_layout
            .leftSpaceToView(leftView,leftSpace)
            .topEqualToView(scrollView)
            .heightIs(55)
            .widthIs(38);
        }
        leftView = item;
    }
    [self.customerView setupAutoHeightWithBottomView:scrollView bottomMargin:15];
}

@end
