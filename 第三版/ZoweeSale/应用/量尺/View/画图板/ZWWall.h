//
//  ZWWall.h
//  easyMeasure
//
//  Created by wanglj on 16/4/6.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,HomeDesignWallDirection){
    HomeDesignWallTop = 0,
    HomeDesignWallLeft,
    HomeDesignWallDown,
    HomeDesignWallRight
};

@interface ZWWall :UIButton


/**
 *  点击触发事件
 */
@property (nonatomic ,strong) void(^touchup)(ZWWall *sender);
/**
 *  是否可以拖动 默认可以
 */
@property (nonatomic, assign) BOOL isDraging;

@end
