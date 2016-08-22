//
//  ZENoticeSegViewController.m
//  ZoweeSale
//
//  Created by lieon on 16/7/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZENoticeSegViewController.h"
#import "ZECompanyNoticeController.h"
#import "ZEStoreNoticeViewController.h"

@interface ZENoticeSegViewController ()

@end

@implementation ZENoticeSegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    NSArray *childVcs = [NSArray arrayWithArray:[self setupChildVcAndTitle]];
    // 初始化
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 64.0, self.view.bounds.size.width, self.view.bounds.size.height - 64.0) segmentStyle:style childVcs:childVcs parentViewController:self];
    
    [self.view addSubview:scrollPageView];
    
}

- (NSArray *)setupChildVcAndTitle{
    ZECompanyNoticeController *working = [[ZECompanyNoticeController alloc]init];
    working.title = @"工厂公告";
    working.type = @0;
    ZEStoreNoticeViewController *worked = [[ZEStoreNoticeViewController alloc]init];
    worked.title = @"门店公告";
    worked.type = @1;
    NSArray *childVcs = [NSArray arrayWithObjects:working, worked,  nil];
    return  childVcs;
}

@end
