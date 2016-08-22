
//
//  ZEAccountDetailViewController.m
//  ZoweeSale
//
//  Created by apple on 16/6/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAccountDetailViewController.h"
#import "ZEAccountLabel.h"
#import "ZEAccountDetailTableView.h"
#import "ZESingleDetail.h"
@interface ZEAccountDetailViewController ()
@property(nonatomic,strong)ZEAccountDetailTableView * tbView;
@end

@implementation ZEAccountDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI{
    self.title = @"充扣明细";
    self.view.backgroundColor = hexColorString(@"f5f2f2");
    _tbView = [[ZEAccountDetailTableView alloc]init];
    _tbView.frame = self.view.bounds;
    [self.view addSubview:_tbView];
    
}

- (void)loadData{
    __weak typeof(self) weakSelf = self;
    THBaseRequestApi * api = [[THBaseRequestApi alloc]initWithAction:@"GetDetailed" Requestparameter:@{@"Contractselfno":weakSelf.detailed.ContractSelfNo}];
    
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSLog(@"--api %@",request.responseJSONObject);
        ZESingleDetail *singleDetail = [ZESingleDetail mj_objectWithKeyValues:request.responseJSONObject];
        NSLog(@"%@",singleDetail.Amount);
        _tbView.singleDetail = singleDetail;
       
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.requestOperationError);
    }];
}



@end
