//
//  ZECRMTableView.h
//  ZoweeSale
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THTableView.h"
#import "ZEStatisticsModel.h"
@interface ZECRMTableView : THTableView
@property(nonatomic,strong)ZEStatisticsModel * shopModel;
@property(nonatomic,strong)ZEStatisticsModel * personalModel;
@end
