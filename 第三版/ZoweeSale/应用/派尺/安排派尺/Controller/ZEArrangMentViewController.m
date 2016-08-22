//
//  ZEArrangMentViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEArrangMentViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "ApplicationManage.h"
#import "MJExtension.h"

@interface ZEArrangMentViewController ()

@property (nonatomic) ZEArrangeTableView* tableView;
@end

@implementation ZEArrangMentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (arrangeMent *)tablement{
    if (!_tablement) {
        _tablement = [[arrangeMent alloc]init];
    }
    return _tablement;
}
- (void)setup{
    self.title = @"安排派尺";
    self.tableView = [[ZEArrangeTableView alloc]init];
    self.tableView.ment = self.tablement;
    [self.view addSubview:_tableView];
    self.tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithTitle:@"提交" target:self action:@selector(submitBtnClick:)];
}
- (void)submitBtnClick:(UIButton *)sender {
    arrangeMent *ment = self.tableView.ment;
    NSString *error =[ment entityisNoEmpty];
    if (error) {
        [self showToastWithMsg:error];
        return;
    }
    NSMutableDictionary *dic = [ment mj_keyValues];
    [dic removeObjectForKey:@"desigerName"];
    [[ApplicationManage shareManage] SaveSendRulerTaskWithParm:dic Block:^(THNetWorkError *error) {
        if (error) {
            [self showToastWithMsg:error.errorDescription];
        }else{
            [self showToastWithMsg:@"提交成功"];
            if (self.time) {
                self.time(ment.MeasureDate);
            }
            [self.navigationController popViewControllerAnimated:YES];
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
