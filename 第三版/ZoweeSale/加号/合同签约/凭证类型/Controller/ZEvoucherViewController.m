//
//  ZEvoucherViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEvoucherViewController.h"
#import "customerManager.h"

@interface ZEvoucherViewController ()
@property (nonatomic,strong) voucherTableView *tableView;
@end

@implementation ZEvoucherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[voucherTableView alloc]init];
    self.tableView.block = self.block;
    [self.view addSubview:_tableView];
    _tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    self.title = @"凭证类型";
    [self loading];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loading{
    [[customerManager sharecustomerInstance]GetVoucherTypeWithBlock:^(THNetWorkError *error, NSArray *array) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
        }else{
            self.tableView.voucherArray = array;
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

@end
