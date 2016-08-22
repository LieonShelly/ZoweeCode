//
//  ZEShopViewController.m
//  ZoweeSale
//
//  Created by lieon on 16/6/13.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEShopViewController.h"
#import "ZEJoinShop.h"
#import "ZEShopTableViewCell.h"
@interface ZEShopViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView * tableView;


@end

@implementation ZEShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}


#pragma mark - getter

- (UITableView *)tableView
{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
//        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.layer.cornerRadius = 5;
        _tableView.layer.masksToBounds = YES;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"ZEShopTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZEShopTableViewCell"];
    }
    return _tableView;
}

#pragma mark - selfMethod

- (void)setupUI
{

    [self.view addSubview:self.tableView];
    
    self.tableView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .bottomEqualToView(self.view)
    .rightEqualToView(self.view);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZEShopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZEShopTableViewCell"];
    if (cell == nil) {
        cell = [[ZEShopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZEShopTableViewCell"];
    }
    cell.backgroundColor = [UIColor whiteColor];
    ZEJoinShop * shop = self.dataArray[indexPath.row];
    cell.shop = shop;
  
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"shop" object:self userInfo:@{@"shop":self.dataArray[indexPath.row]}];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
