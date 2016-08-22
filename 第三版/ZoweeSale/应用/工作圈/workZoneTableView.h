//
//  workZoneTableView.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "workZoneTableViewCell.h"
#import "MJRefresh.h"

@interface workZoneTableView : UITableView

@property (nonatomic) NSMutableArray *workZoneArray;

@property (nonatomic ,weak) UIViewController<TYAttributedLabelDelegate> *controller;

@end
