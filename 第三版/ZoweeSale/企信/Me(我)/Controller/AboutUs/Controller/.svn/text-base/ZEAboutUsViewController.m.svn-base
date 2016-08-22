//
//  ZEAboutUsViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAboutUsViewController.h"

@interface ZEAboutUsViewController ()

@end

@implementation ZEAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSections];
    [self initUI];
}

- (void)initUI
{
    UIView * view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, self.view.width, 125);
    view.backgroundColor = [UIColor redColor];
    
    self.tableView.tableHeaderView = view;
}
- (void)addSections
{
    ZEItem * item1 = [[ZEArrowItem alloc]initWithIcon:nil title:@"企业网站" destClass:nil];
    item1.option = ^{
        
        lieonLog(@"企业网站");
    };
    ZEItem * item2 = [[ZEArrowItem alloc]initWithIcon:nil title:@"服务条款" destClass:nil];
    ZESetGroup * g1 = [[ZESetGroup alloc]init];
    g1.items = @[item1,item2];
    [self.data addObject:g1];
}



@end
