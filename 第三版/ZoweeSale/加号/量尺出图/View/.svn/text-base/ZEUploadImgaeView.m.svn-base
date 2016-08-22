//
//  ZEUploadImgaeView.m
//  ZoweeSale
//
//  Created by apple on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEUploadImgaeView.h"


@interface ZEUploadImgaeView ()
@property(nonatomic,weak) UIButton  * btn;

@end
@implementation ZEUploadImgaeView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addButton];
        self.userInteractionEnabled = YES;
        self. contentMode = UIViewContentModeScaleToFill;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    self.btn.x = self.width - self.btn.width;
//    self.btn.y = 0;
//    
}
- (void)addButton
{
    
    UIButton * btn  = [UIButton new];
    [btn setImage:[UIImage imageNamed:@"+"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    [btn sizeToFit];
    self.btn = btn;
    [self addSubview:btn];
    
    
    
}

- (void)btnClick
{
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ZEUploadImgaeView" object:self];
}
@end
