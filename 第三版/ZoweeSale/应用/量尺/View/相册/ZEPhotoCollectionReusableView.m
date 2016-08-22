//
//  ZEPhotoCollectionReusableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPhotoCollectionReusableView.h"

@implementation ZEPhotoCollectionReusableView{
    UILabel *_titleLab;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    _titleLab = [UILabel new];
    [self addSubview:_titleLab];
    _titleLab.sd_layout
    .centerYEqualToView(self)
    .leftSpaceToView(self,32)
    .widthIs(68)
    .heightIs(17);
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _titleLab.text = title;
}
@end
