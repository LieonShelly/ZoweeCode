    //
//  ZERankListViewController.m
//  ZoweeSale
//
//  Created by apple on 16/6/27.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERankListViewController.h"

#import "ZERankListTableView.h"
#import "UIButton+Extension.h"
#import "NSDate+string.h"
#import "ZERankingList.h"
#import "ZERankDateView.h"
@interface ZERankListViewController ()
{
    ZERankListTableView * _tbView;
    UIView * _dateView;
    NSNumber * _type;//类型   1：签单额  2：回款额
    NSString * _searchTime;//请求参数   时间 如：2015-09-17 15:59:05
    UIView * _bgView;
    UIButton * _dateBtn;
}
@end

@implementation ZERankListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    //初始默认请求以当前时间和签单额为参数的数据
    _searchTime = [NSDate dateStringFormateWithToday];
    _type = @1;
    [self loadDataWithTime:_searchTime Type:_type];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Changedate:) name:@"rankListDateChange" object:nil];
}

- (void)Changedate:(NSNotification*)note
{
    _searchTime = [NSString stringWithFormat:@"%@-%@-1 12:12:00",note.userInfo[@"year"],note.userInfo[@"month"]];
    NSLog(@"%@,%f",_searchTime,[_type floatValue]);
    [self loadDataWithTime:_searchTime Type:_type];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)setupUI{
    self.title = @"排行榜";
    self.view.backgroundColor = [UIColor whiteColor];
    ZERankDateView * dateView = [[ZERankDateView alloc]init];
    [self.view addSubview:dateView];
    dateView.sd_layout
    .topSpaceToView(self.view,64)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(36);
    
    _dateBtn = [UIButton new];
    [dateView addSubview:_dateBtn];
    _dateBtn.titleColor = hexColorString(@"2e2e2e");
    [_dateBtn setImage:[UIImage imageNamed:@"littleArrow"] forState:UIControlStateNormal];
    _dateBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    _dateBtn.title = @"签单额";
    _dateBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -14, 0, 0);
    _dateBtn.imageEdgeInsets = UIEdgeInsetsMake(0, _dateBtn.titleSizeWidth + 14, 0, 0);
    [_dateBtn addTarget:self action:@selector(pickType)];
    _dateBtn.sd_layout
    .topEqualToView(dateView)
    .centerXEqualToView(dateView)
    .widthIs(_dateBtn.titleSizeWidth + 30)
    .bottomEqualToView(dateView);
    
    _tbView = [[ZERankListTableView alloc]init];
    [self.view addSubview:_tbView];
    _tbView.sd_layout
    .topSpaceToView(dateView,0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
}

//选择排序类型
- (void)pickType{
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _bgView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0];
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closePickType)];
    [_bgView addGestureRecognizer:tapGes];
    [[UIApplication sharedApplication].keyWindow addSubview:_bgView];
    
    _dateView= [UIView new];
    _dateView.backgroundColor = hexColorString(@"666666");
    _dateView.frame = CGRectMake((SCREEN_WIDTH - 80)/2, 100, 80, 50);
    [_bgView addSubview:_dateView];
    
    UIButton * dealBtn = [UIButton new];
    UIButton * payBackBtn = [UIButton new];
    dealBtn.tag = 100;
    payBackBtn.tag = 200;
    [_dateView addSubview:dealBtn];
    [_dateView addSubview:payBackBtn];
    
    dealBtn.titleColor = hexColorString(@"999999");
    dealBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    payBackBtn.titleColor = hexColorString(@"999999");
    payBackBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    
    dealBtn.title = @"签单额";
    payBackBtn.title = @"回款额";
    
    dealBtn.sd_layout
    .topEqualToView(_dateView)
    .rightEqualToView(_dateView)
    .leftEqualToView(_dateView)
    .heightRatioToView(_dateView,0.5);
    payBackBtn.sd_layout
    .topSpaceToView(dealBtn,0)
    .rightEqualToView(_dateView)
    .leftEqualToView(_dateView)
    .heightRatioToView(_dateView,0.5);
    [dealBtn addTarget:self action:@selector(typePicked:)];
    [payBackBtn addTarget:self action:@selector(typePicked:)];
}

- (void)typePicked:(UIButton*)sender{
    _dateBtn.title = sender.title;
    [_bgView removeFromSuperview];
    if (sender.tag == 100) {
        _type = @1;
        
        [self loadDataWithTime:_searchTime Type:_type];
    }else{
        _type = @2;
        [self loadDataWithTime:_searchTime Type:_type];
    }
}

- (void)loadDataWithTime:(NSString *)time Type:(NSNumber *)type{
    THBaseRequestApi * api = [[THBaseRequestApi alloc]initWithAction:@"LoadPerformanceRanking" Requestparameter:@{@"SearchTime":time,@"Type":type}];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.responseJSONObject);
        NSArray * dataArray = [ZERankingList mj_objectArrayWithKeyValuesArray:request.responseJSONObject];
        _tbView.dataArray = dataArray;
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.requestOperationError);
    }];

}

- (void)closePickType{
    [_bgView removeFromSuperview];
}
@end
