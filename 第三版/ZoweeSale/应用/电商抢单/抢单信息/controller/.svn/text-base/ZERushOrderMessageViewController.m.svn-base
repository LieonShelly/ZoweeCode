//
//  ZERushOrderMessageViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERushOrderMessageViewController.h"

#import "ZEOrderMessageView.h"
#import "ZEBaiduMapView.h"
#import "ZEGrabCustomerResult.h"
#import "UIImage+YYAdd.h"

@interface ZERushOrderMessageViewController ()

@end

@implementation ZERushOrderMessageViewController{
    ZEOrderMessageView *_messageView;
    ZEBaiduMapView *_mapView;
    UIView *_orderStateView;
    UIButton *_rushBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"抢单";
    [self UISetInit];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadCustomerGrabResult];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)UISetInit{
    _messageView = [[ZEOrderMessageView alloc]init];
    _mapView = [[ZEBaiduMapView alloc]init];
    [self.view addSubview:_messageView];
    [self.view addSubview:_mapView];
    _orderStateView = [UIView new];
    [self.view addSubview:_orderStateView];
    _orderStateView.sd_layout
    .bottomEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(74);
    
    _rushBtn = [UIButton new];
    _rushBtn.enabled = NO;
    [_rushBtn setBackgroundImage:[UIImage imageWithColor:hexColorString(@"FA5A5A")] forState:UIControlStateNormal];
    _rushBtn.layer.masksToBounds = YES;
    _rushBtn.layer.cornerRadius = 5;
    [_orderStateView addSubview:_rushBtn];
    _rushBtn.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(15, 20, 15, 20));
    
    UILabel *line = [UILabel new];
    line.backgroundColor = [hexColorString(@"666666") colorWithAlphaComponent:0.4];
    [_orderStateView addSubview:line];
    line.sd_layout
    .topEqualToView(_orderStateView)
    .leftEqualToView(_orderStateView)
    .rightEqualToView(_orderStateView)
    .heightIs(0.5);
    
    _messageView.sd_layout
    .topSpaceToView(self.view,64)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view);
    _mapView.sd_layout
    .topSpaceToView(_messageView,0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomSpaceToView(_orderStateView,0);
}

- (void)loadCustomerGrabResult{
    THBaseRequestApi *grabApi = [[THBaseRequestApi alloc]initWithAction:@"LoadGrabCustomer" Requestparameter:@{@"CustomerID":_customerID,} ModelClassName:@"ZEGrabCustomerResult"];
    [grabApi addAccessory:grabApi];
    [grabApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        ZEGrabCustomerResult *respone = [request responseJSONObject];
        _messageView.result = respone;
        _mapView.result = respone;
        [self UISet:respone];
        [self showToastWithMsg:respone.Address];
    } failure:^(__kindof YTKBaseRequest *request) {
        
    }];
}

- (void) UISet:(ZEGrabCustomerResult *)result{
    [_rushBtn setTitle:result.strTS forState:UIControlStateNormal];
    _rushBtn.enabled = NO;
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
