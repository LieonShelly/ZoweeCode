//
//  ZEBaseMarkViewController.m
//  ZoweeSale
//
//  Created by lieon on 16/7/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEBaseMarkViewController.h"
#import "ZERemindView.h"
@interface ZEBaseMarkViewController ()
@property (nonatomic ,strong) ZERemindView * remindView;

@end

@implementation ZEBaseMarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)setUpBaseView
{
    self.view = self.remindView;
}

#pragma mark - 懒加载 


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
