//
//  ZEcustomerDetailTableView.h
//  ZoweeSale
//
//  Created by wanglj on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "THTableView.h"
#import "customerDetail.h"
#import "customerinfoModel.h"
@interface ZEcustomerDetailTableView : THTableView

@property (nonatomic ,copy)customerDetail *detail;

@property (nonatomic ,strong)customerinfoModel *model;

@end
