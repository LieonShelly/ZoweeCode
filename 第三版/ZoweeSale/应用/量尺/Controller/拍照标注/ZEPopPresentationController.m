//
//  ZEPopPresentationController.m
//  ZoweeSale
//
//  Created by apple on 16/5/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPopPresentationController.h"

@interface ZEPopPresentationController ()
@property (nonatomic,weak)  UIButton *cover;

@end
@implementation ZEPopPresentationController

/**
 *  初始化方法，用于创建转场动画的对象那
 */
- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeCover:) name:@"remindViewDidRemove" object:nil];
    return [ super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
}

/**
 *  即将布局子视图的时候调用
 */
-(void)containerViewWillLayoutSubviews
{
    self.presentedView.frame = self.presentFrame;
    // 向底部添加一蒙班
    UIButton * cover = [UIButton new];
    cover.frame = self.containerView.bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.6;
    [cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView insertSubview:cover atIndex:0];
    self.cover = cover;
}

- (void)coverClick
{
    [self.presentedViewController  dismissViewControllerAnimated:YES completion:nil];
}

- (void)changeCover:(NSNotification*)note
{
    NSNumber * al = note.userInfo[@"coverAlpha"];
    self.cover.alpha = al.doubleValue;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
