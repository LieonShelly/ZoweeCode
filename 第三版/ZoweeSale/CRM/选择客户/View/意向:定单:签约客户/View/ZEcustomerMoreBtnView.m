//
//  ZEcustomerMoreBtnView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEcustomerMoreBtnView.h"
#import "UIButton+Extension.h"
#import "UILable+TH.h"
#import "HZURLNavigation.h"
#import "CrmCustomerInterface.h"

#import "ZEOrderAppointmentViewController.h"
#import "ZEIntentionViewController.h"


@interface itemBtn : UIView

- (instancetype)initWithImage:(NSString *)image title:(NSString *)title;

- (void)addTarget:(id)target action:(SEL)action;

- (void)setTitle:(NSString *)title image:(NSString *)image;

@end

@interface ZEcustomerMoreBtnView ()<UIAlertViewDelegate>

@end

@implementation ZEcustomerMoreBtnView{
    itemBtn *attBtn;
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
    self = [super initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    UIButton *backBtn = [UIButton new];
    backBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [self addSubview: backBtn];
    [backBtn addTarget:self action:@selector(backBtnClick)];
    backBtn.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    [self addSubview:view];
    view.sd_layout
    .centerXEqualToView(self)
    .centerYEqualToView(self)
    .widthIs(225)
    .heightIs(100);
    view.sd_cornerRadius = @5;
    
    itemBtn *item1 = [[itemBtn alloc]initWithImage:@"交付定金小" title:@"交付定金"];
    itemBtn *item2 = [[itemBtn alloc]initWithImage:@"客户流失" title:@"流失"];
    itemBtn *item3 = [[itemBtn alloc]initWithImage:@"已关注" title:@"已关注"];
    [item1 addTarget:self action:@selector(downPay)];
    [item2 addTarget:self action:@selector(customerLost)];
    [item3 addTarget:self action:@selector(AttentionCustomer)];
    [view addSubview:item1];
    [view addSubview:item2];
    [view addSubview:item3];
    item1.sd_layout
    .topSpaceToView(view,24)
    .leftSpaceToView(view,20)
    .widthIs(33);
    
    item2.sd_layout
    .topSpaceToView(view,24)
    .leftSpaceToView(item1,43)
    .widthIs(33);

    item3.sd_layout
    .topSpaceToView(view,24)
    .leftSpaceToView(item2,43)
    .widthIs(33);
    
    attBtn = item3;
}
- (void)setCustomer:(IntentionEntityClass *)customer{
    _customer = customer;
    if ([_customer.IsAttention isEqual:@0]) {
        [attBtn setTitle:@"未关注" image:@"未关注"];
    }else{
        [attBtn setTitle:@"已关注" image:@"已关注"];
    }
}

- (void)downPay{
    ZEOrderAppointmentViewController *controller = [[ZEOrderAppointmentViewController alloc]init];
    [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    [self backBtnClick];
}
- (void)customerLost{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"是否确定流失当前客户" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    
}
- (void)AttentionCustomer{
    [crmCustomerShare concernWithOrderID:_customer.CustomerID IsAttention:_customer.IsAttention Block:^(THNetWorkError *error) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
        }else{
//            if ([_customer.IsAttention isEqual:@0]) {
//                [attBtn setTitle:@"已关注" image:@"已关注"];
//                _customer.IsAttention = @1;
//            }else{
//                [attBtn setTitle:@"未关注" image:@"未关注"];
//                _customer.IsAttention = @0;
//            }
            [self backBtnClick];
            ZEIntentionViewController *controller = (ZEIntentionViewController *)[HZURLNavigation currentViewController];
            [controller RefreshView];
        }
    }];
}

- (void)backBtnClick{
    //self.hidden = YES;
    [self removeFromSuperview];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [crmCustomerShare LossCustomerWithOrderID:_customer.CustomerID Block:^(THNetWorkError *error) {
            if (error) {
                NSLog(@"%@",error.errorDescription);
            }else{
                ZEIntentionViewController *controller = (ZEIntentionViewController *)[HZURLNavigation currentViewController];
                [controller showToastWithMsg:@"客户流失成功"];
                [controller RefreshView];
                [self backBtnClick];
            }
        }];
    }
}
@end

@implementation itemBtn{
    NSString *_image;
    NSString *_title;
    
    UIImageView *imageView;
    UILabel *lab;
}

- (instancetype)initWithImage:(NSString *)image title:(NSString *)title{
    self = [super init];
    if (self) {
        _image = image;
        _title = title;
        [self setup];
    }
    return self;
}

- (void)setup{
    imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:_image]];
    [self addSubview:imageView];
    imageView.sd_layout
    .topEqualToView(self)
    .leftEqualToView(self)
    .rightEqualToView(self)
    .autoHeightRatio(1);
    
    lab = [UILabel new];
    lab.textColor = hexColorString(@"2e2e2e");
    lab.text = _title;
    lab.font = [UIFont systemFontOfSize:12];
    [self addSubview:lab];
    lab.sd_layout
    .topSpaceToView(imageView,11)
    .centerXEqualToView(self)
    .widthIs([lab labelSizeWidth])
    .heightIs(lab.font.lineHeight);
    
    [self setupAutoHeightWithBottomView:lab bottomMargin:0];
}

- (void)addTarget:(id)target action:(SEL)action{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
}

- (void)setTitle:(NSString *)title image:(NSString *)image{
    imageView.image = [UIImage imageNamed:image];
    lab.text = title;
}

@end
