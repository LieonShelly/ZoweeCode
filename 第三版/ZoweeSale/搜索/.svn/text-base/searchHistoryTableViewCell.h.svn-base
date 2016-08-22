//
//  searchHistoryTableViewCell.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol searchHistoryDelegate <NSObject>

- (void)clearAllHistory;

- (void)selectdSearchHistory:(NSString *)history;

@end


@interface searchHistoryTableViewCell : UITableViewCell


@property (nonatomic) NSArray *searchHistory;

@property (nonatomic ,weak)id<searchHistoryDelegate>delegate;

@end


