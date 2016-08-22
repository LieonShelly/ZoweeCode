//
//  ZECustomerActivity.h
//  ZoweeSale
//
//  Created by apple on 16/3/8.
//  Copyright © 2016年 TH. All rights reserved.
// 客户动态模型

#import <Foundation/Foundation.h>

@interface ZECustomerActivity : NSObject

/**  String 事项名称 */
@property(nonatomic,copy) NSString * TypeName;
/** 完成状态 0 未完成 1 已完成 */
@property(nonatomic,assign) NSInteger State;
/**  跟进日期 如：2015-09-17 15:59:05 */
@property(nonatomic,copy) NSString * FinishDate;
@end
