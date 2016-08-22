//
//  ZESegmentViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/6.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZESegmentViewController.h"
#import "ZEWorkIndexViewController.h"

@interface ZESegmentViewController ()

@end

@implementation ZESegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"工作";
    
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    //显示滚动条
    style.showLine = YES;
    style.scrollTitle = NO;
    style.segmentHeight = 40;
    style.normalTitleColor = hexColorString(@"999999");
    style.selectedTitleColor = hexColorString(@"fa5a5a");
    style.scrollLineColor = hexColorString(@"fa5a5a");
    style.titleFont = [UIFont systemFontOfSize:15];
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    
    // 设置子控制器 --- 注意子控制器需要设置title, 将用于对应的tag显示title
    NSArray *childVcs = [NSArray arrayWithArray:[self setupChildVcAndTitle]];
    // 初始化
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, self.view.bounds.size.width, self.view.bounds.size.height - 64.0) segmentStyle:style childVcs:childVcs parentViewController:self];
    
    [self.view addSubview:scrollPageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)setupChildVcAndTitle{
    ZEWorkIndexViewController *working = [[ZEWorkIndexViewController alloc]init];
    working.title = @"未完成";
    working.type = @0;
    ZEWorkIndexViewController *worked = [[ZEWorkIndexViewController alloc]init];
    worked.title = @"已完成";
    worked.type = @1;
    NSArray *childVcs = [NSArray arrayWithObjects:working, worked,  nil];
    return  childVcs;
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
