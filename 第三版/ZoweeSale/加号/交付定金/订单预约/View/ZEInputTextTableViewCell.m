//
//  ZEInputTextTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEInputTextTableViewCell.h"

@implementation ZEInputTextTableViewCell{
    UILabel *titleLab;
    UITextField *contentField;
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
    contentField.textAlignment = NSTextAlignmentRight;
    contentField.font = [UIFont systemFontOfSize:17];
    [contentView addSubview:contentField];
    contentField.sd_layout
    .topEqualToView(contentView)
    .bottomEqualToView(contentView)
    .rightSpaceToView(contentView,10)
    .leftSpaceToView(titleLab,10);
}

- (void)setTitle:(NSString *)title {
    _title = title;
    titleLab.text = title;
}
- (void)setPlaceholderText:(NSString *)placeholderText {
    _placeholderText = placeholderText;
    contentField.placeholder = placeholderText;
}
- (void)setContentText:(NSString *)contentText {
    _contentText = contentText;
    contentField.text = contentText;
}
- (void)setKeyType:(UIKeyboardType)keyType {
    _keyType = keyType;
    contentField.keyboardType = keyType;
}
- (void)setLab:(NSString *)lab {
    _lab = lab;
    contentField.sd_layout
    .rightSpaceToView(self.contentView,30);
    UILabel *label = [UILabel new];
    label.textColor = [UIColor colorWithHexString:@"999999"];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = lab;
    [self.contentView addSubview:label];
    label.sd_layout
    .rightEqualToView(self.contentView)
    .topEqualToView(self.contentView)
    .bottomEqualToView(self.contentView)
    .widthIs(30);
}
- (UITextField *)getInputTextField {
    return contentField;
}

@end
