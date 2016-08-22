//
//  ZETargetBtn.m
//  ZoweeSale
//
//  Created by apple on 16/6/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZETargetBtn.h"

@implementation ZETargetBtn

- (instancetype)init{
    if (self = [super init]) {
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return self;
}

//左图右文
//重新设置文字的位置信息
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(contentRect.size.height , 0, contentRect.size.width - contentRect.size.height , contentRect.size.height);
}

//重新设置图片的位置信息
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 1.5, contentRect.size.height-3, contentRect.size.height-3);
}

@end
