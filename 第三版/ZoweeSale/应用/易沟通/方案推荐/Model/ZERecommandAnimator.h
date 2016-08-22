//
//  ZERecommandAnimator.h
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZERecommandAnimator : NSObject<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>
/**
 *  视图的大小
 */
@property(nonatomic,assign)CGRect presentFrame;


@end
