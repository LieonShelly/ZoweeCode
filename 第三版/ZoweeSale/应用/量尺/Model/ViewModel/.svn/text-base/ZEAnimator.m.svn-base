//
//  ZEAnimator.m
//  ZoweeSale
//
//  Created by apple on 16/5/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAnimator.h"
#import "ZEPopPresentationController.h"

@implementation ZEAnimator
{
    BOOL isPresent;
}
  // 实现代理方法，告诉系统谁来实现转场动画
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    ZEPopPresentationController * pc = [[ZEPopPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    pc.presentFrame = self.presentFrame;
    return pc;
}

/**
 *  告诉系统谁来负责Modal展现的动画
 */

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    isPresent = YES;
    return self;
}

/**
 *  告诉系统谁来负责modal消失的动画
 */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    isPresent = NO;
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
/**
 *  返回动画时长，
 *
 *  @param UIViewControllerContextTransitioning? 上下文，里面保存了所有的参数
 *
 */

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

/**
 *  告诉系统如何动画
 *
 *  @param UIViewControllerContextTransitioning 上下文，里面保存了所有的参数
 *
 *
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (isPresent)
    {
        // 1. 拿到展现的视图
        UIView* toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        
        toView.transform = CGAffineTransformMakeScale(1.0, 0);
        
        // 注意一定要将视图添加到容器视图中
        [transitionContext.containerView addSubview:toView];
        
        // 设置锚点
        toView.layer.anchorPoint = CGPointMake(0.5, 0);
        
        //2.执行动画
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext ]animations:^{
            toView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            //2.2动画执行完毕一定要告诉系统
            [transitionContext completeTransition:YES];
        }];
    }else{
        // 关闭
        UIView  * fromeView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext ]animations:^{
            fromeView.transform = CGAffineTransformMakeScale(1.0, 0.00001);
            
        } completion:^(BOOL finished) {
            //2.2动画执行完毕一定要告诉系统
            [transitionContext completeTransition:YES];
        }];
        
        
    }

}
@end
