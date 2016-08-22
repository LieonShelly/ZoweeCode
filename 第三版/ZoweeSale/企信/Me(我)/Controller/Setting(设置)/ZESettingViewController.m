//
//  ZESettingViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZESettingViewController.h"
#import "ZEAboutUsViewController.h"
#import "loginOrBindingViewController.h"
#import "userManager.h"
#import "ZEQXTool.h"
#import "CYLTabBarController.h"

@interface ZESettingViewController ()


@end

@implementation ZESettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSections];
}


- (void)addSections
{
    ZEItem * item1 = [[ZEArrowItem alloc]initWithIcon:@"Arrow" title:@"关于我们" destClass:[ZEAboutUsViewController class]];
 
    ZEItem * item2 = [[ZENoArrowItem alloc]initWithIcon:nil title:@"登录退出"];
    __weak typeof(self) weakSelf = self;
    
    item2.option = ^{
        [weakSelf siginOut];
    };
    ZESetGroup * g1 = [[ZESetGroup alloc]init];
    g1.items = @[item1];
    
    ZESetGroup * g2 = [[ZESetGroup alloc]init];
    g2.items = @[item2];
    [self.data addObject:g1];
    [self.data addObject:g2];
}

#pragma  mark - 私有方法
- (void)siginOut
{
    [MBProgressHUD showMessage:@"正在退出..." toView:self.navigationController.view];
    [[THNetWork sharedInstance]accessServerWithUIViewController:self WithAction:@"LogoutUser" WithParam:[NSDictionary dictionary] WithBlock:^(THNetWorkError *error, NSDictionary *dataDic) {
        
        [MBProgressHUD hideHUDForView:self.navigationController.view];
//        if (error) {
//            [MBProgressHUD showError:@"退出失败" toView:self.navigationController.view];
//        }else {
            [[userManager sharedInstance] userUnLogin];
            [ZEQXTool clearUserInfo];
//        }
        
    }];
    
}
@end
