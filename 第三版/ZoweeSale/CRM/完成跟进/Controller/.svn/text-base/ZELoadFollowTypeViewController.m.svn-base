//
//  ZELoadFollowTypeViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZELoadFollowTypeViewController.h"


@interface ZELoadFollowTypeViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ZELoadFollowTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 初始化UI
    [self initUI];
}

#pragma  mark  - 私有方法
 - (void)initUI
{
  
}

#pragma 数据源方法
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.followTypes.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"followType"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"followType"];
    }
    ZELoadFollowType * type = self.followTypes[indexPath.row];
    cell.textLabel.text = type.Title;
    return cell;
}

#pragma  mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZELoadFollowType  * type = self.followTypes[indexPath.row];
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(loadFollowTypeViewController:DidSelectedType:)]) {
        [self.delegate loadFollowTypeViewController:self DidSelectedType:type];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
