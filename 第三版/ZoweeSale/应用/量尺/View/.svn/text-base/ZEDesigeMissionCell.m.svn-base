//
//  ZEDesigeMissionCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEDesigeMissionCell.h"
#import "UIImageView+WebCache.h"

@interface ZEDesigeMissionCell()

@property (nonatomic) UIImageView *imageView;

@property (nonatomic) UILabel *upLoading;

@end

@implementation ZEDesigeMissionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.contentView.backgroundColor = [UIColor grayColor];
    UIView *contentView =  self.contentView;
    self.layer.shadowColor = [[UIColor blackColor]CGColor];
    self.layer.shadowOffset = CGSizeMake(1, 1);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowRadius = 5;
    
    _imageView = [UIImageView new];
    [contentView addSubview:_imageView];
    _imageView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    
    
    _upLoading = [UILabel new];
    _upLoading.textColor = hexColorString(@"25a81f");
    _upLoading.font = [UIFont systemFontOfSize:12];
    [contentView addSubview:_upLoading];
    _upLoading.sd_layout
    .bottomSpaceToView(contentView,10)
    .rightSpaceToView(contentView,20)
    .heightIs(12)
    .widthIs(36);
    

    
}

- (void)setModel:(ZEDesigeMission *)model {
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.ImgPath]];
    if (model.isUP) {
        self.upLoading.text = @"已上传";
    }else {
        self.upLoading.text = @"未上传";
    }
   
}

@end
