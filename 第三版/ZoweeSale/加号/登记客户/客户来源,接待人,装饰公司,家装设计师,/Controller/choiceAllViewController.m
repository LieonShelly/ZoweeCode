//
//  choiceAllViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "choiceAllViewController.h"
#import "choiceAllTableView.h"
#import "customerManager.h"


@interface choiceAllViewController ()
@property (nonatomic,strong) choiceAllTableView *tableView;

@end

@implementation choiceAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self lodingNetWorking];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    self.title = _titleName;
    self.tableView = [[choiceAllTableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.sd_layout
    .spaceToSuperView(UIEdgeInsetsZero);
    
}

- (void)lodingNetWorking{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:_titleName forKey:@"type"];
    if ([_titleName isEqualToString:@"设计师"]) {
        [dic setValue:_ID forKey:@"ID"];
    }
    [[customerManager sharecustomerInstance] loadAllListWithController:self typeDIc:dic block:^(THNetWorkError *error, NSArray *allArray) {
        if (allArray) {
            self.tableView.dataArray = allArray;
            [self.tableView reloadData];
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
