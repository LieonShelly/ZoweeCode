//
//  ZEWorkIndexViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEWorkIndexViewController.h"
#import "ZEWorkIndexTableView.h"

#import "ZeroWork.h"
#import "MJRefresh.h"
#import "WorkingInterface.h"

@interface ZEWorkIndexViewController ()
/**
 *  请求工作列表的页数
 */
@property (nonatomic,strong )NSNumber *page;
/**
 *  本地最新的ID,请求后更新
 */
@property (nonatomic ,strong)NSNumber *MaxID;
/**
 *  工作列表
 */
@property (nonatomic ,strong)NSArray *workList;

@property (nonatomic)ZEWorkIndexTableView *tableView;

@end

@implementation ZEWorkIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self uiInitSet];
    self.workList = [NSArray array];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self downRefreshLoading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)uiInitSet {
    self.tableView = [[ZEWorkIndexTableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header =[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefreshLoading)];
    // 马上进入刷新状态
    //[self.tableView.mj_header beginRefreshing];
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upRefreshLoading)];
}
/**
 *  下拉刷新
 */
- (void)downRefreshLoading {
    self.page = @1;
    self.MaxID = @0;
    
    [self workListLoading];
}
/**
 *  上拉加载更多
 */
- (void)upRefreshLoading {
    [self workListLoading];

}
/**
 *  工作列表加载
 */
- (void)workListLoading {
    NSDictionary *dic = @{
                          @"Page":self.page,
                          @"MaxID":self.MaxID,
                          @"Type":self.type
                          };
    [[WorkingInterface shareWorkInstance] WorkTableViewController:self ParmaDIC:dic withBlock:^(THNetWorkError *error, NSDictionary *dic) {
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableView.mj_footer endRefreshing];
        if (error) {
            NSLog(@"%@",error.errorDescription);
            return ;
        }
        if([dic[@"WorkList"] count] > 0) {
            self.MaxID = dic[@"MaxID"];
            self.page = [NSNumber numberWithInteger:([self.page integerValue] + 1)];
            if ([self.page isEqual:@2]) {//下拉刷新
                self.workList = [NSArray arrayWithArray:dic[@"WorkList"]];
            }else {//加载更多
                NSMutableArray *newWork = [NSMutableArray arrayWithArray:dic[@"WorkList"]];
                NSMutableArray *works = [NSMutableArray arrayWithArray:self.workList];
                [works addObjectsFromArray:newWork];
                self.workList = [NSArray arrayWithArray:works];
            }
            NSLog(@"workList:%@==========================",self.workList);
            self.tableView.works = self.workList;
        }
        
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    if ([segue.identifier isEqualToString:@"Task"]) {
//        ZeroWork *model = sender;
//        TaskViewController *task = [segue destinationViewController];
//        task.TaskID = model.TaskID;
//        task.TypeID = model.TaskTypeID;
//    }
//}

@end
