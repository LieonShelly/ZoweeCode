//
//  ZESettingViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZESettingViewController.h"
#import "ZESetting.h"
#import "ZEAboutUsViewController.h"

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
//    item1.option = ^{
////        ZEAboutUsViewController * usVc = [ZEAboutUsViewController new];
////        ZENavigationController * usNaivi = [[ZENavigationController alloc]initWithRootViewController:usVc];
////        
////        [self.navigationController pushViewController:usVc animated:YES];
//    };
    ZEItem * item2 = [[ZENoArrowItem alloc]initWithIcon:nil title:@"登录退出"];
    ZESetGroup * g1 = [[ZESetGroup alloc]init];
    g1.items = @[item1];
    
    ZESetGroup * g2 = [[ZESetGroup alloc]init];
    g2.items = @[item2];
    [self.data addObject:g1];
    [self.data addObject:g2];
}

@end
