//
//  chooseClientViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/19.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "chooseClientViewController.h"
#import "clientCollectionViewCell.h"
#import "ZEQXTool.h"
#import "ZECRMTableView.h"
#import "ZEIntentionViewController.h"
#import "ZEStatisticsModel.h"
#import "NSDate+string.h"
@interface chooseClientViewController ()

@end

@implementation chooseClientViewController
{
    ZECRMTableView * _CRMTbView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clientBtnClick:) name:@"clientBtnClick" object:nil];
    [[ZEQXTool sharedZEQXTool] loadUserInfoInController:self showFailure:^(THNetWorkError *error) {
        [MBProgressHUD showError:@"加载用户信息失败" toView:self.navigationController.view];
    }];
    
    [self requestData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)initialize {
    _CRMTbView = [[ZECRMTableView alloc]init];
    _CRMTbView.frame = self.view.bounds;
    [self.view addSubview:_CRMTbView];
    self.view.backgroundColor = hexColorString(@"f5f2f2");
}

- (void)clientBtnClick:(NSNotification *)notif{
    NSInteger tag = [notif.object integerValue];
    if (tag == 100) {
        
        ZEIntentionViewController *controller = [[ZEIntentionViewController alloc]init];
        controller.enableSider = YES;
        controller.rightbtnHideen = NO;
        controller.isNoContentShow = YES;
        controller.title = @"意向客户";
        [self.navigationController pushViewController:controller animated:YES];
    }else if(tag == 200){
        
        ZEIntentionViewController *controller = [[ZEIntentionViewController alloc]init];
        controller.title = @"订单客户";
        controller.interfaceStr = @"LoadOrderCustomerList";
        controller.rightbtnHideen = NO;
        controller.isNoContentShow = YES;
        controller.screenView.sortTypeArray = [NSMutableArray arrayWithArray:@[
                                                                               [[sortType alloc]initWithtype:@"按订单日期排序" num:customersSortOrderTime],
                                                                               [[sortType alloc]initWithtype:@"按客户名称排序" num:customersSortName]
                                                                               ]];
        [self.navigationController pushViewController:controller animated:YES];
    }else{
        
        ZEIntentionViewController *controller = [[ZEIntentionViewController alloc]init];
        controller.title = @"签约客户";
        controller.rightbtnHideen = NO;
        controller.interfaceStr = @"LoadContractCustomerList";
        controller.isNoContentShow = YES;
        controller.screenView.sortTypeArray = [NSMutableArray arrayWithArray:@[
                                                                               [[sortType alloc]initWithtype:@"按签单日期排序" num:customersSortAssignTime],
                                                                               [[sortType alloc]initWithtype:@"按交货日期排序" num:customersSortDeliveryTime],
                                                                               [[sortType alloc]initWithtype:@"按客户名称排序" num:customersSortName]
                                                                               ]];
        [self.navigationController pushViewController:controller animated:YES];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailsviewcontroller"]) {
        [[segue destinationViewController] setValue:sender forKey:@"detailTitle"];
    }
}

- (void)requestData{
    
    THBaseRequestApi * api1 = [[THBaseRequestApi alloc]initWithAction:@"ShopStatistics" Requestparameter:[NSDictionary dictionary]];
    [api1 startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        ZEStatisticsModel * model = [ZEStatisticsModel mj_objectWithKeyValues:request.responseJSONObject];
        _CRMTbView.shopModel = model;
        
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"error--%@",request.requestOperationError);
    }];
    
    THBaseRequestApi * api2 = [[THBaseRequestApi alloc]initWithAction:@"PersonalStatistics" Requestparameter:[NSDictionary dictionary]];
    [api2 startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        
        ZEStatisticsModel * model = [ZEStatisticsModel mj_objectWithKeyValues:request.responseJSONObject];
        _CRMTbView.personalModel = model;
        
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"error--%@",request.requestOperationError);
    }];
}



@end
