//
//  ZEDetaileTableViewController.h
//  ZoweeSale
//
//  Created by wanglj on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZEDetaileTableViewController : UIViewController

@property (nonatomic,strong) NSArray *dataSource;

- (void)reloadDataWithDataSource:(NSArray*)dataSource;

@end
