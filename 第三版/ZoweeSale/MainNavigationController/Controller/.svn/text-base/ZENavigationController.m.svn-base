//
//  ZENavigationController.m
//  ZoweeSale
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZENavigationController.h"
#import "UIBarButtonItem+Extension.h"
#import "SwipeBack.h"
#import "ZEMeViewController.h"
#import "searchViewController.h"


@interface ZENavigationController ()


@end
@implementation ZENavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIViewController * firstVc = [self.viewControllers firstObject];
    firstVc.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithImage:@"Top_Button_Nor" hilghtedImage:@"Top_Button_Highlight" target:self action:@selector(meBtnClick)];
    firstVc.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithImage:@"icon_Search_Big" hilghtedImage:@"icon_Search_Big_Highlight" target:self action:@selector(searchBtnClick)];
  
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 开启返回手势
    self.swipeBackEnabled = YES;

}


- (void)meBtnClick
{
    ZEMeViewController * meVC =[[ ZEMeViewController alloc]init];
    meVC.title = @"我";
    meVC.view.backgroundColor = [UIColor whiteColor];
   // ZENavigationController * meNavi = [[ZENavigationController alloc]initWithRootViewController:meVC];
    [self pushViewController:meVC animated:YES];
}
- (void)searchBtnClick {
    searchViewController *searchController = [[searchViewController alloc]init];
    searchController.navcontroller = self;
    [self presentViewController:searchController animated:YES completion:nil];
}
#pragma mark - 重写的系统方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    如果不是栈低控制器，则隐藏
    if (self.viewControllers.count > 0 )
    {
        //   设置将要推出vc的左右Item
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithBackGroundImage:@"backBtn"hilghtedBackGroundImage:@"backBtn" target:self action:@selector(back)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
- (BOOL)shouldAutorotate
{
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
}


-(void)back
{
    [self  popViewControllerAnimated:YES];
}


@end
