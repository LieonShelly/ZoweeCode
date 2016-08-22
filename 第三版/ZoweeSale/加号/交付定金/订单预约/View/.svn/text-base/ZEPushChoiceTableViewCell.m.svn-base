//
//  ZEPushChoiceTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPushChoiceTableViewCell.h"

@implementation ZEPushChoiceTableViewCell{
    UILabel *titleLab;
    UITextField *contentField;
    UIImageView *rightIconImageView;
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
    }
    return self;
}
- (void)setup {
    UIView *contentView = self.contentView;
    titleLab = [UILabel new];
    [contentView addSubview:titleLab];
    titleLab.sd_layout
    .centerYEqualToView(contentView)
    .leftSpaceToView(contentView,20)
    .heightRatioToView(contentView,1)
    .widthIs(100);
    
    contentField = [UITextField new];
    contentField.borderStyle = UITextBorderStyleNone;
    contentField.enabled = NO;
    contentField.textAlignment = NSTextAlignmentRight;
    contentField.font = [UIFont systemFontOfSize:17];
    [contentView addSubview:contentField];
    contentField.sd_layout
    .topEqualToView(contentView)
    .bottomEqualToView(contentView)
    .rightSpaceToView(contentView,40)
    .leftSpaceToView(titleLab,10);
    
    rightIconImageView = [UIImageView new];
    rightIconImageView.image = [UIImage imageNamed:@"下级页面"];
    rightIconImageView.contentMode = UIViewContentModeCenter;
    [contentView addSubview:rightIconImageView];
    rightIconImageView.sd_layout
    .rightSpaceToView(contentView,10)
    .centerYEqualToView(contentView)
    .heightIs(20)
    .widthIs(20);
}

- (UITextField *)textField{
    return contentField;
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
        rightIconImageView.image = [UIImage imageNamed:@"下级页面"];
    }else{
        rightIconImageView.image = [UIImage imageNamed:rightIcon];
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
