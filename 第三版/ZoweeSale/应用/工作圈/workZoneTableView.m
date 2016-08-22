//
//  workZoneTableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "workZoneTableView.h"

static  NSString *Kidentifier = @"workZoneCell";

@interface workZoneTableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation workZoneTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.tableFooterView = [UIView new];
    self.tableHeaderView = [UIView new];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.backgroundColor = hexColorString(@"f5f2f3");
    self.dataSource = self;
    self.delegate = self;
    [self registerClass:[workZoneTableViewCell class] forCellReuseIdentifier:Kidentifier];
}


#pragma UITableView - dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.workZoneArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    workZoneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Kidentifier];
    cell.delegate = _controller;
    cell.viewModel = self.workZoneArray[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma  UITableView －delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView cellHeightForIndexPath:indexPath model:self.workZoneArray[indexPath.section]  keyPath:@"viewModel" cellClass:[workZoneTableViewCell class] contentViewWidth:SCREEN_WIDTH];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 5)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 5)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
@end
