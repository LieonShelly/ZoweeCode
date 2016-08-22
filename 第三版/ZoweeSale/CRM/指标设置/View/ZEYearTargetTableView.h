//
//  ZEYearTargetTableView.h
//  ZoweeSale
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THTableView.h"
#import "ZEYearTarget.h"
@interface ZEYearTargetTableView : THTableView
@property(nonatomic,strong)ZEYearTarget * model;
@property(nonatomic,strong)NSMutableArray * dataArray;
@end
