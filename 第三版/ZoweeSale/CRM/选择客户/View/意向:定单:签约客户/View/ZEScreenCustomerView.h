//
//  ZEScreenCustomerView.h
//  ZoweeSale
//
//  Created by wanglj on 16/5/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customerSort.h"

@protocol screenViewSelectdDelegate <NSObject>

- (void)screenSortType:(customersSort)type opposite:(sortDirectionType)sort;

@end


@interface ZEScreenCustomerView : UIView

@property (nonatomic,weak)id<screenViewSelectdDelegate>screenDelegate;
/**
 *  一栏的高度
 */
@property (nonatomic,assign) CGFloat itemHeight;
/**
 *  排序方式数组
 */
@property (nonatomic) NSMutableArray *sortTypeArray;
/**
 *  客户排序方法
 *
 *  @return 默认排序
 */
- (customersSort)getFirstCustomerSortType;
/**
 *  排序方向
 *
 *  @return 默认排序方向
 */
- (sortDirectionType)getFirstDirectionType;

@property (nonatomic) UIButton *rightBtn;

@end

@interface sortType : NSObject

@property (nonatomic)NSString *typeName;

@property (nonatomic)customersSort typeNum;

- (instancetype)initWithtype:(NSString *)typeName num:(customersSort )typeNum;

@end
