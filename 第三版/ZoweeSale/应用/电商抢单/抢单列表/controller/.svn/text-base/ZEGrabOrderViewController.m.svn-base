//
//  ZEGrabOrderViewController.m
//  ZoweeSale
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEGrabOrderViewController.h"
#import "ZEGrabOrderTableView.h"
#import "MJRefresh.h"
#import "ZEGrabCustomerList.h"
@interface ZEGrabOrderViewController ()
@property(nonatomic,strong)ZEGrabOrderTableView * grabTbView;

@end

@implementation ZEGrabOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
   // [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI{
    self.view.backgroundColor = hexColorString(@"f5f2f2");
    _grabTbView = [[ZEGrabOrderTableView alloc]init];
    [self.view addSubview:_grabTbView];
    _grabTbView.sd_layout
    .topSpaceToView(self.view,5)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
    
    _grabTbView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    [_grabTbView.mj_header beginRefreshing];//立即刷新

}

- (void)loadData{
    __weak typeof(self) weakSelf = self;
    THBaseRequestApi * api = [[THBaseRequestApi alloc]initWithAction:@"GrabCustomerList" Requestparameter:@{@"Type":weakSelf.type}];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
       
        [weakSelf.grabTbView.mj_header endRefreshing];
        NSArray * customerList = [ZEGrabCustomerList mj_objectArrayWithKeyValuesArray:request.responseJSONObject];
        customerList = [customerList sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            ZEGrabCustomerList *grab = (ZEGrabCustomerList *)obj1;
            if ([grab.State isEqual:@0]) {
                return NSOrderedAscending;
            }
            grab = (ZEGrabCustomerList *)obj2;
            if ([grab.State isEqual:@0]) {
                return NSOrderedDescending;
            }
            return NSOrderedSame;
        }];
        weakSelf.grabTbView.sourceArray = customerList;
       
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.requestOperationError);
    }];
}

@end
