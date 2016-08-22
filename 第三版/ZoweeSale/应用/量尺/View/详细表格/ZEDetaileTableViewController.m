//
//  ZEDetaileTableViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEDetaileTableViewController.h"
#import "ZEDetaileTabView.h"
#import "ZEDetailTableViewCell.h"
#import "ZEDetailModelGroup.h"

@interface ZEDetaileTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak)  UITableView * tableView;


@end

@implementation ZEDetaileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    
    
    [self uiInit];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - selfMethod
- (void)uiInit{
    UITableView *tableView = [[UITableView alloc]init];
    [self.view addSubview:tableView];
    tableView.layer.masksToBounds = YES;
    tableView.layer.cornerRadius = 5;
    [tableView registerClass:[ZEDetailTableViewCell class] forCellReuseIdentifier:@"detailCell"];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 44;
    tableView.sd_layout
    .widthIs(550)
    .heightIs(650)
    .centerXEqualToView(self.view)
    .centerYEqualToView(self.view);
    self.tableView = tableView;
    
    UIButton *leftBtn = [UIButton new];
    leftBtn.backgroundColor = [UIColor whiteColor];
    [leftBtn setImage:ImageWithName(@"icon_arrow_page-left") forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    leftBtn.sd_layout
    .leftEqualToView(self.view)
    .centerYEqualToView(self.view)
    .widthIs(30)
    .heightIs(60);
}

- (void)leftBtnClick {
    ZEDetaileTabView * window = (ZEDetaileTabView *)[UIApplication sharedApplication].keyWindow;
    [window hidden];
}


#pragma  mark - tableviewDelegate



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    ZEDetailModelGroup * group = self.dataSource[section];
    return  group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"detailCell";
    ZEDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    ZEDetailModelGroup * group = self.dataSource[indexPath.section];
    cell.detailModel = group.items[indexPath.row];
    return cell;
    
}



- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
     ZEDetailModelGroup * group = self.dataSource[section];
    UILabel * label = [UILabel new];
    label.size = CGSizeMake(tableView.width, 45);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = group.headerTitle;
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

#pragma mark - publick Method

- (void)reloadDataWithDataSource:(NSArray *)dataSource
{
    self.dataSource = dataSource;
    [self.tableView reloadData];
}
//- (void)setDataSource:(NSArray *)dataSource
//{
//    _dataSource = dataSource;
//    [self.tableView reloadData];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
