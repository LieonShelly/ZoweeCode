//
//  ZECRMCustomerTableView.h
//  ZoweeSale
//
//  Created by wanglj on 16/5/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "THTableView.h"
#import "ZECRMCUstomerTableViewCell.h"
#import "UIScrollView+EmptyDataSet.h"
typedef void(^customerSelectionBlock)(IntentionEntityClass *customer);

@interface ZECRMCustomerTableView : THTableView

@property (nonatomic) NSArray *customers;

@property (nonatomic,assign) customersSort sortType;

@property (nonatomic,copy)customerSelectionBlock selection;

@property (nonatomic,assign) BOOL enableSider;
/**
 *  没有客户是否提示
 */
@property (nonatomic,assign) BOOL isNoContentShow;

- (void)customrNameSort;

@end
