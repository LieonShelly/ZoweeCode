//
//  ZEPickDateViewController.m
//  ZoweeSale
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPickDateViewController.h"

@interface ZEPickDateViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZEPickDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 100, 200, SCREEN_HEIGHT);
    
    UITableView * tbView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 90, 200)];
    tbView.delegate = self;
    tbView.dataSource = self;
    [self.view addSubview:tbView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text = @"2016";
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
    
}

@end
