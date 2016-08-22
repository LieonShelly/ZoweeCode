//
//  ZECRMCUstomerTableViewCell.h
//  ZoweeSale
//
//  Created by wanglj on 16/5/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntentionEntityClass.h"
#import "customerSort.h"

@interface ZECRMCUstomerTableViewCell : UITableViewCell

@property (nonatomic) IntentionEntityClass *customer;

@property (nonatomic,assign) customersSort sortType;

@property (nonatomic,assign) BOOL enableSider;

@end
