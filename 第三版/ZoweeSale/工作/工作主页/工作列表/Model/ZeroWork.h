//
//  ZeroWork.h
//  ZoweeSale
//
//  Created by wanglj on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZeroWork : NSObject
/**
 *  头像URL
 */
@property (nonatomic ,strong)NSString *HeadUrl;
/**
 *  任务所属人名称
 */
@property (nonatomic ,strong)NSString *UserName;
/**
 *  发布时间 如：2015-09-17 15:59:05
 */
@property (nonatomic ,strong)NSString *PublishTime;
/**
 *  发布尾巴
 */
@property (nonatomic ,strong)NSString *PublishTag;
/**
 *  标题
 */
@property (nonatomic ,strong)NSString *Title;
/**
 *  内容摘要
 */
@property (nonatomic ,strong)NSString *Content;
/**
 *  执行人名称列表
 */
@property (nonatomic ,strong)NSString *ExecutorNameList;
/**
 *  执行时间
 */
@property (nonatomic ,strong)NSString *ExecuteTime;
/**
 *  状态
 */
@property (nonatomic ,strong)NSNumber *State;
/**
 *  任务执行总人数
 */
@property (nonatomic ,strong)NSNumber *ExecutorNumber;
/**
 *  任务完成总人数
 */
@property (nonatomic ,strong)NSNumber *FinishNumber;
/**
 *  客户名称
 */
@property (nonatomic ,strong)NSString *CustomerName;
/**
 *  客户ID
 */
@property (nonatomic ,strong)NSNumber *CustomerID;
/**
 *  任务ID
 */
@property (nonatomic ,strong)NSNumber *TaskID;
/**
 *  任务类型ID
 */
@property (nonatomic ,strong)NSNumber *TaskTypeID;
/**
 *  坐标点x
 */
@property (nonatomic) NSNumber *PointX;
/**
 *  坐标点Y
 */
@property (nonatomic) NSNumber *PointY;
@end
