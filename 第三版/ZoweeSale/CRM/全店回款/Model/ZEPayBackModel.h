//
//  ZEPayBackModel.h
//  ZoweeSale
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZEPayBackModel : NSObject
/**
 *  sumDeal    Double   当月成交额
 */
@property(nonatomic,strong)NSNumber * sumDeal;
/**
 *  TargetMoney    Double   目标额
 */
@property(nonatomic,strong)NSNumber * TargetMoney;
/**
 *  HuiKuan    Double   当月实际收款额
 */
@property(nonatomic,strong)NSNumber * HuiKuan;
@end
