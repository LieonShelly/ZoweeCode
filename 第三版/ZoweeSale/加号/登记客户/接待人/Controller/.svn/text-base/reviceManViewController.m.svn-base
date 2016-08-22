//
//  reviceManViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "reviceManViewController.h"
#import "reviceTableViewCell.h"
#import "customerManager.h"

@interface reviceManViewController ()

@property (nonatomic ,strong) NSArray *cervices;

@end

@implementation reviceManViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiInitSet];
    self.navigationController.navigationBar.hidden = NO;
    [self networking];
    // Do any additional setup after loading the view.
}

- (NSArray *)cervices {
    if (!_cervices) {
        _cervices = [NSArray array];
    }
    return _cervices;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)networking {
    [[customerManager sharecustomerInstance] loadGuidListWithController:self block:^(THNetWorkError *error, NSArray *guidS) {
        if (error) {
            NSLog(@"cuow");
        }else {
            self.cervices = [guidS copy];
            [self.tableView reloadData];
        }
        
        
    }];
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
    return self.cervices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    reviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"revicecell" forIndexPath:indexPath];
    NSDictionary *dic = self.cervices[indexPath.row];
    cell.name = dic[@"Name"];
    
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = self.cervices[indexPath.row];
    self.block(dic[@"ID"],dic[@"Name"]);
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
