//
//  ZEOrderMessageView.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEOrderMessageView.h"
#import "UILable+TH.h"
#import "UIButton+Extension.h"
#import "THloginMessage.h"
#import "customerDetailViewController.h"
#import "HZURLNavigation.h"
#import "UIImage+YYAdd.h"
#import "Masonry.h"
@implementation ZEOrderMessageView{
    UIImageView *_iconView;
    UILabel *_nameLab;
    UILabel *_addressLab;
    UIImageView *_addressIcon;
    UIButton *_detailInfoBtn;
    UIButton *_sendMessageBtn;
    UIButton *_callPhoneBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
        self.backgroundColor = hexColorString(@"ffffff");
        self.hidden = YES;
    }
    return self;
}

- (void)setup{
    _iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_qiang"]];
    [self addSubview:_iconView];
    _iconView.sd_layout
    .topSpaceToView(self,20)
    .centerXEqualToView(self)
    .widthIs(30)
    .heightIs(30);
    
    _nameLab = [UILabel new];
    _nameLab.font = [UIFont boldSystemFontOfSize:16];
    _nameLab.text = @"";
    _nameLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_nameLab];
    _nameLab.sd_layout
    .topSpaceToView(_iconView,15)
    .centerXEqualToView(_iconView)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(17);
    
    _addressLab = [UILabel new];
    _addressLab.font = [UIFont systemFontOfSize:14];
    _addressLab.textColor = hexColorString(@"808080");
    _addressLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_addressLab];
    _addressLab.text = @"";
    _addressLab.sd_layout
    .topSpaceToView(_nameLab,10)
    .centerXEqualToView(_nameLab)
    .heightIs(15)
    .widthIs([_addressLab labelSizeWidth]);
    _addressIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_adress_gray"]];
    [self addSubview:_addressIcon];
    _addressIcon.sd_layout
    .rightSpaceToView(_addressLab,0)
    .centerYEqualToView(_addressLab)
    .widthIs(15)
    .heightIs(15);
    
    _detailInfoBtn = [UIButton new];
    _sendMessageBtn = [UIButton new];
    _callPhoneBtn = [UIButton new];
    
    [self addSubview:_detailInfoBtn];
    [self addSubview:_sendMessageBtn];
    [self addSubview:_callPhoneBtn];
    
    NSInteger spline = -10;
    NSInteger font = 15;
    if ([[THloginMessage sharedInstance].DeviceCode hasPrefix:@"iPhone 5"]) {
        spline = -5;
        font = 13;
    }
    [_detailInfoBtn setBackgroundImage:[UIImage imageWithColor:hexColorString(@"FA5A5A")] forState:UIControlStateNormal];
    _detailInfoBtn.layer.masksToBounds = YES;
    _detailInfoBtn.layer.cornerRadius = 5;
    _detailInfoBtn.title = @"查看详情";
    [_detailInfoBtn addTarget:self action:@selector(detailBtnClick)];
    _detailInfoBtn.titleLabel.font = [UIFont systemFontOfSize:font];
    _detailInfoBtn.imageEdgeInsets = UIEdgeInsetsMake(0, spline, 0, 0);
    _detailInfoBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spline);
    _detailInfoBtn.image = @"icon_details_enabled";
    _detailInfoBtn.disEnableImage = @"icon_details_disabled";
    
    [_sendMessageBtn setBackgroundImage:[UIImage imageWithColor:hexColorString(@"FA5A5A")] forState:UIControlStateNormal];
    _sendMessageBtn.title = @"发短信";
    _sendMessageBtn.layer.masksToBounds = YES;
    _sendMessageBtn.layer.cornerRadius = 5;
    [_sendMessageBtn addTarget:self action:@selector(sendMessageBtnClick)];
    _sendMessageBtn.imageEdgeInsets = UIEdgeInsetsMake(0, spline, 0, 0);
    _sendMessageBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spline);
    _sendMessageBtn.titleLabel.font = [UIFont systemFontOfSize:font];
    _sendMessageBtn.image = @"icon_msg_enabled";
    _sendMessageBtn.disEnableImage = @"icon_msg_disabled";
    
    [_callPhoneBtn setBackgroundImage:[UIImage imageWithColor:hexColorString(@"FA5A5A")] forState:UIControlStateNormal];    _callPhoneBtn.title = @"打电话";
    _callPhoneBtn.layer.masksToBounds = YES;
    _callPhoneBtn.layer.cornerRadius = 5;
    [_callPhoneBtn addTarget:self action:@selector(callBtnClick)];
    _callPhoneBtn.imageEdgeInsets = UIEdgeInsetsMake(0, spline, 0, 0);
    _callPhoneBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spline);
    _callPhoneBtn.titleLabel.font = [UIFont systemFontOfSize:font];
    _callPhoneBtn.image = @"icon_tel_enabled";
    _callPhoneBtn.disEnableImage = @"icon_tel_disabled";
    
    [_detailInfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_addressLab.mas_bottom).with.offset(18);
        make.left.equalTo(self.mas_left).with.offset(10);
        make.height.mas_equalTo(33);
        make.width.equalTo(_sendMessageBtn.mas_width);
    }];
    [_sendMessageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_detailInfoBtn.mas_top);
        make.left.equalTo(_detailInfoBtn.mas_right).with.offset(30);
        make.width.equalTo(_callPhoneBtn.mas_width);
        make.height.equalTo(_detailInfoBtn.mas_height);
    }];
    [_callPhoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_detailInfoBtn.mas_top);
        make.left.equalTo(_sendMessageBtn.mas_right).with.offset(30);
        //make.width.equalTo(btn4.mas_width);
        make.height.equalTo(_detailInfoBtn.mas_height);
        make.right.equalTo(self.mas_right).with.offset(spline);
       // make.bottom.equalTo(contentView.mas_bottom).with.offset(spline);
    }];
    UILabel *line = [UILabel new];
    line.backgroundColor = [hexColorString(@"666666") colorWithAlphaComponent:0.4];
    [self addSubview:line];
    line.sd_layout
    .bottomEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .heightIs(0.5);
    
    [self setupAutoHeightWithBottomView:_callPhoneBtn bottomMargin:20];
}

- (void)setResult:(ZEGrabCustomerResult *)result{
    if (!result) {
        return;
    }
    if (![result isKindOfClass:[ZEGrabCustomerResult class]]) {
        result = [ZEGrabCustomerResult mj_objectWithKeyValues:result];
        if (!result) {
            return;
        }
    }
    _result = result;
    [self setUI];
    self.hidden = NO;
}

- (void)setUI{
    _detailInfoBtn.enabled = _result.State;
    _sendMessageBtn.enabled = _result.State;
    _callPhoneBtn.enabled = _result.State;
    _nameLab.text = _result.CustomerName;
    _addressLab.text = _result.Address;
    _addressLab.sd_layout.widthIs([_addressLab labelSizeWidth]);
}

- (void)detailBtnClick{
    customerDetailViewController * detailVC = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateViewControllerWithIdentifier:@"customerDetail"];
    detailVC.ID = [NSNumber numberWithInt:[_result.CustomerID intValue]];
    [[HZURLNavigation currentNavigationViewController] pushViewController:detailVC animated:YES];
}
- (void)sendMessageBtnClick{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",_result.Mobile]]];//发短信
}
- (void)callBtnClick{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",_result.Mobile];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.viewController.view addSubview:callWebview];

}

@end
