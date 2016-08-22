//
//  ZELoadFollowTypeViewController.h
//  ZoweeSale
//
//  Created by apple on 16/3/11.
//  Copyright © 2016年 TH. All rights reserved.
//


#import "ZELoadFollowType.h"

@class ZELoadFollowTypeViewController;
@protocol ZELoadFollowTypeViewControllerDelegate <NSObject>
@optional
- (void)loadFollowTypeViewController:(ZELoadFollowTypeViewController*)controller DidSelectedType:(ZELoadFollowType*)type;

@end

@interface ZELoadFollowTypeViewController : UIViewController
@property(nonatomic,strong) NSArray * followTypes;
@property (nonatomic,weak) id delegate;
@end
