//
//  ZECoverButton.m
//  ZoweeSale
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECoverButton.h"

@interface ZECoverButton ()

/**
 *  二级标题
 */
@property(nonatomic,weak)  UILabel  * subTitleLabel;

/**
 *  三级标题
 */
@property (nonatomic,weak)  UILabel  * ssTitleLabel;


@end
@implementation ZECoverButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UILabel * subTitileLabel = [[UILabel alloc]init];
        subTitileLabel.textColor = [UIColor grayColor];
        subTitileLabel.font = [UIFont systemFontOfSize:15];
        subTitileLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:subTitileLabel];
        self.subTitleLabel = subTitileLabel;
        
        UILabel * ssTitileLabel = [[UILabel alloc]init];
        ssTitileLabel.textColor = [UIColor grayColor];
        ssTitileLabel.font = [UIFont systemFontOfSize:13];
        ssTitileLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:ssTitileLabel];
        self.ssTitleLabel = ssTitileLabel;
        
        self.titleLabel.textColor = [UIColor blackColor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.width = 44;
    self.imageView.height = self.imageView.width;
    self.imageView.y = (self.height - self.imageView.height)*0.5;
    self.imageView.x = (self.width - self.imageView.width) * 0.5;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.center = self.imageView.center;
    self.subTitleLabel.centerX = self.titleLabel.centerX;
    self.subTitleLabel.centerY = self.titleLabel.centerY + 20;
    self.ssTitleLabel.centerX = self.subTitleLabel.centerX;
    self.ssTitleLabel.centerY = self.subTitleLabel.centerY + 20;
    
//    self.imageView.y = 2;
//    self.imageView.width = 25;
//    self.imageView.height = 25;
//    self.imageView.x = (self.width - self.imageView.width) * 0.5;
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    
//    self.titleLabel.x = self.imageView.x - (self.titleLabel.width - self.imageView.width)/2.0;
//    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame) + 2;
//    self.titleLabel.font = [UIFont systemFontOfSize:10];
//    self.titleLabel.shadowColor = [UIColor clearColor];
//    
//    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - publicMethod

- (void)setSubTitle:(NSString *)title forState:(UIControlState)state
{
    self.subTitleLabel.text = title;
    [self.subTitleLabel sizeToFit];
}
- (void)setSubText:(NSString *)subText
{
    _subText = subText ;
    self.subTitleLabel.text = subText;
    [self.subTitleLabel sizeToFit];
}
- (void)setSstext:(NSString *)sstext
{
    _sstext = sstext;
    self.ssTitleLabel.text = sstext;
    [self.ssTitleLabel sizeToFit];
}
@end
