//
//  ZEnameTextTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/24.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEnameTextTableViewCell.h"
#import "UIButton+Extension.h"
#import "HZURLNavigation.h"

@implementation ZEnameTextTableViewCell{
    UILabel *titleLab;
    UITextField *contentField;
    UIButton *rightIconImageView;
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
        [self setup];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)setup {
    UIView *contentView = self.contentView;
    titleLab = [UILabel new];
    [contentView addSubview:titleLab];
    titleLab.sd_layout
    .centerYEqualToView(contentView)
    .leftSpaceToView(contentView,15)
    .heightRatioToView(contentView,1)
    .widthIs(100);
    UILabel *star = [UILabel new];
    star.text = @"✲";
    star.textColor = [UIColor redColor];
    star.font = [UIFont systemFontOfSize:10];
    [contentView addSubview:star];
    star.sd_layout
    .centerYEqualToView(titleLab)
    .leftSpaceToView(titleLab,9)
    .widthIs(10)
    .heightIs(10);
    
    contentField = [UITextField new];
    contentField.borderStyle = UITextBorderStyleNone;
    contentField.enabled = NO;
    contentField.textAlignment = NSTextAlignmentRight;
    contentField.clearButtonMode = UITextFieldViewModeAlways;
    contentField.font = [UIFont systemFontOfSize:17];
    [contentView addSubview:contentField];
    contentField.sd_layout
    .topEqualToView(contentView)
    .bottomEqualToView(contentView)
    .rightSpaceToView(contentView,40)
    .leftSpaceToView(star,10);
    
    rightIconImageView = [UIButton new];
    rightIconImageView.image = @"下级页面";
    rightIconImageView.contentMode = UIViewContentModeCenter;
    [contentView addSubview:rightIconImageView];
    rightIconImageView.sd_layout
    .rightEqualToView(contentView)
    .centerYEqualToView(contentView)
    .heightIs(40)
    .widthIs(40);
}

- (UITextField *)textField{
    return contentField;
}

- (void)setAction:(SEL)action{
    [rightIconImageView addTarget:[HZURLNavigation currentViewController] action:action];
}

- (void)setEnable:(BOOL)enable{
    _enable = enable;
    contentField.enabled = enable;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    titleLab.text = title;
    CGFloat width = [titleLab.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}].width;
    titleLab.sd_layout.widthIs(width);
}

- (void)setRightIcon:(NSString *)rightIcon {
    _rightIcon = rightIcon;
    if (!rightIcon) {
        rightIconImageView.image = @"下级页面";
    }else{
        rightIconImageView.image = rightIcon;
    }
}
- (void)setPlaceholderText:(NSString *)placeholderText {
    _placeholderText = placeholderText;
    contentField.placeholder = placeholderText;
}
- (void)setContentText:(NSString *)contentText {
    _contentText = contentText;
    contentField.text = contentText;
}


@end
