//
//  ZEGrabOrderViewController.m
//  ZoweeSale
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEGrabSegmentViewController.h"
#import "ZJScrollPageView.h"
#import "ZEGrabOrderViewController.h"
@interface ZEGrabSegmentViewController ()

@end

@implementation ZEGrabSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI{
    self.title = @"电商抢单";
    self.automaticallyAdjustsScrollViewInsets = NO;
    ZJSegmentStyle * style = [[ZJSegmentStyle alloc]init];
    style.showLine = YES;
    style.scrollTitle = NO;
    style.segmentHeight = 40;
    //颜色等
    style.normalTitleColor = hexColorString(@"999999");
    style.selectedTitleColor = hexColorString(@"fa5a5a");
    style.titleFont = [UIFont systemFontOfSize:15];
    style.scrollLineColor = hexColorString(@"fa5a5a");
    style.gradualChangeTitleColor = YES;
    
    //设置子控制器
    NSArray * childVCs = [NSArray arrayWithArray:[self setupChildVCs]];
    //初始化
    ZJScrollPageView * scrollPageView = [[ZJScrollPageView alloc]initWithFrame:CGRectMake(0, 64.0f, SCREEN_WIDTH, SCREEN_HEIGHT - 64.0f) segmentStyle:style childVcs:childVCs parentViewController:self];
    [self.view addSubview:scrollPageView];
    
    //中间的线
//    UIView * line = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 1)/2.0f, 4, 1, 32)];
//    line.backgroundColor = [UIColor lightGrayColor];
//    [scrollPageView addSubview:line];
}

- (NSArray *)setupChildVCs{
    ZEGrabOrderViewController * order1 = [[ZEGrabOrderViewController alloc]init];
    order1.title = @"全部订单";
    order1.type = @0;
    ZEGrabOrderViewController * order2 = [[ZEGrabOrderViewController alloc]init];
    order2.title = @"我的订单";
    order2.type = @1;
    NSArray * childVCs = [NSArray arrayWithObjects:order1,order2, nil];
    return childVCs;
}


@end
