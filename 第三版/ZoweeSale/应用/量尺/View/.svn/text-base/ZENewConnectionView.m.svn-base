//
//  ZENewConnectionView.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZENewConnectionView.h"
#import "ZENewConnectionViewController.h"
#import "homeDesigeNavigationController.h"
#import "HZURLNavigation.h"
#import "ZEHomeDesigeViewController.h"

@implementation ZENewConnectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)init{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.windowLevel = UIWindowLevelAlert;
    //self.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    ZENewConnectionViewController *controller = [[ZENewConnectionViewController alloc]init];
    homeDesigeNavigationController *navigation = [[homeDesigeNavigationController alloc]initWithRootViewController:controller];
    self.rootViewController = navigation;
    
}
- (void)show{
    [self makeKeyAndVisible];
   // self.hidden = NO;
}

- (void)hidden {
    [self resignKeyWindow];
    self.hidden = YES;
}
- (void)push:(NSNumber *)orderID customerName:(NSString *)name{
    [self hidden];
    ZEHomeDesigeViewController *controller = [[UIStoryboard storyboardWithName:@"Application" bundle:nil] instantiateViewControllerWithIdentifier:@"newBulidHomeDesign"];
    ZEDesigeMission *mission = [[ZEDesigeMission alloc]init];
    mission.OrderID = orderID;
    mission.CustomerName = name;
    controller.mission = mission;
    [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
}
@end
