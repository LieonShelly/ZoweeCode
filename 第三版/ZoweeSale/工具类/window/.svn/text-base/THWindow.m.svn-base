//
//  THWindow.m
//  iPadMG
//
//  Created by wanglj on 15/11/19.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import "THWindow.h"

@implementation THWindow

- (instancetype)init
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        [self uiInit];
    }
    return self;
}

//+ (instancetype)THWindowWithRootController:(UIViewController *)rootController
//{
//    id thWindow = [[[self class] alloc]init];
//    thWindow.windowLevel = UIWindowLevelAlert;
//    thWindow.rootViewController = rootController;
//    
//    return thWindow;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)uiInit
{
    
}

- (void)show
{
    [self makeKeyWindow];
    self.hidden = NO;
}

- (void)flnish
{
    [self resignKeyWindow];
    self.hidden = YES;
}

@end
