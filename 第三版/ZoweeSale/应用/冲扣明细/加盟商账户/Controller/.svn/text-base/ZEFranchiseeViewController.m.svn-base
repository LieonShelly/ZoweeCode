//
//  ZEFranchiseeViewController.m
//  ZoweeSale
//
//  Created by lieon on 16/6/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEFranchiseeViewController.h"
#import "ZEBillCollectionView.h"
#import "ZEShopViewController.h"
#import "ZEContractBillView.h"
#import "ZEAnimator.h"
#import "ZEAccountDetailViewController.h"
#import "ZEMonthMoney.h"
#import "ZEAccountBalance.h"
#import "ZEJoinShop.h"
#import "ZEDetailed.h"

@interface ZEFranchiseeViewController ()<ZEContractBillViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *remainLabel;
@property (weak, nonatomic) IBOutlet UILabel *allowOverdraftLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIView *locationView;

@property (weak, nonatomic) IBOutlet UIView *biiView;

@property (weak, nonatomic) IBOutlet UIView *contractView;

@property (nonatomic ,strong) ZEMonthMoney * monthMoney;

@property (nonatomic ,strong) ZEJoinShop * shop;

@property (nonatomic ,strong) ZEShopViewController * shopVC;

@property (nonatomic,weak)  ZEContractBillView * contractBillView;

@property (nonatomic,weak)  ZEBillCollectionView * billCollectionView;

/**
 *  负责转场动画
 */
@property (nonatomic,strong) ZEAnimator * animator;


@end

@implementation ZEFranchiseeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.抓取数据
    [self loadData];
    
    // 2.初始化UI
    [self setupUI];
    
    // 3.注册通知
    [self addNotionfication];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.monthMoney && self.shop ) {
        [self loadDataForTableviewWithParam:@{@"Time":[self timeStrWithStr:self.monthMoney.strTime],@"ShopID":self.shop.JoinShopID}];
    }
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (IBAction)changeBtnClick:(id)sender
{
    [self presentViewController:self.shopVC animated:YES completion:nil];
}
#pragma mark - 私有方法

- (void)setupUI
{
    self.title = @"经销商账户";
   // 1.剩余金额
    self.remainLabel.textColor = hexColorString(@"2e2e2e");
    self.allowOverdraftLabel.textColor = self.remainLabel.textColor;
    // 2.门店
    self.locationView.backgroundColor = hexColorString(@"f5f2f2");
    self.locationLabel.textColor = self.allowOverdraftLabel.textColor;
    // 3. 账户金额
    self.biiView.backgroundColor = hexColorString(@"fa5a5a");
    ZEBillCollectionView * billCollectonView = [[ZEBillCollectionView alloc]init];
    billCollectonView.backgroundColor = [UIColor clearColor];
//    billCollectonView.backgroundColor = lieonRandomColor;
    self.billCollectionView = billCollectonView;
    [self.biiView addSubview:billCollectonView];
    billCollectonView.showsHorizontalScrollIndicator = NO;
    billCollectonView.sd_layout
    .topEqualToView(self.biiView)
    .bottomEqualToView(self.biiView)
    .leftEqualToView(self.biiView)
    .rightEqualToView(self.biiView);
    
    // 4.  合同
    ZEContractBillView * contractBillView = [[ZEContractBillView alloc]init];
    contractBillView.contractBillViewDelegate = self;
    self.contractBillView = contractBillView;
    [self.contractView addSubview:contractBillView];
    contractBillView.sd_layout
    .topEqualToView(self.contractView)
    .bottomEqualToView(self.contractView)
    .leftEqualToView(self.contractView)
    .rightEqualToView(self.contractView);
    
}

- (void)loadData
{
    [self loadDataForBalanceView];
    [self loadDataForCollectionView];
    [self loadDataForShopView];
}


- (void)addNotionfication
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(shopChanged:) name:@"shop" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshTabbleView:) name:@"monthChanged" object:nil];
}
- (void)updateBalanceViewWithModel:(ZEAccountBalance*)accountBalance
{
    self.remainLabel.text = [NSString stringWithFormat:@"当前余额:￥%.2f", [accountBalance.Blance floatValue]];
    self.allowOverdraftLabel.text = [NSString stringWithFormat:@"允许透支金额:￥%.2f", [accountBalance.OverDraftPrice floatValue]];
}

- (void)updateShopViewWithModel:(ZEJoinShop*)shop
{
    self.locationLabel.text = shop.JoinShopName;

}

- (void)updateAllUIWithShopModel:(ZEJoinShop*)shop
{
    self.locationLabel.text = shop.JoinShopName;

    [self loadDataForTableviewWithParam:@{@"Time":[self timeStrWithStr:self.monthMoney.strTime],@"ShopID":self.shop.JoinShopID}];
    
}

/**
 *
 加载MonthMoneyList
 */
- (void)loadDataForCollectionView
{
    __weak typeof(self) weakSelf = self;
    THBaseRequestApi * api2 = [[ THBaseRequestApi alloc]initWithAction:@"GetMonthMoneyList" Requestparameter:[NSDictionary dictionary]];
    [api2 startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSArray * monthMoneys = [ZEMonthMoney mj_objectArrayWithKeyValuesArray:request.responseJSONObject];
        monthMoneys =[[monthMoneys reverseObjectEnumerator] allObjects];
        weakSelf.monthMoney = monthMoneys.lastObject;
        weakSelf.billCollectionView.dataArray = monthMoneys;
        
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"error--%@",request.requestOperationError);
        
    }];
}

/**
 *  加载 GetDetailedList
 *
 */
- (void)loadDataForTableviewWithParam:(NSDictionary*)param
{
    __weak typeof(self) weakSelf = self;
    
    THBaseRequestApi * api3 = [[ THBaseRequestApi alloc]initWithAction:@"GetDetailedList" Requestparameter:param cacheTime:oneMinute];
    [api3 startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
       // NSLog(@"--api3 %@",request.responseJSONObject);
        NSArray *details = [ ZEDetailed mj_objectArrayWithKeyValuesArray:request.responseJSONObject];
        
        weakSelf.contractBillView.dataArray = details;
        
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"%@",request.requestOperationError);
    }];
}

/**
 *  加载 AccountBalance
 */
- (void)loadDataForBalanceView
{
    __weak typeof(self) weakSelf = self;
    THBaseRequestApi * api0 = [[ THBaseRequestApi alloc]initWithAction:@"AccountBalance" Requestparameter:[NSDictionary dictionary]];
    
    [api0 startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        
        ZEAccountBalance * accountBalance = [ZEAccountBalance mj_objectWithKeyValues:request.responseJSONObject];
        [weakSelf updateBalanceViewWithModel:accountBalance];
        
    } failure:^(__kindof YTKBaseRequest *
                request) {
        NSLog(@"%@",request.requestOperationError);
    }];
}
/**
 *  加载GetJoinShop
 */
- (void)loadDataForShopView
{
    
    __weak typeof(self) weakSelf = self;
    THBaseRequestApi * api1 = [[ THBaseRequestApi alloc]initWithAction:@"GetJoinShopList" Requestparameter:[NSDictionary dictionary]];;
    
    [api1 startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        //
        NSArray * shops = [ZEJoinShop mj_objectArrayWithKeyValuesArray:request.responseJSONObject];
        weakSelf.shopVC.dataArray = shops;
        weakSelf.shop = shops.firstObject;
        [weakSelf updateShopViewWithModel:weakSelf.shop];
        
        
    } failure:^(__kindof YTKBaseRequest *request) {
        NSLog(@"error--%@",request.requestOperationError);
    }];
}

- (NSString *)timeStrWithStr:(NSString*)str
{
    // 2016年3月
    NSString * yStr = [str substringToIndex:4];
    NSString * mStr = [str substringWithRange:NSMakeRange(5, 1)];
    return [NSString stringWithFormat:@"%@-%@",yStr,mStr];
}
#pragma mark - getter

- (ZEAnimator *)animator
{
    CGFloat width = (200/375.0)*SCREEN_WIDTH;
    CGFloat height = width *0.75;
    if (_animator == nil) {
        _animator = [[ZEAnimator alloc]init];
        _animator.presentFrame = CGRectMake((self.view.width - width) * 0.5, (self.view.height)*0.5, width, height);
    }
    return _animator;
}

- (ZEShopViewController *)shopVC
{
    if (_shopVC == nil) {
        _shopVC = [[ZEShopViewController alloc]init];
        
        _shopVC.modalPresentationStyle = UIModalPresentationCustom;
        _shopVC.transitioningDelegate = self.animator;
    }
    return _shopVC;
}

#pragma makr - ZEContractBillViewDelegate

- (void)contractBillView:(ZEContractBillView *)contractBillView DidSelectedCellModel:(id)model
{
    NSLog(@"%@",model);
    ZEAccountDetailViewController * accountDetailVC = [[ZEAccountDetailViewController alloc]init];
    accountDetailVC.detailed = (ZEDetailed*)model;
    [self.navigationController pushViewController:accountDetailVC animated:YES];
}

#pragma mark -  通知相关

// 门店， 跟新显示门店的view和tableView
- (void)shopChanged:(NSNotification*)note
{
    self.shop = note.userInfo[@"shop"];
    NSLog(@"%@",self.shop.JoinShopName);
    [self updateAllUIWithShopModel:self.shop];
}

// 月份改变了，跟新tableView
- (void)refreshTabbleView:(NSNotification*)note
{
    self.monthMoney = note.userInfo[@"monthMoney"];
    NSString * dateStr = [self timeStrWithStr:self.monthMoney.strTime];

    [self loadDataForTableviewWithParam:@{@"Time":dateStr,@"ShopID":self.shop.JoinShopID}];
}

@end
