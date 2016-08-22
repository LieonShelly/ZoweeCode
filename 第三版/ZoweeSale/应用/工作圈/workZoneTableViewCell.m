//
//  workZoneTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "workZoneTableViewCell.h"

#import "UIImageView+WebCache.h"

@interface workZoneTableViewCell ()

@end

@implementation workZoneTableViewCell{
    //主要的页面区域
    UIView *_topMessageView;
    UIView *_taskDynamicView;
    UIView *_impView;
    UIView *_customerView;
    UIView *_finishTaskVIew;
    
    //控件
    UIImageView *_HeadImage;
    UILabel *_perNameLab;
    UILabel *_messTagLab;
    
    TYAttributedLabel *_taskFinishStateLab;
    UILabel *_taskFnishNumLab;
    
    UIImageView *_isFinishImage;
    UILabel *_taskNameLab;
    UILabel *_taskDetailLab;
    
    UIImageView *_iconPeopleImage;
    UIImageView *_iconTimeImage;
    UILabel *_impMessLab;
    UILabel *_impTimeLab;
    
    UIImageView *_linkImage;
    TYAttributedLabel *_linkCustomerLab;
    
    UIButton *_taskFinishBtn;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setup];
    }
    return self;
}

- (void)setup {
    
    _topMessageView = [UIView new];
    _taskDynamicView = [UIView new];
    _impView = [UIView new];
    _customerView = [UIView new];
    _finishTaskVIew = [UIView new];
    
    _HeadImage = [UIImageView new];
    _perNameLab = [UILabel new];
    _messTagLab = [UILabel new];
    _taskFinishStateLab = [[TYAttributedLabel alloc]init];
    _taskFnishNumLab = [UILabel new];
    
    _isFinishImage = [UIImageView new];
    _taskNameLab = [UILabel new];
    _taskDetailLab = [[UILabel alloc]init];
    
    _iconPeopleImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"身份"]];
    _iconTimeImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"时间点"]];
    _impMessLab = [UILabel new];
    _impTimeLab = [UILabel new];
    
    _linkImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"关联客户"]];
    _linkCustomerLab = [[TYAttributedLabel alloc]init];
    
    _taskFinishBtn = [UIButton new];
    
    UIView *contentView = self.contentView;
    [contentView addSubview:_topMessageView];
    [contentView addSubview:_taskDynamicView];
    [contentView addSubview:_impView];
    [contentView addSubview:_customerView];
    [contentView addSubview:_finishTaskVIew];
    
    [_topMessageView addSubview:_HeadImage];
    [_topMessageView addSubview:_perNameLab];
    [_topMessageView addSubview:_messTagLab];
    [_topMessageView addSubview:_taskFinishStateLab];
    [_topMessageView addSubview:_taskFnishNumLab];
    
    [_taskDynamicView addSubview:_isFinishImage];
    [_taskDynamicView addSubview:_taskNameLab];
    [_taskDynamicView addSubview:_taskDetailLab];
    
    [_impView addSubview:_iconPeopleImage];
    [_impView addSubview:_iconTimeImage];
    [_impView addSubview:_impMessLab];
    [_impView addSubview:_impTimeLab];
    
    [_customerView addSubview:_linkImage];
    [_customerView addSubview:_linkCustomerLab];
    
    [_finishTaskVIew addSubview:_taskFinishBtn];
    
    //先设置一些控件的约束
    _topMessageView.sd_layout
    .topSpaceToView(contentView,10)
    .leftSpaceToView(contentView,20)
    .rightSpaceToView(contentView,10)
    .heightIs(60);
    //_topMessageView.backgroundColor = [UIColor redColor];
    
    _taskDynamicView.sd_layout
    .topSpaceToView(_topMessageView,0)
    .leftEqualToView(contentView)
    .rightEqualToView(contentView);
   // _taskDynamicView.backgroundColor = [UIColor blueColor];
    
    _customerView.sd_layout
    .topSpaceToView(_taskDynamicView,10)
    .leftSpaceToView(contentView,20)
    .rightSpaceToView(contentView,20)
    .heightIs(43);
    _customerView.backgroundColor = hexColorString(@"f0edee");
    _customerView.sd_cornerRadius = @3;
    
    _finishTaskVIew.sd_layout
    .topSpaceToView(_customerView,10)
    .leftEqualToView(contentView)
    .rightEqualToView(contentView)
    .heightIs(45);
    
    
    //头像
    _HeadImage.sd_layout
    .topEqualToView(_topMessageView)
    .leftEqualToView(_topMessageView)
    .heightIs(49)
    .widthIs(49);
    _HeadImage.sd_cornerRadiusFromHeightRatio = @0.5;
    
    //关联客户lab
    _linkCustomerLab.textColor = hexColorString(@"999999");
    _linkCustomerLab.backgroundColor = [UIColor clearColor];
    _linkCustomerLab.verticalAlignment = TYVerticalAlignmentCenter;
    
    //在顶部和底部添加线条
    UIView *topLine = [UIView new];
    topLine.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
    [contentView addSubview:topLine];
    topLine.sd_layout
    .topEqualToView(contentView)
    .leftEqualToView(contentView)
    .rightEqualToView(contentView)
    .heightIs(0.5);
    
    UIView *bottomLine = [UIView new];
    bottomLine.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
    [contentView addSubview:bottomLine];
    bottomLine.sd_layout
    .bottomEqualToView(contentView)
    .leftEqualToView(contentView)
    .rightEqualToView(contentView)
    .heightIs(0.5);
    
}
- (void)setViewModel:(WorkZoneViewModel *)viewModel {
    _viewModel = viewModel;
    workZoneModel *model = viewModel.zoneModel;
    [_HeadImage sd_setImageWithURL:StrURL(model.HeadUrl) placeholderImage:ImageWithName(@"头像") options:SDWebImageRetryFailed];
    _perNameLab.text = model.UserName;
    _messTagLab.text = [model timeAndTagStr];
    _messTagLab.textColor = hexColorString(@"999999");
    _messTagLab.font = [UIFont systemFontOfSize:12];
    if (viewModel.isWorkProcess) {
        
    }else {
        [_taskFinishStateLab removeFromSuperview];
        [_taskFnishNumLab removeFromSuperview];
        
        _perNameLab.sd_layout
        .topSpaceToView(_topMessageView,2)
        .leftSpaceToView(_HeadImage,20)
        .rightEqualToView(_topMessageView)
        .heightIs(20);
        
        _messTagLab.sd_layout
        .topSpaceToView(_perNameLab,10)
        .leftSpaceToView(_HeadImage,20)
        .rightEqualToView(_topMessageView)
        .heightIs(20);
    }
    //移除从工作圈中
    [_isFinishImage removeFromSuperview];
    
    _taskNameLab.text = model.Title;
    _taskNameLab.sd_layout
    .topEqualToView(_taskDynamicView)
    .leftSpaceToView(_taskDynamicView,68)
    .rightEqualToView(_taskDynamicView)
    .heightIs(20);
    
    _taskDetailLab.text = model.Content;
    _taskDetailLab.font = [UIFont systemFontOfSize:15];
    _taskDetailLab.textColor = hexColorString(@"666666");
    _taskDetailLab.sd_layout
    .topSpaceToView(_taskNameLab,10)
    .leftEqualToView(_taskNameLab)
    .rightSpaceToView(_taskDynamicView,20)
    .autoHeightRatio(0);
    [_taskDynamicView setupAutoHeightWithBottomView:_taskDetailLab bottomMargin:5];
    
    if (viewModel.isExecution) {
        
    }else {
        [_iconPeopleImage removeFromSuperview];
        [_iconTimeImage removeFromSuperview];
        
        _impView.sd_layout
        .topSpaceToView(_taskDynamicView,0)
        .leftEqualToView(_taskDynamicView)
        .rightEqualToView(_taskDynamicView)
        .heightIs(0);
    }
    _linkImage.sd_layout
    .leftSpaceToView(_customerView,16)
    .centerYEqualToView(_customerView)
    .heightIs(23)
    .widthIs(23);
    
   // _linkCustomerLab.text =
    // 属性文本生成器
    TYTextContainer *textContainer = [[TYTextContainer alloc]init];
    NSString *text = [NSString stringWithFormat:@"关联客户:%@",model.CustomerName];
    textContainer.text = text;
    [textContainer addLinkWithLinkData:model.CustomerID linkColor:nil underLineStyle:kCTUnderlineStyleNone range:[text rangeOfString:model.CustomerName]];
    _linkCustomerLab.delegate = _delegate;
    _linkCustomerLab.textContainer = textContainer;
    
    _linkCustomerLab.sd_layout
    .leftSpaceToView(_linkImage,10)
    .rightEqualToView(_customerView)
    .topEqualToView(_customerView)
    .bottomEqualToView(_customerView);
    if (viewModel.isCanFinish) {
        
    } else {
        [self setupAutoHeightWithBottomView:_customerView bottomMargin:10];
    }
    
    
}

@end
