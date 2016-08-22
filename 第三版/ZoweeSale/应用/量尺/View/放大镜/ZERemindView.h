//
//  ZERemindView.h
//  ZoweeSale
//
//  Created by lieon on 16/7/4.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+TYAlertView.h"

#import "ZEDetailModelGroup.h"

@protocol  ZERemindViewDelegate<NSObject>

@optional
- (void)remindViewDidClickCloseBtn;

@end

@interface ZERemindView : UIView

@property (nonatomic,weak)  id<ZERemindViewDelegate> delegate;

@end
