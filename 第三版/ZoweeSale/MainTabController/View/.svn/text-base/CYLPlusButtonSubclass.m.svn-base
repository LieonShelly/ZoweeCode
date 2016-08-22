//
//  CYLPlusButtonSubclass.m
//  DWCustomTabBarDemo
//
//  Created by 微博@iOS程序犭袁 (http://weibo.com/luohanchenyilong/) on 15/10/24.
//  Copyright (c) 2015年 https://github.com/ChenYilong . All rights reserved.
//

#import "CYLPlusButtonSubclass.h"
#import "HyPopMenuView.h"
#import "CYLTabBarController.h"
#import "MenuLabel.h"
#import "HZURLNavigation.h"
#import "NSDate+string.h"
#import "ZEweatherView.h"
#import "userManager.h"

#import "ZEOrderAppointmentViewController.h"
#import "ZEIntentionViewController.h"
#import "ZERemarkViewController.h"
#import "ZEDesignReviewViewController.h"
#import "ZEpriceReviewViewController.h"
#import "ZEcontractAwrdViewController.h"

#define Objs @[[MenuLabel CreatelabelIconName:@"登记客户" Title:@"登记客户"],\
[MenuLabel CreatelabelIconName:@"交付定金" Title:@"客户定单"],\
[MenuLabel CreatelabelIconName:@"量尺出图" Title:@"客户出图"],\
[MenuLabel CreatelabelIconName:@"图纸审核" Title:@"图纸审核"],\
[MenuLabel CreatelabelIconName:@"价格审核" Title:@"价格审核"],\
[MenuLabel CreatelabelIconName:@"合同签约" Title:@"合同签约"]\
]

@interface CYLPlusButtonSubclass () {
    CGFloat _buttonImageHeight;
}
@end
@implementation CYLPlusButtonSubclass

#pragma mark -
#pragma mark - Life Cycle

+(void)load {
    [super registerSubclass];
}

//+ (CGFloat)multiplerInCenterY{
//    return -0.5;
//}

#pragma mark -
#pragma mark - Life Cycle

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
//        self.adjustsImageWhenHighlighted = NO;
    }
    
    return self;
}



#pragma mark -
#pragma mark - Public Methods

/*
 *
 Create a custom UIButton without title and add it to the center of our tab bar
 *
 */
+ (instancetype)plusButton
{

   // UIImage *buttonImage = [UIImage imageNamed:@"tabbar_compose_button"];
    //UIImage *highlightImage = [UIImage imageNamed:@"tabbar_compose_button_highlighted"];
    UIImage *iconImage = [UIImage imageNamed:@"加号"];
    UIImage *highlightIconImage = [UIImage imageNamed:@"加号"];

    CYLPlusButtonSubclass *button = [CYLPlusButtonSubclass buttonWithType:UIButtonTypeCustom];
    
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, SCREEN_WIDTH/5, iconImage.size.height);
    [button setImage:iconImage forState:UIControlStateNormal];
    [button setImage:highlightIconImage forState:UIControlStateHighlighted];
   // [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    //[button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

#pragma mark -
#pragma mark - Event Response

- (void)clickPublish {
    [self tabBarDidSelectedRiseButton];
}


- (void)tabBarDidSelectedRiseButton {
    //自定义的头部视图
    UIView *topView = [self topViewInit];
    NSMutableDictionary *AudioDictionary = [NSMutableDictionary dictionary];
    //添加弹出菜单音效
    [AudioDictionary setObject:@"composer_open" forKey:kHyPopMenuViewOpenAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewOpenAudioTypeKey];
    //添加取消菜单音效
    [AudioDictionary setObject:@"composer_close" forKey:kHyPopMenuViewCloseAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewCloseAudioTypeKey];
    //添加选中按钮音效
    [AudioDictionary setObject:@"composer_select" forKey:kHyPopMenuViewSelectAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewSelectAudioTypeKey];
    [HyPopMenuView CreatingPopMenuObjectItmes:Objs TopView:topView /*nil*/OpenOrCloseAudioDictionary:AudioDictionary /*nil*/ SelectdCompletionBlock:^(MenuLabel *menuLabel, NSInteger index) {
        /**
         *  点击 按钮后执行代码
         */
        if (index == 0) {
            [userManagershare checkUserPermission:permissionRegisterCustomer WithBlock:^{
                [[HZURLNavigation currentNavigationViewController] pushViewController:[[UIStoryboard storyboardWithName:@"Add" bundle:nil] instantiateViewControllerWithIdentifier:@"registerUser"] animated:YES];
            }];

        }else if (index == 1){
            [userManagershare checkUserPermission:permissionCustomerOrder WithBlock:^{
                ZEOrderAppointmentViewController *controller = [[ZEOrderAppointmentViewController alloc]init];
                [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
            }];
        }else if (index == 2){//量尺出图
            [userManagershare checkUserPermission:permissionCustomerDesign WithBlock:^{
                ZEIntentionViewController *controller = [[ZEIntentionViewController alloc]init];
                controller.title = @"选择客户";
                controller.interfaceStr = @"FigureOutCustomerList";
                controller.screenView.sortTypeArray = [NSMutableArray arrayWithArray:@[
                                                                                       [[sortType alloc]initWithtype:@"按订单日期排序" num:customersSortOrderTime],
                                                                                       [[sortType alloc]initWithtype:@"按客户名称排序" num:customersSortName]
                                                                                       ]];
                controller.selection = ^(IntentionEntityClass *customer){
                    ZERemarkViewController *remarkController = [[ZERemarkViewController alloc]init];
                    remarkController.customer = customer;
                    [[HZURLNavigation currentNavigationViewController] pushViewController:remarkController animated:YES];
                };
                [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
            }];

        }else if (index == 3){//图纸审核
            [userManagershare checkUserPermission:permissionDesignExamine WithBlock:^{
                ZEIntentionViewController *controller = [[ZEIntentionViewController alloc]init];
                controller.title = @"选择客户";
                controller.interfaceStr = @"ProjectVerifyCustomerList";
                controller.screenView.sortTypeArray = [NSMutableArray arrayWithArray:@[
                                                                                       [[sortType alloc]initWithtype:@"按订单日期排序" num:customersSortOrderTime],
                                                                                       [[sortType alloc]initWithtype:@"按客户名称排序" num:customersSortName]
                                                                                       ]];
                controller.selection = ^(IntentionEntityClass *customer){
                    ZEDesignReviewViewController *remarkController = [[ZEDesignReviewViewController alloc]init];
                    remarkController.title = @"图纸审核";
                    remarkController.customer = customer;
                    [[HZURLNavigation currentNavigationViewController] pushViewController:remarkController animated:YES];
                };
                [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
            }];
        }else if (index == 4){//价格审核
            [userManagershare checkUserPermission:permissionPriceExamine WithBlock:^{
                ZEIntentionViewController *controller = [[ZEIntentionViewController alloc]init];
                controller.title = @"选择客户";
                controller.interfaceStr = @"PriceVerifyCustomerList";
                controller.screenView.sortTypeArray = [NSMutableArray arrayWithArray:@[
                                                                                       [[sortType alloc]initWithtype:@"按订单日期排序" num:customersSortOrderTime],
                                                                                       [[sortType alloc]initWithtype:@"按客户名称排序" num:customersSortName]
                                                                                       ]];
                controller.selection = ^(IntentionEntityClass *customer){
                    ZEpriceReviewViewController *remarkController = [[ZEpriceReviewViewController alloc]init];
                    remarkController.title = @"价格审核";
                    remarkController.customer = customer;
                    [[HZURLNavigation currentNavigationViewController] pushViewController:remarkController animated:YES];
                };
                [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
            }];
        }else if (index == 5){//合同签约
            [userManagershare checkUserPermission:permissionContractSign WithBlock:^{
                ZEIntentionViewController *controller = [[ZEIntentionViewController alloc]init];
                controller.title = @"选择客户";
                controller.interfaceStr = @"SignCustomerList";
                controller.screenView.sortTypeArray = [NSMutableArray arrayWithArray:@[
                                                                                       [[sortType alloc]initWithtype:@"按订单日期排序" num:customersSortOrderTime],
                                                                                       [[sortType alloc]initWithtype:@"按客户名称排序" num:customersSortName]
                                                                                       ]];
                controller.selection = ^(IntentionEntityClass *customer){
                    ZEcontractAwrdViewController *remarkController = [[ZEcontractAwrdViewController alloc]init];
                    remarkController.customer = customer;
                    [[HZURLNavigation currentNavigationViewController] pushViewController:remarkController animated:YES];
                };
                [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
            }];
        }
        else{
            [[HZURLNavigation currentViewController] showAlertWithMsg:@"功能即将开放..."];
        }
            
    }];
}
- (UIView *)topViewInit{
    NSString *weather = [[NSUserDefaults standardUserDefaults] objectForKey:weatherString];
    if (weather) {
        return [[ZEweatherView alloc]initWithWeather:weather];
    }else{
        CGFloat x,y,w,h;
        x = SCREEN_WIDTH/2 - 224/2;
        y = CGRectGetHeight([UIScreen mainScreen].bounds)/2 * 0.2f;
        w = 224;
        h = 184;
       UIImageView *topView = [[ImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        topView.image = [UIImage imageNamed:@"标语"];
        topView.contentMode = UIViewContentModeScaleAspectFit;
        return topView;
    }
    return nil;
}

@end
