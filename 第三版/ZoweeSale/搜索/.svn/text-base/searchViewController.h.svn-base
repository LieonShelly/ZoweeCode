//
//  searchViewController.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Models.h"

@protocol searchCustomerDelegate <NSObject>

- (void)choiceSearchCustomer:(searchResultModel *)model;

@end

@interface searchViewController : UIViewController

@property (nonatomic)UINavigationController *navcontroller;

@property (nonatomic,weak)id<searchCustomerDelegate>sdelegate;

@end
