//
//  ZEQXViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEQXViewController.h"
#import "ZENavigationController.h"
#import "UIBarButtonItem+Extension.h"
#import "ZEQXTableViewCell.h"
#import "ZEQXTool.h"
#import "ZECompanyNoticeController.h"
#import "MBProgressHUD+NJ.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"
#import "ZENoticeSegViewController.h"

@interface ZEQXViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView * tableView;

@property(nonatomic,strong) NSArray * QXes;
@end

@implementation ZEQXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化UI
    [self initUI];
    
}



#pragma mark - 私有方法

//- (void)loadUserInfo
//{
//    [ZEQXTool userDetailWithController:self param:[NSDictionary dictionary] success:^(ZEPersonalInfo *result) {
//        
//        lieonLog(@"result:%@",result.HeadUrl);
//       // 存储用户信息
//        [ZEQXTool saveUseInfo:result];
//        
//    } failure:^(THNetWorkError *error) {
//        [MBProgressHUD showError:@"获取用户信息失败" toView:self.view];
//    }];
//}

- (void)initUI
{
    self.navigationItem.title = @"企信";
    
    UITableView * tableView = [[UITableView alloc]init];
    tableView.delegate =self;
    tableView.dataSource = self;
    tableView.backgroundColor = ZECustomerGlobalBackgroudColor;
    //tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = tableView;
    self.tableView.tableFooterView = [UIView new];
    
    [self.view addSubview:tableView];
    tableView.sd_layout
    .topSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
    // 集成刷新控件
    self.tableView.mj_header  = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    [self.tableView.mj_header beginRefreshing];
}



- (void)loadNewData
{
    
  [ZEQXTool QXWithController:self param:[NSDictionary dictionary] success:^(ZEQXRequestResult *result) {
       self.QXes = result.ReturnParList;
       [self.tableView reloadData];
       [self.tableView.mj_header endRefreshing];
  } failure:^(THNetWorkError *error) {
      [MBProgressHUD showError:@"加载失败" toView:self.view];
      [self.tableView.mj_header endRefreshing];
  }];
    
  
}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.QXes.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ZEQXTableViewCell * cell = [ZEQXTableViewCell cellWithTableView:tableView dequeueReusableCellWithIdentifier:@"QX"];
    cell.QX = self.QXes[indexPath.row];
    return cell;
}

#pragma mark - 代理方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        UIView * header = [[UIView alloc]init];
        
        header.backgroundColor = [UIColor clearColor];
        header.frame = CGRectMake(0, 0, self.tableView.width, 15);
      
        return header;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZEQX * qx = self.QXes[indexPath.row];
    
    ZECompanyNoticeController *controller = [[ZECompanyNoticeController alloc]init];
    controller.title = qx.Title;
    controller.type = qx.TypeID;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:controller animated:YES];
}


@end
