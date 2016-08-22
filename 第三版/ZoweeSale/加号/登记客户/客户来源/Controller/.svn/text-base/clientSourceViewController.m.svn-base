//
//  clientSourceViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "clientSourceViewController.h"
#import "sourceTableViewCell.h"
#import "customerManager.h"

@interface clientSourceViewController ()

@property (nonatomic ,strong)NSArray *sources;

@end

@implementation clientSourceViewController

- (NSArray *)sources {
    if (!_sources) {
        _sources = [NSArray array];
    }
    return _sources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiInitSet];
    self.navigationController.navigationBar.hidden = NO;
    [self networking];
    // Do any additional setup after loading the view.
}

- (void)networking {
    
    [[customerManager sharecustomerInstance] loadCustomerSourceWithController:self block:^(THNetWorkError *error, NSArray *Sources) {
        if (error) {
            NSLog(@"cuo");
        }else {
            self.sources = [Sources copy];
            [self.tableView reloadData];
        }
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)uiInitSet {
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [UIView new];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _sources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    sourceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sourcecell" forIndexPath:indexPath];
    NSDictionary *dic = self.sources[indexPath.row];
    cell.type = dic[@"Name"];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.sources[indexPath.row];
    self.block(dic[@"ID"],dic[@"Name"]);
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
