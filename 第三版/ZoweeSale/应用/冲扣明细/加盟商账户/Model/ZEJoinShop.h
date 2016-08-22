//
//  ZEJoinShop.h
//  ZoweeSale
//
//  Created by lieon on 16/6/13.
//  Copyright © 2016年 TH. All rights reserved.
//  门店模型

#import <Foundation/Foundation.h>

@interface ZEJoinShop : NSObject

/**
 *  JoinShopID	Int	门店id
 */
@property (nonatomic ,strong) NSNumber * JoinShopID;

/**
 *   JoinShopName	String	门店名称
 */


@property (nonatomic ,copy) NSString *  JoinShopName;

@end
