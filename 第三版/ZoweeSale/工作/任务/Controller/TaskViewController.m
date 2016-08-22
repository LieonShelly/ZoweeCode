

//
//  TaskViewController.m
//  ZoweeSale
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "TaskViewController.h"

#import "nameTableViewCell.h"
#import "taskTableViewCell.h"
#import "implTableViewCell.h"
#import "timeTableViewCell.h"
#import "clientsTableViewCell.h"

#import "workDetailed.h"

#import "WorkingInterface.h"

#import "taskfinishViewController.h"
#import "customerDetailViewController.h"
#import "ZEFollowFinishTaskViewController.h"
#import "ZEArrangMentViewController.h"


@interface TaskViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *finishBtn;

@property (nonatomic ,strong)workDetailed *detail;

@end

@implementation TaskViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detail = [[workDetailed alloc]init];
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#f6f2f3"];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [UIView new];
    [self.tableView registerClass:[taskTableViewCell class] forCellReuseIdentifier:@"taskCell"];
    [self loadingWorkDetail];
    if ([self.TypeID isEqual:@8]){
        [self.finishBtn setTitle:@"派尺" forState:UIControlStateNormal];
        [self.finishBtn setTitle:@"已派尺" forState:UIControlStateDisabled];
        [self.finishBtn setImage:[UIImage imageNamed:@"派尺"] forState:UIControlStateNormal];
    }else {
        [self.finishBtn setTitle:@"完成" forState:UIControlStateNormal];
        [self.finishBtn setTitle:@"已完成" forState:UIControlStateDisabled];
        [self.finishBtn setImage:[UIImage imageNamed:@"完成"] forState:UIControlStateNormal];
    }
    
}
- (void)loadingWorkDetail {
    NSDictionary *dic = @{
                          @"TypeID":self.TypeID,
                          @"TaskID":self.TaskID
                          };
    [[WorkingInterface shareWorkInstance] workDetailWithController:self ParmaDic:dic Withblock:^(THNetWorkError *error, workDetailed *detail) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
        }else {
            self.detail = detail;
            if ([self.detail.State isEqual:@2]) {
                [self.finishBtn setEnabled:NO];
            }else {
                self.finishBtn.enabled = YES;
            }
            [self.tableView reloadData];
        }
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 71;
    }else if (indexPath.row == 1) {
        return [tableView cellHeightForIndexPath:indexPath model:self.detail.Content  keyPath:@"taskCont" cellClass:[taskTableViewCell class] contentViewWidth:SCREEN_WIDTH];
    }else if (indexPath.row == 2) {
        return 46;
    }else if (indexPath.row == 3) {
        return 46;
    }else if (indexPath.row == 4) {
        return 140;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        nameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nameCell" forIndexPath:indexPath];
        cell.photeUrl = self.detail.HeadUrl;
        cell.name = self.detail.UserName;
        cell.tagStr = [self.detail tagStr];
        cell.stateStr = [self.detail stateStr];
        cell.finishNumber = [self.detail finishNumberStr];
        return cell;
    }else if (indexPath.row == 1) {
        taskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"taskCell"];
        cell.taskStr = self.detail.Title;
        cell.taskCont = self.detail.Content;
        cell.state = self.detail.State;
        return cell;
    }else if (indexPath.row == 2) {
        implTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"implCell" forIndexPath:indexPath];
        cell.executorNameList = self.detail.ExecutorNameList;
        return cell;
    }else if (indexPath.row == 3) {
        timeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timeCell" forIndexPath:indexPath];
        cell.timeStr = self.detail.ExecuteTime;
        return cell;
    }else if (indexPath.row == 4) {
        clientsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"clientCell" forIndexPath:indexPath];
        cell.clientStr = self.detail.CustomerName;
        return cell;
    }
    return nil;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 4) {
        customerDetailViewController *detaleController = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateViewControllerWithIdentifier:@"customerDetail"];
        detaleController.ID = self.detail.CustomerID;
        [self.navigationController pushViewController:detaleController animated:YES];
    }
}

#pragma mark - 按钮点击
- (IBAction)finish:(id)sender {
    if ([self.detail.TaskTypeID isEqual:@1]) {
        ZEFollowFinishTaskViewController *controller = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateViewControllerWithIdentifier:@"followFinish"];
        customerDetail *detail = [[customerDetail alloc]init];
        detail.TaskID = self.detail.TaskID;
        detail.CustomerID = self.detail.CustomerID;
        controller.detail = detail;
        [self.navigationController pushViewController:controller animated:YES];
    }else if([self.detail.TaskTypeID isEqual:@2]) {
        [self performSegueWithIdentifier:@"finish" sender:nil];
        lieonLog(@"fininsh");
    }else if ([self.detail.TaskTypeID isEqual:@8]){
        ZEArrangMentViewController *controller = [[ZEArrangMentViewController alloc]init];
        arrangeMent *ment = [[arrangeMent alloc]init];
        ment.OrderId = self.detail.CustomerID;
        controller.tablement = ment;
        [self.navigationController pushViewController:controller animated:YES];

    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"finish"]) {
        taskfinishViewController *controller = [segue destinationViewController];
        controller.detail = self.detail;
    }
}



@end
