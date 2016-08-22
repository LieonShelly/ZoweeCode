//
//  ZESendRulerTask.h
//  ZoweeSale
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 TH. All rights reserved.
//   量尺任务模型

#import <Foundation/Foundation.h>

@interface ZESendRulerTask : NSObject
/**
 *
 
 DesignerName	String	 设计师名
 */
@property(nonatomic,copy) NSString * DesignerName;

/**
 *   CustomerName	Strin客户姓名
 */
@property(nonatomic,copy) NSString * CustomerName;

/**
 *
Address	String	  客户地址
 */
@property(nonatomic,copy) NSString * Address;
/**
 *
 
 State	Int	任务状态	0未开始，1进行中，2已完成，3已取消，4已过期
 */
@property (nonatomic,assign) NSInteger State;


@end
