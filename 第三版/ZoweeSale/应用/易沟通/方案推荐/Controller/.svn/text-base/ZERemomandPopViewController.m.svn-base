//
//  ZERemomandPopViewController.m
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERemomandPopViewController.h"
#import "ZEPopTopView.h"
#import "ZETagModel.h"
#import "ZEPopTableViewCell.h"

@interface ZERemomandPopViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView * tableView;
@property (nonatomic ,strong) ZEPopTopView * topView;
@end

@implementation ZERemomandPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    NSLog(@"viewDidLoad%@",NSStringFromCGRect(self.view.frame));
}

- (void)setupUI
{
    
    self.view.layer.cornerRadius = 5;
    self.view.layer.masksToBounds = YES;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.topView];
    
    self.tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomEqualToView(self.view)
    .topSpaceToView(self.view,44);
    self.topView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.tableView,0)
    .topSpaceToView(self.view,0);
}

- (void)setName:(NSString *)name
{
    _name = name;
    self.topView.title = name;
}
- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    if (dataArray == nil) {
        return;
    }
    [self.tableView reloadData];
}
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = YES;
        [_tableView registerClass:[ZEPopTableViewCell class] forCellReuseIdentifier:@"ZEPopTableViewCell"];
    }
    return _tableView;
}

- (ZEPopTopView *)topView
{
    if (_topView == nil) {
        _topView = [[ZEPopTopView alloc]init];
    }
    return _topView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZEPopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZEPopTableViewCell"];
    if (cell == nil) {
        cell = [[ZEPopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZEPopTableViewCell"];
        
    }
    ZETagModel * model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(recommandPopViewControllerDidSlectedModel:)]) {
        [self.delegate recommandPopViewControllerDidSlectedModel:self.dataArray[indexPath.row]];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
