//
//  ZEPopTopView.m
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPopTopView.h"

@interface ZEPopTopView ()

@property (nonatomic ,strong) UIButton * cancilBtn;
@property (nonatomic ,strong) UIButton * titleBtn;

@end
@implementation ZEPopTopView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = hexColorString(@"f4f2f5");
        [self addSubview:self.cancilBtn];
        [self addSubview:self.titleBtn];
        self.cancilBtn.sd_layout
        .leftSpaceToView(self,0)
        .bottomEqualToView(self)
        .topSpaceToView(self,0)
        .widthIs(44);
        [self.titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(60);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
    }
    return self;
}


- (void)cancilBtnClick
{
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}
- (UIButton *)cancilBtn
{
    if (_cancilBtn == nil) {
        _cancilBtn = [[UIButton alloc]init];
        [_cancilBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_cancilBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_cancilBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancilBtn addTarget:self action:@selector(cancilBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancilBtn;
}

- (UIButton *)titleBtn
{
    if (_titleBtn == nil) {
        _titleBtn =[[UIButton alloc]init];
       [_titleBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
        [_titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        _titleBtn.backgroundColor = lieonRandomColor;
    }
    return _titleBtn;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    [self.titleBtn setTitle:title forState:UIControlStateNormal];
}

@end
