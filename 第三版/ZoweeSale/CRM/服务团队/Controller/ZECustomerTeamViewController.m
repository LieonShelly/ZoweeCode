//
//  ZECustomerTeamViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECustomerTeamViewController.h"
#import "ZECustomerTeam.h"
#import "ZECustomerInfoTool.h"
#import "ZECustomerTeamCell.h"
#import "UIViewController+showMsg.h"

@interface ZECustomerTeamViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray  * teams;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ZECustomerTeamViewController
#pragma mark - 初始化

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 请求服务团队
    [self requestCustomerTeam];
    // 2. 初始化UI
    [self initUI];
}

#pragma mark - 懒加载
- (NSMutableArray *)teams
{
    if (_teams == nil) {
        _teams = [NSMutableArray array];
    }
    return _teams;
}
#pragma  mnark - 私有方法
- (void)requestCustomerTeam
{

    ZECustomerTeamRequsestParam * param = [[ZECustomerTeamRequsestParam alloc]init];
    param.CustomerID  = self.detail.CustomerID;
    [ZECustomerInfoTool customerTeamWithController:self param:param success:^(ZECustomerTeamRequestResult *result) {
        [self.teams addObjectsFromArray:result.ReturnParList];
        [self.tableView reloadData];
        
    } failure:^(THNetWorkError *error) {
        
    }];
}

-(void)initUI
{
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    self.tableView.backgroundColor = ZECustomerGlobalBackgroudColor;
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = 48;
}

#pragma mark  - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.teams.count;
 
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZECustomerTeamCell * cell = [tableView dequeueReusableCellWithIdentifier:@"team"];
    if (cell == nil) {
        cell = [[ZECustomerTeamCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"team"];
    }
    cell.team = self.teams[indexPath.row];
    
    return cell;
}



#pragma mark  - 代理方法




@end
