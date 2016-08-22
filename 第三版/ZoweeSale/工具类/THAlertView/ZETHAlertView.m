//
//  ZETHAlertView.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/30.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZETHAlertView.h"
#import "ZETHAlertViewController.h"


#import "ZEFollowFinishTaskViewController.h"
#import "ZEOrderAppointmentViewController.h"
#import "ZERemarkViewController.h"
#import "ZEpriceReviewViewController.h"
#import "ZEDesignReviewViewController.h"
#import "ZEcontractAwrdViewController.h"
#import "customerDetailViewController.h"
#import "HZURLNavigation.h"

typedef NS_ENUM(NSUInteger, optionCode) {
    optionCodeFollow = 1,//跟进
    optionCodeOrder,//定单
    optionCodeDesiger,//出图
    optionCodeDesigerExamine,//图审
    optionCodePriceExamine,//价审
    optionCodeSignPage,//签约
    optionCodeBack,//关闭
    optionCodeMeasure//派尺
};

static void  currentNavigationViewControllerOfViewControllersSet(){
    NSMutableArray * array =[[NSMutableArray alloc]initWithArray:[HZURLNavigation currentNavigationViewController].viewControllers];
    if (array.count <= 2) {
        return;
    }
    [array removeObjectsInRange:NSMakeRange(1, array.count-2) ];
    [HZURLNavigation currentNavigationViewController].viewControllers = array;
    
}


@interface optionBtn : UIButton

- (instancetype)initWithOptionCode:(optionCode)Code customerID:(NSNumber *)customerID customerName:(NSString *)customerName;

+ (NSArray *)btnArrayWith:(NSString *)optionCode customerID:(NSNumber *)customerID customerName:(NSString *)customerName;



@end

@implementation optionBtn{
    optionCode _Code;
    NSNumber *_customerID;
    NSString *_customerName;
}


+ (NSArray *)btnArrayWith:(NSString *)option customerID:(NSNumber *)customerID customerName:(NSString *)customerName{
    NSArray *codes = [option componentsSeparatedByString:@","];
    NSMutableArray *btnArray = [NSMutableArray array];
    for (NSString *code in codes) {
        optionCode Code = [code integerValue];
        UIButton *btn = [[self alloc]initWithOptionCode:Code customerID:customerID customerName:customerName];
        [btnArray addObject:btn];
    }
    return btnArray;
}
- (instancetype)initWithOptionCode:(optionCode)Code customerID:(NSNumber *)customerID customerName:(NSString *)customerName{
    self = [super init];
    if (self) {
        [self setupWith:Code];
        _Code =Code;
        _customerID = customerID;
        _customerName = customerName;
    }
    return self;
}
- (void)setupWith:(optionCode)Code{
    self.layer.cornerRadius = 50*AdaptationRatioW/2;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 2;
    self.layer.borderColor = [hexColorString(@"fa5a5a")CGColor];
    [self setTitleColor:hexColorString(@"fa5a5a") forState:UIControlStateNormal];
    [self addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    switch (Code) {
        case optionCodeFollow:
            [self setTitle:@"跟进" forState:UIControlStateNormal];
            break;
        case optionCodeOrder:
            [self setTitle:@"定单" forState:UIControlStateNormal];
            break;
        case optionCodeDesiger:
            [self setTitle:@"出图" forState:UIControlStateNormal];
            break;
        case optionCodeDesigerExamine:
            [self setTitle:@"图审" forState:UIControlStateNormal];
            break;
        case optionCodePriceExamine:
            [self setTitle:@"价审" forState:UIControlStateNormal];
            break;
        case optionCodeSignPage:
            [self setTitle:@"签约" forState:UIControlStateNormal];
            break;
        case optionCodeBack:
            [self setTitle:@"关闭" forState:UIControlStateNormal];
            break;
        case optionCodeMeasure:
            [self setTitle:@"派尺" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

- (void)BtnClick{
    ZETHAlertView *alertView =(ZETHAlertView*)[[self superview]superview];
    [alertView hideView];
    switch (_Code) {
        case optionCodeFollow:{
            ZEFollowFinishTaskViewController *controller = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateViewControllerWithIdentifier:@"followFinish"];
            controller.detail.CustomerID = _customerID;
            [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
            currentNavigationViewControllerOfViewControllersSet();
        }
            break;
        case optionCodeOrder:{
            [userManagershare checkUserPermission:permissionCustomerOrder WithBlock:^{
                ZEOrderAppointmentViewController * vc = [[ZEOrderAppointmentViewController alloc]init];
                vc.orderAppoint.customerName = _customerName;
                vc.orderAppoint.CustomerID = _customerID;
                [[HZURLNavigation currentNavigationViewController] pushViewController:vc animated:YES];
                currentNavigationViewControllerOfViewControllersSet();
  
            }];
        }
            break;
        case optionCodeDesiger:{
            [userManagershare checkUserPermission:permissionCustomerDesign WithBlock:^{
                ZERemarkViewController * VC = [[ ZERemarkViewController alloc] init];
                VC.customer.CustomerID = _customerID;
                [[HZURLNavigation currentNavigationViewController] pushViewController:VC animated:YES];
                currentNavigationViewControllerOfViewControllersSet();
            }];
        }
            break;
        case optionCodeDesigerExamine:{
            [userManagershare checkUserPermission:permissionDesignExamine WithBlock:^{
                ZEDesignReviewViewController * vc = [[ZEDesignReviewViewController alloc]init];
                vc.customer.CustomerID = _customerID;
                [[HZURLNavigation currentNavigationViewController] pushViewController:vc animated:YES];
                currentNavigationViewControllerOfViewControllersSet();
            }];
        }
            break;
        case optionCodePriceExamine:{
            [userManagershare checkUserPermission:permissionPriceExamine WithBlock:^{
                ZEpriceReviewViewController * vc = [[ZEpriceReviewViewController alloc]init];
                vc.customer.CustomerID = _customerID;
                [[HZURLNavigation currentNavigationViewController] pushViewController:vc animated:YES];
                currentNavigationViewControllerOfViewControllersSet();
            }];
        }
            break;
        case optionCodeSignPage:{
            [userManagershare checkUserPermission:permissionContractSign WithBlock:^{
                ZEcontractAwrdViewController *vc = [[ZEcontractAwrdViewController alloc]init];
                vc.customer.CustomerID = _customerID;
                [[HZURLNavigation currentNavigationViewController] pushViewController:vc animated:YES];
                currentNavigationViewControllerOfViewControllersSet();
            }];
        }
            break;
        case optionCodeBack:
            [[HZURLNavigation currentNavigationViewController] popToRootViewControllerAnimated:YES];
            break;
        case optionCodeMeasure:{
            [userManagershare checkUserPermission:permissionApplicationMeasureHelper WithBlock:^{
                UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Application" bundle:nil];
                UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"ZEAssignDetailViewController"];
                [HZURLNavigation pushViewController:vc animated:YES];
            }];
        }
            break;
        default:
            break;
    }
}
@end

@implementation ZETHAlertView{
    NSString *_title;
    NSArray *_btnArray;
    NSNumber *_customerID;
    NSString *_describe;
}



- (instancetype)initWithTitle:(NSString *)title customerID:(NSNumber *)customerID customerName:(NSString *)customerName OptionCode:(NSString *)optionCode {
    self = [self initWithTitle:title Describe:nil customerID:customerID customerName:customerName OptionCode:optionCode];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title Describe:(NSString *)describe customerID:(NSNumber *)customerID customerName:(NSString *)customerName OptionCode:(NSString *)optionCode{
    self = [super init];{
        _title = title;
        _btnArray = [optionBtn btnArrayWith:optionCode customerID:customerID customerName:customerName];
        _customerID = customerID;
        _describe = describe;
        [self setup];
    }
    return self;
}

- (void)setup{
    self.frame = CGRectMake(0, 0, 255*AdaptationRatioW, 320*AdaptationRatioH);
    UIView *backView = [UIView new];
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = 5*AdaptationRatioW;
    backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    UIImageView *topImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"弹出框背景"]];
    [backView addSubview:topImageView];
    [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top);
        make.left.equalTo(backView.mas_left);
        make.right.equalTo(backView.mas_right);
        make.height.mas_equalTo(130*AdaptationRatioH);
    }];
    UIImageView *finishImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"操作成功"]];
    [backView addSubview:finishImage];
    [finishImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backView).with.offset(30*AdaptationRatioW);
        make.centerY.equalTo(topImageView.mas_centerY);
        make.width.mas_equalTo(24*AdaptationRatioW);
        make.height.mas_equalTo(24*AdaptationRatioW);
    }];
    UILabel *titleLab = [UILabel new];
    titleLab.textColor = [UIColor whiteColor];
    titleLab.font = [UIFont systemFontOfSize:24*AdaptationRatioW];
    titleLab.text = _title;
    [backView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topImageView.mas_centerY);
        make.left.equalTo(finishImage.mas_right).with.offset(10);
        make.right.equalTo(backView.mas_right).with.offset(-10);
        make.height.mas_equalTo(24*AdaptationRatioW);
    }];
    
    if(_describe){
        UILabel * descLab = [UILabel new];
        descLab.text = _describe;
        descLab.textAlignment = NSTextAlignmentCenter;
        descLab.textColor = [UIColor whiteColor];
        descLab.font = [UIFont systemFontOfSize:16*AdaptationRatioW];
        [backView addSubview:descLab];
        descLab.sd_layout
        .centerYEqualToView(titleLab)
        .topSpaceToView(titleLab,15*AdaptationRatioW)
        .heightIs(24*AdaptationRatioW)
        .widthRatioToView(backView,1);
        
    }else{
        
    }
    
    UIButton *customerDetailBtn = [UIButton new];
    [customerDetailBtn setTitleColor:hexColorString(@"fa5a5a") forState:UIControlStateNormal];
    [customerDetailBtn setTitle:@"客户详情" forState:UIControlStateNormal];
    customerDetailBtn.titleLabel.font = [UIFont systemFontOfSize:15*AdaptationRatioW];
    [customerDetailBtn addTarget:self action:@selector(customerDetailBtnCkick) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:customerDetailBtn];
    [customerDetailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topImageView.mas_bottom).with.offset(35*AdaptationRatioH);
        make.left.equalTo(backView.mas_left);
        make.right.equalTo(backView.mas_right);
        make.height.mas_equalTo(15);
    }];
    
    if (_btnArray.count == 1) {
        UIButton *btn = _btnArray.firstObject;
        [backView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(backView.mas_centerX);
            make.bottom.equalTo(backView.mas_bottom).with.offset(-37*AdaptationRatioH);
            make.height.mas_equalTo(50*AdaptationRatioW);
            make.width.mas_equalTo(50*AdaptationRatioW);
        }];
    }else if (_btnArray.count == 2){
        UIButton *leftBtn = _btnArray.firstObject;
        [backView addSubview:leftBtn];
        [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(backView.mas_left).with.offset(40*AdaptationRatioW);
            make.bottom.equalTo(backView.mas_bottom).with.offset(-37*AdaptationRatioH);
            make.height.mas_equalTo(50*AdaptationRatioW);
            make.width.mas_equalTo(50*AdaptationRatioW);
        }];
        UIButton *rightBtn = _btnArray.lastObject;
        [backView addSubview:rightBtn];
        [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(backView.mas_right).with.offset(-40*AdaptationRatioW);
            make.bottom.equalTo(backView.mas_bottom).with.offset(-37*AdaptationRatioH);
            make.height.mas_equalTo(50*AdaptationRatioW);
            make.width.mas_equalTo(50*AdaptationRatioW);
        }];
        
    }
    UIButton *cancelBtn = [UIButton new];
    CGFloat width = 25*AdaptationRatioW;;
    [cancelBtn setImage:[UIImage imageNamed:@"关闭弹出框"] forState:UIControlStateNormal];
    [self addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top).with.offset(-width*0.5);
        make.left.equalTo(backView.mas_right).with.offset(-width*0.5);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(width);
    }];
    [cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)customerDetailBtnCkick{
    [self hideView];
    customerDetailViewController *controller = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateViewControllerWithIdentifier:@"customerDetail"];
    controller.ID = _customerID;
    [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
    currentNavigationViewControllerOfViewControllersSet();
}

- (void)cancelBtnClick{
    [self hideView];
    [[HZURLNavigation currentNavigationViewController] popToRootViewControllerAnimated:YES];
}

- (void)show{
    ZETHAlertViewController *controller = [[ZETHAlertViewController alloc] init];
    [self showInController:controller];
}
@end
