//
//  topCollectionReusableView.m
//  iPadMG
//
//  Created by wanglj on 15/11/20.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import "topCollectionReusableView.h"
@interface topCollectionReusableView ()


@property (nonatomic ,strong) TYAttributedLabel *Title;
@property (nonatomic ,strong) UILabel *label;
@end

@implementation topCollectionReusableView

+ (CGFloat)heightWithText:(NSString *)text {
    TYAttributedLabel *label = [[TYAttributedLabel alloc ]init];
    label.text = text;
    label.lineBreakMode = kCTLineBreakByTruncatingTail;
    label.font = [UIFont systemFontOfSize:20];
   return [label getHeightWithWidth:564]+20;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.Title = [[TYAttributedLabel alloc ]init];
        //self.backgroundColor = hexColorString(@"808080");
    }
    return self;
}

- (void)titleText:(NSString *)text withNum:(NSInteger)num
{
    [self.Title removeFromSuperview];
    [self.label removeFromSuperview];
    self.Title = [[TYAttributedLabel alloc ]init];
    self.Title.text = text;
    self.Title.lineBreakMode = kCTLineBreakByTruncatingTail;
    [self addSubview:self.Title];
    self.Title.font = [UIFont systemFontOfSize:20];
    self.Title.backgroundColor = [UIColor clearColor];
    self.Title.textColor = hexColorString(@"808080");
    WS(weakSelf);
    NSLog(@"%@",NSStringFromCGRect(weakSelf.frame));
    [self.Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.mas_offset(70);
        make.top.equalTo(weakSelf.mas_top).with.mas_equalTo(10);
        make.right.equalTo(weakSelf.mas_right).with.mas_offset(-70);
        make.height.mas_equalTo([weakSelf.Title getHeightWithWidth:(weakSelf.frame.size.width - 140)]);
    }];
    self.label = [[UILabel alloc]init];
    if (![text isEqualToString:@""]) {
        [self addSubview:self.label];
    }
    self.label.textAlignment = NSTextAlignmentRight;
    self.label.text = [NSString stringWithFormat:@"%ld",num + 1];
    self.label.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:30];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
        make.top.equalTo(weakSelf.mas_top).with.offset(3);
        make.right.equalTo(weakSelf.Title.mas_left).with.offset(-10);
    }];
}
@end
