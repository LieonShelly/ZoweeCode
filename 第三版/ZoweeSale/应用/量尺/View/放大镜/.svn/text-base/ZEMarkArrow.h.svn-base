//
//  ZEMarkArrow.h
//  ZoweeSale
//
//  Created by apple on 16/5/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZEMarkArrowModel.h"

@class ZEMarkArrow;
@protocol ZEMarkArrowDelgate <NSObject>

@optional
/**
 *  某个箭头给选中中
 */
- (void)markArrowDidSlected:(ZEMarkArrow*)markArrow ;

@end


@interface ZEMarkArrow : UIView

/**
 *   标注值
 */
@property(nonatomic,copy) NSString * markVaule;


@property(nonatomic,weak) id<ZEMarkArrowDelgate>  delegate;

/**
 *  箭头的数据模型
 */
@property (nonatomic,strong) ZEMarkArrowModel * arrowModel;


/**
 *  设置箭头的两个端点的位置
 */
- (void)markArrowStart:(CGPoint)s end:(CGPoint)e;

/**
 *  添加点击事件
 */
- (void)addTarget:(id)target action:(SEL)action;


- (void)normalArrow;
- (void)selelctArrow;
@end
