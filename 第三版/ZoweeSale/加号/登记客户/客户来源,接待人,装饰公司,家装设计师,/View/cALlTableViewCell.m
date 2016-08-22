//
//  cALlTableViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "cALlTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface cALlTableViewCell ()

@end


@implementation cALlTableViewCell

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

- (void)setup{
    UIView *contentView = self.contentView;
    _headImage = [[UIImageView alloc]init];
    [contentView addSubview:_headImage];
    _headImage.sd_layout
    .centerYEqualToView(contentView)
    .leftSpaceToView(contentView,15)
    .heightIs(40)
    .widthEqualToHeight();

    _checkedImage = [[UIImageView alloc]initWithImage:ImageWithName(@"勾选")];
    [contentView addSubview:_checkedImage];
    _checkedImage.sd_layout
    .centerYEqualToView(contentView)
    .rightSpaceToView(contentView,15)
    .widthIs(9)
    .heightIs(7);
    
    _nameLab = [UILabel new];
    [contentView addSubview:_nameLab];
    _nameLab.sd_layout
    .centerYEqualToView(contentView)
    .leftSpaceToView(_headImage,10)
    .heightIs(17)
    .rightSpaceToView(_checkedImage,5);
    
    _checkedImage.hidden = YES;
    
}

- (void)setModel:(choAllModel *)model {
    _model = model;
    _nameLab.text = model.Name;
    if (!model.url.isNoEmpty) {
        _headImage.sd_layout
        .heightIs(0);
    }else{
        [_headImage sd_setImageWithURL:[NSURL URLWithString:model.url] placeholderImage:[UIImage imageNamed:@"头像"]];
    }
    
}

@end
