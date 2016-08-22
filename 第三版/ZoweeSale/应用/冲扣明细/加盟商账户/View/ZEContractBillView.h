//
//  ZEContractBillView.h
//  ZoweeSale
//
//  Created by lieon on 16/6/13.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIScrollView+EmptyDataSet.h"

@class ZEContractBillView;

@protocol ZEContractBillViewDelegate <NSObject>

@optional
- (void)contractBillView:(ZEContractBillView*)contractBillView DidSelectedCellModel:(id)model;


@end

@interface ZEContractBillView : UITableView

@property (nonatomic,weak)  id<ZEContractBillViewDelegate> contractBillViewDelegate;

@property (nonatomic ,strong) NSArray * dataArray;

@end
