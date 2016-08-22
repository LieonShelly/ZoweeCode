//
//  ZEAnalyzeViewController.m
//  ZoweeSale
//
//  Created by apple on 16/7/1.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAnalyzeViewController.h"
#import "UIButton+Extension.h"

#import "YYKit.h"
#import "ZEAnalyzeTableView.h"
@interface ZEAnalyzeViewController ()
@property(nonatomic,strong)ZEAnalyzeTableView *analyzeTbView;
@end

@implementation ZEAnalyzeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"数据分析";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
}

- (void)setupUI{

    _analyzeTbView = [[ZEAnalyzeTableView alloc]init];
    [self.view addSubview:_analyzeTbView];
    _analyzeTbView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);

}

@end
