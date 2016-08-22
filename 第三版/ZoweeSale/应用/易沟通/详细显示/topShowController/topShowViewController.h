//
//  topShowViewController.h
//  iPadMG
//
//  Created by wanglj on 15/11/18.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol topShowDelegate <NSObject>

@required
- (void)finishAnimate;

- (void)slideproro:(CGFloat)pro;

@end

@interface topShowViewController : UIViewController

@property (nonatomic ,strong)NSNumber *planID;

@property (nonatomic ,weak)id<topShowDelegate> delegate;

@end
