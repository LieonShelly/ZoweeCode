//
//  ZESendRulerTaskResult.h
//  ZoweeSale
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 TH. All rights reserved.
//  查看量尺任务列表返回结果

#import <Foundation/Foundation.h>


@interface ZESendRulerTaskResult : NSObject
/**
 *
 FinshNum	Int 完成的数量
 */
@property (nonatomic,assign) NSInteger FinshNum;
/**
 *
 Sum	Int	  总任务数
 */
@property (nonatomic,assign) NSInteger  Sum;
/**
 *
 NoFinsh	Int	未完成的任务数量
 */
@property (nonatomic,assign) NSInteger  NoFinsh;
/**
 *
 TaskList	Object任务列表
 */
@property (nonatomic,strong) NSArray * TaskList;


@end
