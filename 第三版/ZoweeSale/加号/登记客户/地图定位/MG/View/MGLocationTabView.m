//
//  MGLocationTabView.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "MGLocationTabView.h"
#import "MGLoationTableViewCell.h"
#import "searchHistoryTableViewCell.h"
#import "HZURLNavigation.h"

@interface MGLocationSearchHistory : NSObject

+ (NSArray *)insertHistory:(NSString *)searchStr;

+ (NSArray *)clearAllHistory;

+ (NSArray *)allHistory;

@end

@implementation MGLocationSearchHistory
static NSString *key = @"MGLocationSearchHistory";

+ (NSArray *)allHistory {
    NSArray *histoty = [[NSUserDefaults standardUserDefaults]objectForKey:key];
    if (!histoty) {
        histoty = [NSArray array];
    }
    return histoty;
}

+ (NSArray *)insertHistory:(NSString *)searchStr {
    NSMutableArray *history =  [NSMutableArray arrayWithArray:[self allHistory]];
    for (NSString *Str in history) {
        if ([Str isEqualToString:searchStr]) {
            [history removeObject:Str];
            break;
        }
    }
    [history insertObject:searchStr atIndex:0];
    [[NSUserDefaults standardUserDefaults] setObject:history forKey:key];
    return history;
}

+ (NSArray *)clearAllHistory {
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:key];
    return [NSArray array];
}

@end



@interface MGLocationTabView ()<UITableViewDelegate,UITableViewDataSource,searchHistoryDelegate>


@end

@implementation MGLocationTabView
static NSString *identifer = @"cell";
static NSString *history = @"searchHistoryTableViewCell";
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
        [self setup];
        [self searchLocation:@""];
    }
    return self;
}

- (void)setSearchArray:(NSArray *)searchArray {
    _searchArray = searchArray;
    [self reloadData];
}

- (void)setup {
    UIImageView *back = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image_map"]];
    self.backgroundColor = hexColorString(@"F5F3F3");
    back.contentMode = UIViewContentModeCenter;
    self.backgroundView = back;
    self.tableFooterView = [UIView new];
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[MGLoationTableViewCell class] forCellReuseIdentifier:identifer];
    [self registerNib:[UINib nibWithNibName:history bundle:nil] forCellReuseIdentifier:history];
    _HistoryArray = [MGLocationSearchHistory allHistory];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_HistoryArray.isNoEmpty) {
        if (indexPath.section == 0) {
            static searchHistoryTableViewCell *cell = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                cell = [tableView dequeueReusableCellWithIdentifier: history];
            });
            cell.searchHistory = _HistoryArray;
            return [cell.contentView systemLayoutSizeFittingSize: UILayoutFittingCompressedSize].height;
        }
    }
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_HistoryArray.isNoEmpty) {
        return 2;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_HistoryArray.isNoEmpty) {
        if (section == 0) {
            return 1;
        }
    }
    return _searchArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_HistoryArray.isNoEmpty) {
        if (indexPath.section == 0) {
            searchHistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:history];
            cell.searchHistory = _HistoryArray;
            cell.delegate = self;
            return cell;
        }
    }
    MGLoationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    cell.Location = _searchArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_HistoryArray.isNoEmpty) {
        if (indexPath.section == 0) {
            return;
        }
    }
    _block(_searchArray[indexPath.row]);
    [[HZURLNavigation currentViewController] dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 历史记录

- (void)clearAllHistory {
   _HistoryArray = [MGLocationSearchHistory clearAllHistory];
    [self reloadData];
}

- (void)selectdSearchHistory:(NSString *)history {
    [self searchLocation:history];
}

- (void)searchLocation:(NSString *)key {
    
    [[customerManager sharecustomerInstance] searchAddressWithController:[self viewController] searchKey:key block:^(THNetWorkError *error, NSArray *searchs) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
        }
        else{
            self.searchArray = [searchs copy];
            if (searchs.count == 0) {
                [[HZURLNavigation currentViewController] showToastWithMsg:@"未找到相关地址"];
            }
            if (key.isNoEmpty) {
                _HistoryArray = [MGLocationSearchHistory insertHistory:key];
            }
            [self reloadData];
        }
    }];
}


@end

