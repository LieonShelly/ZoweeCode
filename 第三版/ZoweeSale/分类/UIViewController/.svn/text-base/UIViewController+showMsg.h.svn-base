//
//  UIViewController+showMsg.h
//  517TelMeeting
//
//  Created by yunsheng on 15/7/30.
//  Copyright (c) 2015年 517na. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
/**
 *  视图控制器类别-显示信息
 */
@interface UIViewController (showMsg)

/**
 *  用MBProgress展示信息
 *
 *  @param str 信息
 */
-(void)showToastWithMsg:(NSString *)str;
/**
 *  用MBProgress展示信息
 *
 *  @param str 信息
 */
- (void)showToastWithMsg:(NSString *)str inView:(UIView *)view;

/**
 *  loding 提示
 *
 *  @param msg 提示信息
 */
- (void)showMBProgressWithMsg:(NSString *)msg;

/**
 *  提示正在加载...
 */
- (void)showLodingMBProgressWithMsg;

/**
 *  没有提示内容
 */
- (void)showMBProgressIndeterminate;

/**
 *  隐藏所有MBProgress
 */
- (void)hideAllProgress;
/**
 *  用对话框展示信息
 *
 *  @param str 信息
 */
-(void)showAlertWithMsg:(NSString *)str;

@end
