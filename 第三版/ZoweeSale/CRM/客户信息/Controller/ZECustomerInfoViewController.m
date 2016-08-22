//
//  ZECustomerInfoViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECustomerInfoViewController.h"
#import "ZECustomerInfoTool.h"
#import "ZECustomerBasicInfoCell.h"

@interface ZECustomerInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSMutableArray * customerBasicInfos;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ZECustomerInfoViewController

#pragma mark - 初始化

- (void)viewDidLoad {
    [super viewDidLoad];
    //1. 请求客户的基本信息
    [self requestCustomerBaseInfo];
    
    // 2. 初始化UI
    [self initUI];
}

#pragma mark - 懒加载
- (NSMutableArray *)customerBasicInfos
{
    if (_customerBasicInfos == nil) {
        _customerBasicInfos = [NSMutableArray array];
    }
    return _customerBasicInfos;
}
#pragma  mnark - 私有方法
- (void)requestCustomerBaseInfo
{

    ZEZECustomerBasicRequsestParam * param = [[ZEZECustomerBasicRequsestParam alloc]init];
    param.CustomerID  = self.detail.CustomerID;
    
    [ZECustomerInfoTool customerBaseInfoWithController:self param:param success:^(ZECustomerBaseInfo *result) {
      
        [self.customerBasicInfos addObject:result];
       
        [self.tableView reloadData];
        
    } failure:^(THNetWorkError *error)
    {
    }];
   
}

-(void)initUI
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.estimatedRowHeight = 420;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark  - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.customerBasicInfos.count;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZECustomerBasicInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:@"baseInfo"];
    if (cell == nil) {
        cell = [[ZECustomerBasicInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"baseInfo"];
    }
    cell.baseInfo = self.customerBasicInfos[indexPath.row];
    
    NSLog(@"cell:%@",cell.baseInfo.CustomerName);
    return cell;
}

#pragma  mark - 代理方法

@end
