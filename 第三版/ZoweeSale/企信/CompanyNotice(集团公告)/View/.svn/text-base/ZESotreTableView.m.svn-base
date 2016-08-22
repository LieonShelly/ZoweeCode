//
//  ZESotreTableView.m
//  ZoweeSale
//
//  Created by lieon on 16/7/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZESotreTableView.h"
#import "ZENoticeList.h"
#import "YZSTableviewModel.h"
#import "ZEWorkTypeTableViewCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIScrollView+EmptyDataSet.h"
#import "HZURLNavigation.h"
#import "ZEDetailNoticeViewController.h"
#import "ZECompanyNoticeCell.h"

@interface ZESotreTableView()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZESotreTableView
{
    YZSTableViewModel *_viewModel;
    NSString *cellStr;
}

 - (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setup];
        
    }
    return self;
}

- (void) setup
{
    self.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    self.backgroundColor = [UIColor colorWithHexString:@"f0eded"];
    [self registerNib:[UINib nibWithNibName:@"ZECompanyNoticeCell" bundle:nil] forCellReuseIdentifier:@"notice"];
    self.tableFooterView = [UIView new];
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.dataSource = self;
    self.delegate = self;
    self.emptyDataSetSource = self;
    self.emptyDataSetDelegate = self;
}



- (void)setWorks:(NSArray *)works
{
    _works = works;
    [self reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.works.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZECompanyNoticeCell * cell = [ZECompanyNoticeCell cellWithTableView:tableView dequeueReusableCellWithIdentifier:@"notice"];
    
    cell.noticeList = self.works[indexPath.row];
    cell.dividerHidden = indexPath.row == self.works.count-1;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZEDetailNoticeViewController * detailVC = [[ZEDetailNoticeViewController alloc]init];
    detailVC.noticeList = self.works[indexPath.row];
    detailVC.titleStr = @"公告详情";
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[HZURLNavigation currentNavigationViewController] pushViewController:detailVC animated:YES];
    
}


#pragma emptyDataSource Implementation

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"工作主页提示"];
}
//- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
//{
//    return -self.height *.25;
//}

//- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
//{
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
//
//    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
//
//    animation.duration = 0.25;
//    animation.cumulative = YES;
//    animation.repeatCount = MAXFLOAT;
//
//    return animation;
//}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName:hexColorString(@"999999")};
    if ([self.viewController.title isEqualToString:@"未完成"]) {
        return [[NSAttributedString alloc] initWithString:@"当前没有待办工作，\n登记新客户开始新工作" attributes:attributes];
    }
    else{
        return [[NSAttributedString alloc] initWithString:@"当前没有已完成的工作" attributes:attributes];
    }
}
- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    if ([self.viewController.title isEqualToString:@"未完成"]) {
        return [UIImage imageNamed:@"登记客户提示按钮"];
    }else{
        return nil;
    }
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    [[HZURLNavigation currentNavigationViewController] pushViewController:[[UIStoryboard storyboardWithName:@"Add" bundle:nil] instantiateViewControllerWithIdentifier:@"registerUser"] animated:YES];
}
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor clearColor];
}


@end
