//
//  ZEStoreNoticeViewController.m
//  ZoweeSale
//
//  Created by lieon on 16/7/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEStoreNoticeViewController.h"

#import "MJRefresh.h"
#import "ZEQXTool.h"
#import "ZENoticeList.h"
#import "ZESotreTableView.h"

@interface ZEStoreNoticeViewController ()

@property (nonatomic ,strong)  ZESotreTableView * tableView;


@property(nonatomic,strong) NSMutableArray * noticeLists;

/** 记录最后一次的请求参数 */
@property(nonatomic,strong) ZELoadNoticeListRequestParam * lastParam;

/** 记录请求参数的MaxID */
@property(nonatomic,strong) NSNumber * MaxID;

@end

@implementation ZEStoreNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        
    }];
    
    // 集成刷新控件
    self.tableView.mj_header  = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_footer = [MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreDeals)];
    
    [self.tableView.mj_header beginRefreshing];
    
}

- (void)loadNewData
{
    
    ZELoadNoticeListRequestParam *  param = [[ZELoadNoticeListRequestParam alloc]init];
    param.Page  = @1;
    param.MaxID = self.MaxID ? self.MaxID:@0;
    param.Type = self.type;
    
    [ZEQXTool NoticeListWithController:self param:param success:^(ZELoadNoticeListRequestResult *result) {
       
        
        // 只发送最后一次的请求参数
        if(param != self.lastParam) return ;
        
        ZENoticeList * noticelist = [result.ReturnParList firstObject];
        // 记录maxid
        self.MaxID = [NSNumber numberWithInteger:noticelist.MaxID];
        
        [self.noticeLists removeAllObjects];
        [self.noticeLists addObjectsFromArray:result.ReturnParList];
        
        self.tableView.works = self.noticeLists ;
        [self.tableView.mj_header endRefreshing];
        self.tableView.mj_footer.hidden = [self.MaxID  isEqual: @0];
         lieonLog(@"%@",self.noticeLists);
        
    } failure:^(THNetWorkError *error) {
        // 只发送最后一次的请求参数
        if(param != self.lastParam) return ;
        [MBProgressHUD showError:@"加载失败" toView:self.view];
        
        [self.tableView.mj_header endRefreshing];
    }];
    
    
    
    // 记录请求参数
    self.lastParam = param;
}

// 加载更多的数据
- (void)loadMoreDeals
{
    ZELoadNoticeListRequestParam * param = [[ ZELoadNoticeListRequestParam alloc]init];
    param.Page = @(self.lastParam.Page.intValue +  1);
    param.Page = self.MaxID;
    param.Type = self.type;
    [ZEQXTool NoticeListWithController:self param:param success:^(ZELoadNoticeListRequestResult *result) {
        lieonLog(@"%@",result.ReturnParList);
        
        // 只发送最后一次的请求参数
        if(param != self.lastParam) return ;
        ZENoticeList * noticelist = [result.ReturnParList firstObject];
        // 记录maxid
        self.MaxID = [NSNumber numberWithInteger:noticelist.MaxID];
        
        [self.noticeLists addObjectsFromArray:result.ReturnParList];
        
        self.tableView.works = self.noticeLists;
        
    } failure:^(THNetWorkError *error) {
        
        // 只发送最后一次的请求参数
        if(param != self.lastParam) return ;
        
        [MBProgressHUD showError:@"加载数据失败" toView:self.view];
        
        // 回滚页码，因为失败了，第二页没有加载成功，所以应该还原之前的页码
        self.lastParam.Page= @(param.Page.intValue - 1);
    }];
    
    [self.tableView.mj_footer endRefreshing];
    self.lastParam = param;
}


- (ZESotreTableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[ZESotreTableView alloc ]init];
        
    }
    return _tableView;
}

- (NSMutableArray *)noticeLists
{
    if (_noticeLists == nil) {
        _noticeLists = [NSMutableArray array];
    }
    return _noticeLists;
}

@end
