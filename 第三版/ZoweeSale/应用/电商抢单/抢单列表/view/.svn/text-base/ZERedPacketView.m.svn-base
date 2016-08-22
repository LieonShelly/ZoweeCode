//
//  ZERedPacketView.m
//  ZoweeSale
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#define actualHeight 667.0 * SCREEN_HEIGHT
#define actualWidth 375.0 * SCREEN_WIDTH
#import "ZERedPacketView.h"
#import "UILable+TH.h"
@implementation ZERedPacketView
{
    UIButton * _iconBtn;
    UILabel * _nameLab;
    UIImageView * _addressImgView;
    UILabel * _addressLab;
    UIButton * _grabBtn;
}
- (instancetype)init{
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
//    UIImageView * bgView = [[UIImageView alloc]initWithFrame:self.bounds];
//    bgView.image = [UIImage imageNamed:@"bg_popup"];
//    [self addSubview:bgView];
    //通过CALayer的contents来设置背景图
    self.layer.contents = (__bridge id)([UIImage imageNamed:@"bg_popup"].CGImage);
    
    _iconBtn = [UIButton new];
    _iconBtn.userInteractionEnabled = NO;
    [self addSubview:_iconBtn];
    [_iconBtn setBackgroundImage:[UIImage imageNamed:@"icon_bg"] forState:UIControlStateNormal];
    [_iconBtn setTitleColor:hexColorString(@"fa7373") forState:UIControlStateNormal];
    _iconBtn.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    _iconBtn.sd_layout
    .topSpaceToView(self,41/actualHeight)
    .centerXEqualToView(self)
    .widthIs(60)
    .heightIs(60);
    
    _nameLab = [UILabel new];
    [_nameLab removeAllSubviews];
    [self addSubview:_nameLab];
    _nameLab.textAlignment = NSTextAlignmentCenter;
    _nameLab.font = [UIFont boldSystemFontOfSize:18];
    _nameLab.textColor = hexColorString(@"fafafa");
    _nameLab.sd_layout
    .topSpaceToView(_iconBtn,10)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(20);
    
    //为使地址图标和地址文字居中而使用的view
    UIView * bgView = [UIView new];
    [self addSubview:bgView];
    bgView.sd_layout
    .topSpaceToView(_nameLab,25/actualHeight)
    .centerXEqualToView(self);
    
    _addressLab = [UILabel new];
    [bgView addSubview:_addressLab];
    _addressLab.textColor = hexColorString(@"fafafa");
    _addressLab.textAlignment = NSTextAlignmentCenter;
    _addressLab.font = [UIFont systemFontOfSize:14];
    _addressLab.sd_layout
    .topSpaceToView(bgView,0)
    .widthIs([_addressLab labelSizeWidth])
    .centerXEqualToView(bgView)
    .autoHeightRatio(0);
    
    _addressImgView = [UIImageView new];
    [bgView addSubview:_addressImgView];
    _addressImgView.image = [UIImage imageNamed:@"icon_adress_white"];
    _addressImgView.sd_layout
    .topSpaceToView(bgView,4/actualHeight)
    .heightIs(12/actualHeight)
    .widthIs(12/actualWidth)
    .rightSpaceToView(_addressLab,5);
    
    _grabBtn = [UIButton new];
    [self addSubview:_grabBtn];
    [_grabBtn setImage:[UIImage imageNamed:@"抢"] forState:UIControlStateNormal];
    _grabBtn.adjustsImageWhenHighlighted = NO;
    [_grabBtn addTarget:self action:@selector(grabBtnOnClicked) forControlEvents:UIControlEventTouchUpInside];
    _grabBtn.sd_layout
    .bottomSpaceToView(self,18/actualHeight)
    .heightIs(98/actualHeight)
    .widthIs(98/actualWidth)
    .centerXEqualToView(self);
}

- (void)grabBtnOnClicked{
   
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"grabBtnClick"  object:nil];
}

//给控件属性赋值
- (void)setGrabModel:(ZEGrabCustomerList *)grabModel{
    _grabModel = grabModel;
    [_iconBtn setTitle:[_grabModel.CustomerName substringFromIndex:_grabModel.CustomerName.length - 1]forState:UIControlStateNormal];
    _nameLab.text = _grabModel.CustomerName;
    _addressLab.text = _grabModel.Address;
    _addressLab.sd_layout.widthIs([_addressLab labelSizeWidth]);
    if([_addressLab labelSizeWidth]>=142){
        //宽度大于142 换行
        _addressLab.sd_layout.widthIs(142);
    }
}
@end
