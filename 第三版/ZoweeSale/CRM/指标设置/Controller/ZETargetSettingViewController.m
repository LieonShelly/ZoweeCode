//
//  ZETargetSettingViewController.m
//  ZoweeSale
//
//  Created by apple on 16/6/27.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZETargetSettingViewController.h"
#import "ZEYearTargetView.h"
#import "UIBarButtonItem+Extension.h"
#import "UIButton+Extension.h"
#import "ZEYearTargetTableView.h"
#import "ZEYearTarget.h"
#import "UIViewController+showMsg.h"
#import "NSDate+string.h"
#import "chooseClientViewController.h"
@interface ZETargetSettingViewController ()
{
    ZEYearTargetTableView * _tbView;
    ZEYearTargetView * _targetView;
    UIButton * _saveBtn;
    NSNumber * _year;//用于保存上传数据时的year参数
}
@end

@implementation ZETargetSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * date = [NSDate stringtodayYandMandD];
    NSArray * dateArr = [date componentsSeparatedByString:@"-"];
    _year = dateArr[0];
    [self loadDataWithYear:dateArr[0]];
    [self setupUI];
    
    //用户选择日期后的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(dateChange:) name:@"dateChange" object:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)dateChange:(NSNotification*)notif{
    [self loadDataWithYear:[NSNumber numberWithFloat:[notif.object floatValue]]];
    _year = [NSNumber numberWithFloat:[notif.object floatValue]];
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"年度指标";
    
    _saveBtn = [UIButton new];
    [_saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [_saveBtn setTitleColor:[UIColor colorWithHexString:@"2e2e2e"] forState:UIControlStateNormal];
    [_saveBtn addTarget:self action:@selector(saveBtnClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithBtn:_saveBtn];
    
    _targetView = [[ZEYearTargetView alloc]init];
    _targetView.Type = self.Type;
    [self.view addSubview:_targetView];
    _targetView.sd_layout
    .topSpaceToView(self.view,64)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(36);
    
    _tbView = [[ZEYearTargetTableView alloc]init];
    [self.view addSubview:_tbView];
    _tbView.sd_layout
    .topSpaceToView(_targetView,0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
}

#pragma mark - 请求数据
- (void)loadDataWithYear:(NSNumber *)year{
    
    THBaseRequestApi * api = [[THBaseRequestApi alloc]initWithAction:@"LoadYearTarGet" Requestparameter:@{@"Year":year,@"Type":_Type}];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.responseJSONObject);
        ZEYearTarget * model = [ZEYearTarget mj_objectWithKeyValues:request.responseJSONObject];
        _tbView.model = model;
        
        //给topView的总金额赋值
        double result = [model.M1 doubleValue] + [model.M2 doubleValue] + [model.M3 doubleValue] + [model.M4 doubleValue] + [model.M5 doubleValue] + [model.M6 doubleValue] + [model.M7 doubleValue] + [model.M8 doubleValue] + [model.M9 doubleValue] + [model.M10 doubleValue] + [model.M11 doubleValue] + [model.M12 doubleValue];
        _targetView.totalAmount = [NSNumber numberWithDouble:result];
        [_targetView layoutSubviews];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.requestOperationError);
    }];
}

- (void)saveBtnClick{
    
    double totalAmout = 0;//更改后的总金额
    for (NSString * res in _tbView.dataArray) {
        double result = [res doubleValue];
        totalAmout += result;
    }
    
#pragma mark - 上传数据
    THBaseRequestApi * api = [[THBaseRequestApi alloc]initWithAction:@"PersonalSet" Requestparameter:@{@"M1":_tbView.dataArray[0],@"M2":_tbView.dataArray[1],@"M3":_tbView.dataArray[2],@"M4":_tbView.dataArray[3],@"M5":_tbView.dataArray[4],@"M6":_tbView.dataArray[5],@"M7":_tbView.dataArray[6],@"M8":_tbView.dataArray[7],@"M9":_tbView.dataArray[8],@"M10":_tbView.dataArray[9],@"M11":_tbView.dataArray[10],@"M12":_tbView.dataArray[11],@"Type":self.Type,@"Year":_year,@"sumMoney":[NSNumber numberWithDouble:totalAmout]}];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.requestOperationError);
    }];
}

@end
