//
//  workZoneViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "workZoneViewController.h"
#import "workZoneTableView.h"
#import "ApplicationManage.h"
#import "NSNumber+TH.h"
#import "TYAttributedLabel.h"
#import "customerDetailViewController.h"


@interface workZoneViewController ()<TYAttributedLabelDelegate>

@property (nonatomic)workZoneTableView *tableView;

@property (nonatomic)NSNumber *page;

@property (nonatomic)NSNumber *MaxID;

@end

@implementation workZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self tableViewSetup];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableViewSetup {
    _tableView = [[workZoneTableView alloc] init];
    _tableView.controller = self;
    [self.view addSubview:_tableView];
    _tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
}
/**
 *  下拉刷新
 */
- (void)headerRefreshing {
    self.page = @1;
    self.MaxID = @0;
    [self loadingWorkZone:YES];
    //[self.tableView.mj_footer setHidden:YES];
}
/**
 *  上拉加载
 */
- (void)footerRefreshing {
    [self loadingWorkZone:NO];
}

- (void)loadingWorkZone:(BOOL)isheader {
    
    [[ApplicationManage shareManage] LoadCircleWorkListWithPage:self.page MaxID:self.MaxID Controller:self Block:^(THNetWorkError *error, workZoneList *list) {
        if (isheader)
        {
            [self.tableView.mj_header endRefreshing];
        }
        else
        {
            [self.tableView.mj_footer endRefreshing];
        }
        if (error) {
            [self showToastWithMsg:error.errorDescription];
        }else {
            NSMutableArray *array = [self viewModel:list.workZoneList];
            if (isheader) {
                self.tableView.workZoneArray = array;
            }else {
                [self.tableView.workZoneArray addObjectsFromArray:array];
                self.page = [NSNumber add:self.page and:@1];
                self.MaxID = list.MaxID;
            }
            [self.tableView reloadData];
        }
        
    }];
}
- (NSMutableArray *)viewModel:(NSMutableArray *)array {
    NSMutableArray *mutArray = [NSMutableArray array];
    for (workZoneModel *model in array) {
        WorkZoneViewModel *viewModel = [[WorkZoneViewModel alloc]init];
        viewModel.zoneModel = model;
        viewModel.process = NO;
        viewModel.execution = NO;
        viewModel.canFinish = NO;
        [mutArray addObject:viewModel];
    }
    return mutArray;
}
#pragma mark - TYAttributedLabelDelegate

- (void)attributedLabel:(TYAttributedLabel *)attributedLabel textStorageClicked:(id<TYTextStorageProtocol>)TextRun atPoint:(CGPoint)point
{
    NSLog(@"textStorageClickedAtPoint");
    if ([TextRun isKindOfClass:[TYLinkTextStorage class]]) {
        id linkStr = ((TYLinkTextStorage*)TextRun).linkData;
        NSLog(@"%@",linkStr);
        NSNumber *customerID = (NSNumber *)linkStr;
        customerDetailViewController *customerDetail = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateViewControllerWithIdentifier:@"customerDetail"];
        customerDetail.ID = customerID;
        [self.navigationController pushViewController:customerDetail
                                             animated:YES];
        
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
