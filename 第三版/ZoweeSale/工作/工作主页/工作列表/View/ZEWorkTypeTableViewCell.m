//
//  ZEWorkTypeTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/10.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEWorkTypeTableViewCell.h"
#import "workCellHeaderView.h"
#import "workCellContentView.h"
#import "workCellFootView.h"

#define CELL_HEADVIEW_HEIGHT 60    //头部高度
#define CELL_BOTTOM_HEIGHT   35    //底部固定高度


@implementation ZEWorkTypeTableViewCell{
    workCellHeaderView *_headerView;
    workCellContentView *_contentView;
    workCellFootView *_footView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self UIsetup];
    }
    return self;
}
- (void)UIsetup{
    self.backgroundColor = [UIColor colorWithHexString:@"f0eded"];
    self.selectedBackgroundView = [[UIView alloc]initWithFrame:self.frame];
    self.selectedBackgroundView.backgroundColor = [UIColor colorWithHexString:@"f0eded"];
    _headerView = [[workCellHeaderView alloc]init];
    _contentView = [[workCellContentView alloc]init];
    _footView = [[workCellFootView alloc]init];
    UIView *contView = self.contentView;
    UIView *backView = [UIView new];
    [contView addSubview:backView];
    [backView addSubview:_headerView];
    [backView addSubview:_contentView];
    [backView addSubview:_footView];
    
    backView.sd_layout
    .topEqualToView(contView)
    .leftEqualToView(contView)
    .rightEqualToView(contView);

    _headerView.sd_layout
    .topSpaceToView(backView,5)
    .leftEqualToView(backView)
    .rightEqualToView(backView);
    //.heightIs(CELL_HEADVIEW_HEIGHT);
    
    _contentView.sd_layout
    .topSpaceToView(_headerView,0)
    .leftEqualToView(backView)
    .rightEqualToView(backView);
    //.heightIs(100);
    
    _footView.sd_layout
    .topSpaceToView(_contentView,0)
    .leftEqualToView(backView)
    .rightEqualToView(backView)
    .heightIs(CELL_BOTTOM_HEIGHT);
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = [UIColor blueColor];
//    [self.contentView addSubview:btn];
//    btn.sd_layout
//    .leftEqualToView(contView)
//    .rightEqualToView(contView)
//    .topSpaceToView(_footView,0)
//    .heightIs(50);
    
    [backView setupAutoHeightWithBottomView:_footView bottomMargin:0];
    [self setupAutoHeightWithBottomView:backView bottomMargin:5];
}

- (void)setWorkModel:(ZeroWork *)workModel {
    _workModel = workModel;
    _headerView.workModel = workModel;
    _contentView.workModel = workModel;
    _footView.workModel = workModel;
}


@end
