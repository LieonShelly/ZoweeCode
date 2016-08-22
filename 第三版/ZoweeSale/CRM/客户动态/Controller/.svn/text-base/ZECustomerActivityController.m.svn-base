//
//  ZECustomerActivityController.m
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECustomerActivityController.h"
#import "ZECustomerInfoTool.h"
#import "ZECustomerActivityCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@interface ZECustomerActivityController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSMutableArray * activities;
@end

@implementation ZECustomerActivityController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1. 请求客户的动态
    [self requestCustomerActivity];
    
    // 2. 初始化UI
    [self initUI];
}

#pragma mark - 懒加载 
- (NSMutableArray *)activities
{
    if (_activities == nil) {
        _activities = [NSMutableArray array];
    }
    return _activities;
}
#pragma  mnark - 私有方法
- (void)requestCustomerActivity
{
    ZECustomerActivityRequestParam * param = [[ZECustomerActivityRequestParam alloc]init];
    param.CustomerID  = self.detail.CustomerID;
    [ZECustomerInfoTool customerActivityWithController:self param:param success:^(ZECustomerActivityRequestResult *result) {
        [self.activities addObjectsFromArray:result.ReturnParList];
        [self.tableView reloadData];
        
        
    } failure:^(THNetWorkError *error) {

    }];
}

-(void)initUI
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    self.tableView.backgroundColor = ZECustomerGlobalBackgroudColor;
    self.tableView.estimatedRowHeight = 107;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark  - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.activities.count;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZECustomerActivityCell * cell = [tableView dequeueReusableCellWithIdentifier:@"activity"];
    if (cell == nil) {
        cell = [[ZECustomerActivityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"activity"];
    }
 
    if(self.activities.count >1)
    {
        cell.onlyOneRow = NO;
        if(indexPath.row == 0)// 第一行
        {
            cell.firstRow = YES;
            cell.lastRow = NO;
        }else if (indexPath.row == self.activities.count-1)// 最后一个一行
        {
            cell.lastRow = YES;
            cell.firstRow = NO;
        }else{
            cell.lastRow = NO;
            cell.firstRow = NO;
        }
    }else{
        cell.onlyOneRow = YES;
    }
 
    
    cell.activity = self.activities[indexPath.row];
  
    return cell;
}



#pragma mark  - 代理方法

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 107;
//}



@end
