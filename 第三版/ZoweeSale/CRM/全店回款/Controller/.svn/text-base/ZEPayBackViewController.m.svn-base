//
//  ZEPayBackViewController.m
//  ZoweeSale
//
//  Created by apple on 16/6/27.
//  Copyright © 2016年 TH. All rights reserved.
//
#import "AppDelegate.h"
#import "ZEPayBackViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "ZEPayBackModel.h"
#import "ZEPayBackView.h"
#import "ZEPickDateView.h"
#import "ZERankListViewController.h"
#import "NSDate+string.h"
@interface ZEPayBackViewController ()
{
    ZEPayBackView * _payView;
    NSString * _SearchTime;
}
@end

@implementation ZEPayBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    _SearchTime = [NSDate dateStringFormateWithToday];
    [self loadDataWithTime:_SearchTime];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTabbleView:) name:@"paybackDateChange" object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)refreshTabbleView:(NSNotification*)note
{
    _SearchTime = [NSString stringWithFormat:@"%@-%@-1 12:12:00",note.userInfo[@"year"],note.userInfo[@"month"]];
    
    [self loadDataWithTime:_SearchTime];
}

- (void)setupUI{
    self.view.backgroundColor = hexColorString(@"f5f2f2");
    if ([self.Type integerValue] == 1) {
        self.title = @"全店回款";
        self.navigationItem.rightBarButtonItem =
        [UIBarButtonItem ItemWithImage:@"icon_reward" hilghtedImage:@"icon_reward" target:self action:@selector(checkRanking)];
    }else{
        self.title = @"个人回款";
    }
    
    ZEPickDateView * dateView = [[ZEPickDateView alloc]init];
    
    [self.view addSubview:dateView];
    dateView.sd_layout
    .topSpaceToView(self.view,64)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(36);
    
    _payView = [[ZEPayBackView alloc]init];
    [self.view addSubview:_payView];
    _payView.sd_layout
    .topSpaceToView(dateView,0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
}

- (void)checkRanking{
    if ([self.Type integerValue] == 1) {
        ZERankListViewController * rankVC = [[ZERankListViewController alloc]init];
        [self.navigationController pushViewController:rankVC animated:YES];
    }
}

- (void)loadDataWithTime:(NSString *)searchTime{
    
    THBaseRequestApi * api = [[THBaseRequestApi alloc]initWithAction:@"LoadStatistics" Requestparameter:@{@"SearchTime":searchTime,@"Type":self.Type}];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.responseJSONObject);
        
        ZEPayBackModel * model = [ZEPayBackModel mj_objectWithKeyValues:request.responseJSONObject];
        _payView.model = model;
        
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.requestOperationError);
    }];
}

@end
