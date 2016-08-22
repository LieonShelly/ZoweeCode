//
//  ZECompanyNoticeController.m
//  ZoweeSale
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//  工厂公告

#import "ZECompanyNoticeController.h"
#import "ZECompanyNoticeCell.h"
#import "MBProgressHUD+NJ.h"
#import "MJRefresh.h"
#import "ZEQXTool.h"
#import "ZEDetailNoticeViewController.h"


@interface ZECompanyNoticeController ()

@property(nonatomic,strong) NSMutableArray * noticeLists;

/** 记录最后一次的请求参数 */
@property(nonatomic,strong) ZELoadNoticeListRequestParam * lastParam;

/** 记录请求参数的MaxID */
@property(nonatomic,strong) NSNumber * MaxID;

@end

@implementation ZECompanyNoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

#pragma  mark - 懒加载

- (NSMutableArray *)noticeLists
{
    if (_noticeLists == nil) {
        _noticeLists = [NSMutableArray array];
    }
    return _noticeLists;
}
#pragma  mark - 私有方法

- (void)initUI
{
    self.tableView.backgroundColor = ZECustomerGlobalBackgroudColor;
    [self.tableView registerNib:[UINib nibWithNibName:@"ZECompanyNoticeCell" bundle:nil] forCellReuseIdentifier:@"notice"];
   
    self.tableView.estimatedRowHeight = 103;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.tableFooterView = [UIView new];
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
        lieonLog(@"%@",result.ReturnParList);
        
        // 只发送最后一次的请求参数
        if(param != self.lastParam) return ;
        
        ZENoticeList * noticelist = [result.ReturnParList firstObject];
        // 记录maxid
        self.MaxID = [NSNumber numberWithInteger:noticelist.MaxID];
        
        [self.noticeLists removeAllObjects];
        [self.noticeLists addObjectsFromArray:result.ReturnParList];
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        
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
        [self.tableView reloadData];
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


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.tableView.mj_footer.hidden = [self.MaxID  isEqual: @0];
    return self.noticeLists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZECompanyNoticeCell * cell = [ZECompanyNoticeCell cellWithTableView:tableView dequeueReusableCellWithIdentifier:@"notice"];
    
    cell.noticeList = self.noticeLists[indexPath.row];
    lieonLog(@"%lu",self.noticeLists.count);
    cell.dividerHidden = indexPath.row == self.noticeLists.count-1;
    return cell;
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZEDetailNoticeViewController * detailVC = [[ZEDetailNoticeViewController alloc]init];
    detailVC.noticeList = self.noticeLists[indexPath.row];
    detailVC.titleStr = @"公告详情";
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
@end
