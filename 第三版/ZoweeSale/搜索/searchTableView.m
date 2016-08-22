//
//  searchTableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "searchTableView.h"
#import "searchHistoryTableViewCell.h"
#import "searchResultTableViewCell.h"

static NSString *searchHistory = @"searchHistoryTableViewCell";
static NSString *searchResult = @"searchResultTableViewCell";

@interface searchTableView ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,UITableViewDelegate,UITableViewDataSource,searchHistoryDelegate>

@end

@implementation searchTableView

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
        [self initSetup];
    }
    return self;
}

- (void)initSetup {
    self.emptyDataSetSource = self;
    self.emptyDataSetDelegate = self;
    self.dataSource = self;
    self.delegate = self;
    self.tableFooterView = [UIView new];
    [self registerNib:[UINib nibWithNibName:searchHistory bundle:nil] forCellReuseIdentifier:searchHistory];
    [self registerClass:[searchResultTableViewCell class] forCellReuseIdentifier:searchResult];
}

- (NSArray *)searchHistory {
    if (!_searchHistory) {
        _searchHistory = [NSArray array];
    }
    return _searchHistory;
}

- (NSArray *)searchResult {
    if (!_searchResult) {
        _searchResult = [NSArray array];
    }
    return _searchResult;
}


#pragma emptyDataSource Implementation

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"sourchimage"];
}
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
//    NSLog(@"%@",NSStringFromCGSize(self.frame.size));
//    NSLog(@"%f",SCREEN_WIDTH);
//    NSLog(@"%f",SCREEN_HEIGHT);
    return -SCREEN_HEIGHT/2 +64 +50;
}

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

#pragma mark - uitableView 代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_searchHistory&&_searchHistory.count>0) {
        return 2;
    }else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_searchHistory&&_searchHistory.count>0) {
        if (section == 0) {
            return 1;
        }else if (section == 1) {
            return _searchResult.count;
        }
    }else {
        return _searchResult.count;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_searchHistory&&_searchHistory.count>0) {
        if (indexPath.section == 0) {
            static searchHistoryTableViewCell *cell = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                cell = [tableView dequeueReusableCellWithIdentifier: searchHistory];
            });
            cell.searchHistory = _searchHistory;
            return [cell.contentView systemLayoutSizeFittingSize: UILayoutFittingCompressedSize].height;
        }else if (indexPath.section == 1) {
            return [tableView cellHeightForIndexPath:indexPath model:_searchResult[indexPath.row] keyPath:@"searchResult" cellClass:[searchResultTableViewCell class] contentViewWidth:SCREEN_WIDTH];
        }
    }else {
        return [tableView cellHeightForIndexPath:indexPath model:_searchResult[indexPath.row] keyPath:@"searchResult" cellClass:[searchResultTableViewCell class] contentViewWidth:SCREEN_WIDTH];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_searchHistory&&_searchHistory.count>0) {
        if (indexPath.section == 0) {
            searchHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchHistory];
            cell.searchHistory = _searchHistory;
            cell.delegate = self;
            return cell;
        }else if (indexPath.section == 1) {
            searchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchResult];
            cell.searchResult = _searchResult[indexPath.row];
            return cell;
        }
    }else {
        searchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:searchResult];
        cell.searchResult = _searchResult[indexPath.row];
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (_searchHistory&&_searchHistory.count>0) {
        if (indexPath.section == 0) {
            
        }else {
            if (self.selectdCustomer) {
                self.selectdCustomer(_searchResult[indexPath.row]);
            }
        }
    }else {
        if (self.selectdCustomer) {
            self.selectdCustomer(_searchResult[indexPath.row]);
        }
    }
}

#pragma  mark - historyDelegate

- (void)clearAllHistory {
    self.searchHistory = [searchHistoryManage clearAllHistory];
    [self reloadData];
}

- (void)selectdSearchHistory:(NSString *)history {
    if (self.didTapSearchString) {
        self.didTapSearchString(history);
    }
}

@end


