//
//  ZEAnimator.h
//  ZoweeSale
//
//  Created by apple on 16/5/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZEAnimator : NSObject<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>
/**
 *  视图的大小
 */
@property(nonatomic,assign)CGRect presentFrame;

@end
