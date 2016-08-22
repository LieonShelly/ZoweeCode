//
//  ZECustomerActivityCell.h
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZECustomerActivity.h"

@interface ZECustomerActivityCell : UITableViewCell

@property(nonatomic,strong) ZECustomerActivity * activity;

@property(nonatomic) BOOL firstRow;
@property(nonatomic) BOOL lastRow;
@property(nonatomic) BOOL onlyOneRow;

@end
