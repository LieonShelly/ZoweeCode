//
//  customerInfoTableViewCell.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/8.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customerinfoModel.h"
#import "ZECustomerDetailCell.h"

@interface customerInfoTableViewCell : ZECustomerDetailCell
@property (nonatomic ,strong)customerinfoModel *model;

@end
