//
//  JPushMeessage.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/15.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JPushMeessage : NSObject
/**
 *  0任务通知 1公告通知 2客户动态通知
 */
@property (nonatomic ,strong)NSNumber *TypeID;
/**
 *  模块名称 8:设计师派尺 2:初尺
 */
@property (nonatomic ,strong)NSString *ModuleName;
/**
 *  0 任务通知的时候 这个参数 返回 任务ID，点击切换到任务详情界面
 1 公告通知的时候，直接切换到公告列表，没有参数值
 2 客户动态通知的时候，返回客户ID ，切换到 客户详情下面的客户动态页面
 */
@property (nonatomic ,strong)NSString *Param1;
/**
 *  0 任务通知的时候 传任务类型ID
 */
@property (nonatomic ,strong)NSString *Param2;

@property (nonatomic ,strong)NSString *Param3;
@end
