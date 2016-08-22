//
//  ZEAttachmentsViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/3.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAttachmentsViewController.h"
#import "ZEAttachmentsTable.h"
#import "CrmCustomerInterface.h"
@interface ZEAttachmentsViewController ()

@property (nonatomic)ZEAttachmentsTable *tableView;
@end

@implementation ZEAttachmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全部附件";
    self.view.backgroundColor = [UIColor whiteColor];
    [self InitTableView];
    [self loding];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)InitTableView {
    self.tableView = [[ZEAttachmentsTable alloc]init];
    [self.view addSubview:_tableView];
    _tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    
}

- (void)loding{
    [crmCustomerShare GetCustomerFileListWithOrderID:self.detail.CustomerID Block:^(THNetWorkError *error, NSArray *fileArray) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
        }else{
            self.tableView.attachments = fileArray;
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
