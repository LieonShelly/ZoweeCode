//
//  topShowView.m
//  iPadMG
//
//  Created by wanglj on 15/11/17.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import "topShowView.h"
#import "topShowViewController.h"
@interface topShowView ()<topShowDelegate>

@property (nonatomic ,strong)topShowViewController *controller;

@end

@implementation topShowView

- (void) uiInit
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    NSLog(@"%@", NSStringFromCGRect(self.frame));
    self.windowLevel = UIWindowLevelAlert;
    _controller = [[topShowViewController alloc]init];
    _controller.delegate =self;
    self.rootViewController = _controller;
}

- (void)finishAnimate
{
    [self flnish];
}
- (void)slideproro:(CGFloat)pro
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5 * pro];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setPlanID:(NSNumber *)planID {
    _planID = planID;
    _controller.planID = planID;
}

@end
