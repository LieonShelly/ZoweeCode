//
//  ZEAccountBalance.h
//  ZoweeSale
//
//  Created by lieon on 16/6/13.
//  Copyright © 2016年 TH. All rights reserved.
//  充扣明细模型

#import <Foundation/Foundation.h>

@interface ZEAccountBalance : NSObject

/**
 *
 Double	当前余额
 */
@property (nonatomic ,strong) NSNumber * Blance;

/**
 *   Double	允许透支金额
 */
@property (nonatomic ,strong) NSNumber * OverDraftPrice;

@end
