//
//  ZEWorkIndexTableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEWorkIndexTableView.h"
#import "YZSTableviewModel.h"
#import "ZEWorkTypeTableViewCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIScrollView+EmptyDataSet.h"
#import "HZURLNavigation.h"

#import "TaskViewController.h"

@interface ZEWorkIndexTableView ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>


@end

@implementation ZEWorkIndexTableView
{
    YZSTableViewModel *_viewModel;
    NSString *cellStr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        cellStr = @"typeCell";
        [self setup];
    }
    return self;
}

- (void) setup {
    self.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    self.backgroundColor = [UIColor colorWithHexString:@"f0eded"];
    [self registerClass:[ZEWorkTypeTableViewCell class] forCellReuseIdentifier:cellStr];
    self.tableFooterView = [UIView new];
    _viewModel= [[YZSTableViewModel alloc]init];
    self.delegate = _viewModel;
    self.dataSource = _viewModel;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.emptyDataSetSource = self;
    self.emptyDataSetDelegate = self;
}

- (void)setWorks:(NSArray *)works{
    _works = works;
    [_viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [_viewModel.sectionModelArray addObject:sectionModel];
    for (ZeroWork *work in works) {
        YZSTableViewCellModel *cellModel = [[YZSTableViewCellModel alloc] init];
        //cellModel.height = 200;
        [sectionModel.cellModelArray addObject:cellModel];
        cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            ZEWorkTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
            if (!cell) {
                cell = [[ZEWorkTypeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                      reuseIdentifier:cellStr];
            }
            cell.workModel = work;
            return cell;
        };
        cellModel.heightBlock = ^CGFloat (NSIndexPath *indexPath, UITableView *tableView) {
            CGFloat height = [tableView cellHeightForIndexPath:indexPath model:work keyPath:@"workModel" cellClass:[ZEWorkTypeTableViewCell class] contentViewWidth:SCREEN_WIDTH];
            //NSLog(@"%ld,%ld,%f",(long)indexPath.row,(long)indexPath.section,height);
            return height;
        };
        cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            TaskViewController *controller = [[UIStoryboard storyboardWithName:@"Work" bundle:nil] instantiateViewControllerWithIdentifier:@"taskDetail"];
            controller.TaskID = work.TaskID;
            controller.TypeID = work.TaskTypeID;
            [[HZURLNavigation currentNavigationViewController]pushViewController:controller animated:YES];
        };
    }
    [self reloadData];
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
