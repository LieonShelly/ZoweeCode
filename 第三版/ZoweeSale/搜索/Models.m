//
//  Models.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "Models.h"

@implementation searchResultModel



@end

static NSString *key = @"searchHistoryManage";
@implementation searchHistoryManage

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