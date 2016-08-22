//
//  UIViewController+showMsg.m
//  517TelMeeting
//
//  Created by yunsheng on 15/7/30.
//  Copyright (c) 2015年 517na. All rights reserved.
//

#import "UIViewController+showMsg.h"



@implementation UIViewController (showMsg)

-(void)showToastWithMsg:(NSString *)str
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = str;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES  afterDelay:1.0];
}

- (void)showToastWithMsg:(NSString *)str inView:(UIView *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = str;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:1.0];
}

- (void)showMBProgressWithMsg:(NSString *)msg {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo: self.view animated:YES];
    hud.label.text = msg;
    //hud.progressRemainingColor = [UIColor blackColor];
    
    hud.removeFromSuperViewOnHide = YES;
}

- (void)showLodingMBProgressWithMsg {
    [self showMBProgressWithMsg:@"正在加载..."];
}
- (void)showMBProgressIndeterminate {
    [MBProgressHUD showHUDAddedTo: self.view animated:YES];
}

- (void)hideAllProgress {
    [MBProgressHUD hideHUDForView: self.view animated:YES];
}

-(void)showAlertWithMsg:(NSString *)str
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}



@end
