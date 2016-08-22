//
//  followingViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/7.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "followingViewController.h"
#import "ZECustomerInfoTool.h"
#import "ZEFollowingTableViewCell.h"
#import "MBProgressHUD+NJ.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@interface followingViewController () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSMutableArray * followingSttases;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation followingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1. 请求客户的跟进情况
   [self requestCustomerFollowingStatus];
    
    // 2. 初始化UI
    [self initUI];

}


#pragma  mark - 懒加载
 - (NSMutableArray *)followingSttases
{
    if(_followingSttases == nil)
    {
        _followingSttases = [NSMutableArray array];
    }
    return _followingSttases;
}

#pragma  mark - 私有方法

/**
 *  请求客户的跟进情况数据
 */
- (void)requestCustomerFollowingStatus
{

    followingRequestParam * param = [[followingRequestParam alloc]init];
    param.CustomerID  = self.detail.CustomerID;
    [ZECustomerInfoTool followingStatusWithController:self param:param success:^(followingStatusResponseResult *result) {
        [self.followingSttases addObjectsFromArray:result.ReturnParList];
        [self.tableView reloadData];
    } failure:^(THNetWorkError *error) {
    }];
}

- (void)initUI
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    self.tableView.backgroundColor = ZECustomerGlobalBackgroudColor;
    self.tableView.estimatedRowHeight = 160;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}
#pragma mark  - 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"%lu",(unsigned long)self.followingSttases.count);
    return self.followingSttases.count;

}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZEFollowingTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"follow"];
    if(cell == nil)
    {
        cell = [[ZEFollowingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"follow"];
      
    }
    if(self.followingSttases.count == 1) //  只有一行
    {
        cell.onlyOneRow = YES;
    }else if(indexPath.row == 0)// 第一行
    {
        cell.firstRow = YES;
        cell.lastRow = NO;
    }else if (indexPath.row == self.followingSttases.count-1)// 最后一行
    {
        cell.lastRow = YES;
        cell.firstRow = NO;
    }else{
        cell.lastRow = NO;
        cell.firstRow = NO;
    }
    cell.followingStatus = self.followingSttases[indexPath.row];
    return cell;
}

#pragma mark  - 代理方法



@end
