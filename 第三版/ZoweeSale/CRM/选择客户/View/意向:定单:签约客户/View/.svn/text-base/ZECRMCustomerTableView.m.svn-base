//
//  ZECRMCustomerTableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECRMCustomerTableView.h"
#import "HZURLNavigation.h"
#import "customerDetailViewController.h"
#import "ICPinyinGroup.h"

@interface ZECRMCustomerTableView()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic) NSMutableArray *attentionArray;

@end

@implementation ZECRMCustomerTableView{
    UIView* _headView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (void)setupAfter{
    [self registerClass:[ZECRMCUstomerTableViewCell class] forCellReuseIdentifier:self.cellStr];
}

- (void)setCustomers:(NSArray *)customers{
    _customers = customers;
    switch (_sortType) {
        case customersSortName:
            [self customrNameSort];
            break;
        default:
            [self customerSortOther];
            break;
    }
 
}
- (void)setIsNoContentShow:(BOOL)isNoContentShow{
    _isNoContentShow = isNoContentShow;
    if (isNoContentShow) {
        self.emptyDataSetSource = self;
        self.emptyDataSetDelegate = self;
    }
}
/**
 *  安装默认显示
 */
- (void)customerSortOther{
    self.viewModel.sectionTitlesArray = nil;
    
    _headView = [[UIView alloc]init];
    _headView.backgroundColor = hexColorString(@"f5f2f3");
    _headView.height = 40;
    _headView.width = SCREEN_WIDTH;
    
    UILabel *linebottom = [UILabel new];
    linebottom.backgroundColor = [hexColorString(@"999999") colorWithAlphaComponent:0.3];
    [_headView addSubview:linebottom];
    linebottom.sd_layout
    .bottomEqualToView(_headView)
    .leftEqualToView(_headView)
    .rightEqualToView(_headView)
    .heightIs(0.5);
    
    UILabel *lab = [UILabel new];
    lab.text = [NSString stringWithFormat:@"共%lu个客户",(unsigned long)_customers.count];
    lab.textColor = hexColorString(@"707070");
    lab.font = [UIFont systemFontOfSize:15];
    [_headView addSubview:lab];
    if (_customers.isNoEmpty) {
        _headView.hidden = NO;
    }else{
        _headView.hidden = YES;
    }
    lab.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0, 20, 0, 0));
    self.tableHeaderView = _headView;
    
    [self.viewModel.sectionModelArray removeAllObjects];
    YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
    [self.viewModel.sectionModelArray addObject:sectionModel];
    for (IntentionEntityClass *customer in _customers) {
        YZSTableViewCellModel *cellModel = [[YZSTableViewCellModel alloc] init];
        cellModel.height = 65;
        [sectionModel.cellModelArray addObject:cellModel];
        cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
            ZECRMCUstomerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellStr];
            if (!cell) {
                cell = [[ZECRMCUstomerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                         reuseIdentifier:self.cellStr];
            }
            cell.enableSider = self.enableSider;
            cell.sortType = _sortType;
            cell.customer = customer;
            return cell;
        };
        cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            if (_selection) {
                self.selection(customer);
                return ;
            }
            // customerDetail
            customerDetailViewController *controller = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil]instantiateViewControllerWithIdentifier:@"customerDetail"];
            controller.ID = customer.CustomerID;
            [[HZURLNavigation currentNavigationViewController]pushViewController:controller animated:YES];
        };
    }
    [self reloadData];
}

/**
 *  客户姓名排序显示
 */
- (void)customrNameSort{
    [self setAttentionArrayWithCustomers];
    NSDictionary *dict = [ICPinyinGroup group:_customers key:@"CustomerName"];
    NSMutableArray *sortedArrForArrays = [NSMutableArray arrayWithArray:[dict objectForKey:LEOPinyinGroupResultKey]];
    NSMutableArray *sectionHeadsKeys = [NSMutableArray arrayWithArray:[dict objectForKey:LEOPinyinGroupCharKey]];
    if (_attentionArray.count>0) {
        [sortedArrForArrays insertObject:_attentionArray atIndex:0];
        [sectionHeadsKeys insertObject:@"☆" atIndex:0];
    }
    [self setSectionIndexBackgroundColor:[UIColor whiteColor]];
    [self setSectionIndexColor:[UIColor darkGrayColor]];
    [self.viewModel.sectionModelArray removeAllObjects];
    self.viewModel.sectionTitlesArray = sectionHeadsKeys;
    for (int i=0; i<sectionHeadsKeys.count; i++) {
        NSArray *sectionArray = sortedArrForArrays[i];
        YZSTableViewSectionModel *sectionModel = [[YZSTableViewSectionModel alloc] init];
        sectionModel.headerTitle = sectionHeadsKeys[i];
        [self.viewModel.sectionModelArray addObject:sectionModel];
        for (IntentionEntityClass *customer in sectionArray) {
            YZSTableViewCellModel *cellModel = [[YZSTableViewCellModel alloc] init];
            cellModel.height = 65;
            [sectionModel.cellModelArray addObject:cellModel];
            cellModel.renderBlock = ^UITableViewCell *(NSIndexPath *indexPath, UITableView *tableView) {
                ZECRMCUstomerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellStr];
                if (!cell) {
                    cell = [[ZECRMCUstomerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                             reuseIdentifier:self.cellStr];
                }
                cell.enableSider = self.enableSider;
                cell.sortType = _sortType;
                cell.customer = customer;
                return cell;
            };
            cellModel.selectionBlock = ^(NSIndexPath *indexPath, UITableView *tableView) {
                [tableView deselectRowAtIndexPath:indexPath animated:YES];
                if (_selection) {
                    self.selection(customer);
                    return ;
                }
                // customerDetail
                customerDetailViewController *controller = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil]instantiateViewControllerWithIdentifier:@"customerDetail"];
                controller.ID = customer.CustomerID;
                [[HZURLNavigation currentNavigationViewController]pushViewController:controller animated:YES];
            };
        }
    }
    [self reloadData];

}

- (void)setAttentionArrayWithCustomers{
    _attentionArray = [NSMutableArray array];
    for (IntentionEntityClass *customer in _customers) {
        if ([customer.IsAttention isEqual:@1]) {
            [_attentionArray addObject:customer];
        }
    }
    NSMutableArray *mutableCustomers = [NSMutableArray arrayWithArray:_customers];
    [mutableCustomers removeObjectsInArray:_attentionArray];
    _customers = [NSArray arrayWithArray:mutableCustomers];

}
#pragma emptyDataSource Implementation

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"提示添加客户"
            ];
}
//- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
//{
//    return -self.height *.25;
//}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
    
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName:hexColorString(@"999999")};
    
    return [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"您还没有%@,\n现在去登记客户吧\n",[HZURLNavigation currentViewController].title]attributes:attributes];
}
- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [UIImage imageNamed:@"登记客户提示按钮"];
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
