//
//  THTableView.h
//  ZoweeSale
//
//  Created by wanglj on 16/5/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZSTableViewModel.h"
#import "HZURLNavigation.h"
@interface THTableView : UITableView
@property (nonatomic) YZSTableViewModel *viewModel;

@property (nonatomic) NSString *cellStr;

/**
 *  子类继承
 */
- (void)setupAfter;
@end
