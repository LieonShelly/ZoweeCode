//
//  homeDesigeNavigationController.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "homeDesigeNavigationController.h"
#import "ZENavigationController.h"
#import "UIBarButtonItem+Extension.h"
#import "SwipeBack.h"
#import "ZEMeViewController.h"
#import "searchViewController.h"

@interface homeDesigeNavigationController ()

@end

@implementation homeDesigeNavigationController
- (BOOL)shouldAutorotate
{
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 开启返回手势
    self.swipeBackEnabled = YES;
    
}
//- (void)meBtnClick
//{
//    ZEMeViewController * meVC =[[ ZEMeViewController alloc]init];
//    meVC.title = @"我";
//    meVC.view.backgroundColor = [UIColor whiteColor];
//    // ZENavigationController * meNavi = [[ZENavigationController alloc]initWithRootViewController:meVC];
//    [self pushViewController:meVC animated:YES];
//}
//- (void)searchBtnClick {
//    searchViewController *searchController = [[searchViewController alloc]init];
//    searchController.navcontroller = self;
//    [self presentViewController:searchController animated:YES completion:nil];
//}
#pragma mark - 重写的系统方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    如果不是栈低控制器，则隐藏
    if (self.viewControllers.count > 0 )
    {
        //   设置将要推出vc的左右Item
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithBackGroundImage:@"icon_back"hilghtedBackGroundImage:@"icon_back" target:self action:@selector(back)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back
{
    [self  popViewControllerAnimated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
