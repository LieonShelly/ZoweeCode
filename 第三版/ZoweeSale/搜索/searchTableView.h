//
//  searchTableView.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"
#import "Models.h"

@interface searchTableView : UITableView

@property (nonatomic)NSArray *searchHistory;

@property (nonatomic)NSArray *searchResult;

@property (copy, nonatomic) void (^didTapSearchString)(NSString * search);

@property (copy,nonatomic) void (^selectdCustomer)(searchResultModel *customer);

@end

