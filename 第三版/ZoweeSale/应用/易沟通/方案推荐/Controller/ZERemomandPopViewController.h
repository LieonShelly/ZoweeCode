//
//  ZERemomandPopViewController.h
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZEHomeBaseViewController.h"

@protocol ZERemomandPopViewControllerDelegate <NSObject>

@optional

- (void)recommandPopViewControllerDidSlectedModel:(id)model;


@end
@interface ZERemomandPopViewController : ZEHomeBaseViewController

@property (nonatomic ,strong) NSArray *dataArray;
@property (nonatomic ,copy) NSString * name;
@property (nonatomic,weak)  id<ZERemomandPopViewControllerDelegate> delegate;

@end
