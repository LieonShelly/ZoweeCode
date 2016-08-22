//
//  WorkZoneViewModel.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "workZoneModel.h"

@interface WorkZoneViewModel : NSObject
/**
 *  数据model
 */
@property (nonatomic )workZoneModel *zoneModel;
/**
 *  是否有任务进度显示视图
 */
@property (assign, getter=isWorkProcess)BOOL process;
/**
 *  是否有执行信息视图
 */
@property (assign, getter=isExecution)BOOL execution;
/**
 *  是否有完成按钮
 */
@property (assign, getter=isCanFinish)BOOL canFinish;

/**
 *  初始方法
 *
 *  @param zoneModel 数据model
 *  @param pro       pro
 *  @param execution exe
 *  @param canFinish can
 *
 *  @return viewModel
 */
- (instancetype)initWithZoneModel:(workZoneModel *)zoneModel Process:(BOOL)pro Execution:(BOOL)execution CanFinish:(BOOL)canFinish;

@end
