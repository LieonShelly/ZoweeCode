//
//  ZEPhotoCollectionViewCell.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPhotoCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation ZEPhotoCollectionViewCell{
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_imageView];
    _imageView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.layer.masksToBounds = YES;
}
- (void)setImagePath:(imageList *)imagePath {
    _imagePath = imagePath;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imagePath.ImagePath]];
}

@end
