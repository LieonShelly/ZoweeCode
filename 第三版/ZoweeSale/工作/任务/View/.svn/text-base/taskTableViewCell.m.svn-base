//
//  taskTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/29.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "taskTableViewCell.h"


@interface taskTableViewCell ()

@end

@implementation taskTableViewCell{
    UIImageView *_taskFinishImageView;
    UILabel *_taskName;
    UILabel *_taskCon;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setup {
    UIView *contentview = self.contentView;
    
    _taskFinishImageView = [UIImageView new];
    [contentview addSubview:_taskFinishImageView];
    _taskFinishImageView.sd_layout
    .topSpaceToView(contentview,9)
    .leftSpaceToView(contentview,31)
    .heightIs(18)
    .widthIs(18);
    
    _taskName = [UILabel new];
    [contentview addSubview:_taskName];
    _taskName.sd_layout
    .centerYEqualToView(_taskFinishImageView)
    .leftSpaceToView(_taskFinishImageView,10)
    .rightEqualToView(contentview)
    .heightIs(17);
    
    
    _taskCon = [UILabel new];
    _taskCon.numberOfLines = 0;
    [contentview addSubview:_taskCon];
    
    _taskCon.sd_layout
    .leftEqualToView(_taskName)
    .topSpaceToView(_taskName,11)
    .rightEqualToView(contentview)
    .autoHeightRatio(0);
    
    [self setupAutoHeightWithBottomView:_taskCon bottomMargin:8];
}

-(void)setTaskStr:(NSString *)taskStr {
    _taskStr = taskStr;
    _taskName.text = taskStr;
}

- (void)setTaskCont:(NSString *)taskCont {
    _taskCont = taskCont;
    if (!(taskCont.length > 0)) {
        _taskCon.text = @"暂无任务描述";
    }else {
        _taskCon.text = taskCont;
    }
  
}

- (void)setState:(NSNumber *)state {
    _state = state;
    if ([state isEqual:@2]) {
        _taskFinishImageView.image = [UIImage imageNamed:@"任务完成"];
    }else {
        _taskFinishImageView.image = [UIImage imageNamed:@"任务未完成"];
    }
}

@end
