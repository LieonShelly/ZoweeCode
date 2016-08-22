//
//  ZEPopTableViewCell.m
//  ZoweeSale
//
//  Created by lieon on 16/7/13.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPopTableViewCell.h"

@interface ZEPopTableViewCell()
@property (nonatomic ,strong) UILabel * titleLabel;


@end
@implementation ZEPopTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
    }
    return self;
}

- (void)setModel:(ZETagModel *)model
{
    _model = model;
    self.titleLabel.text = model.Title;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = hexColorString(@"424043");
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titleLabel;
}
@end
