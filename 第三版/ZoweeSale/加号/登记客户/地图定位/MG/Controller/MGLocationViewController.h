//
//  MGLocationViewController.h
//  ZoweeSale
//
//  Created by wanglj on 16/4/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGLocation.h"
#import "MGLocationTabView.h"

@protocol MGLocationDelegate <NSObject>

- (void) selectMGLocation:(MGLocation *)location;

@end

@interface MGLocationViewController : UIViewController

@property (nonatomic,strong) MGLocationTabView *tabView;

@property (nonatomic,weak)id<MGLocationDelegate>delegate;

@end
