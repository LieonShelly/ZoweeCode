//
//  ZEArrangeTableView.h
//  ZoweeSale
//
//  Created by wanglj on 16/5/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THTableView.h"

@interface arrangeMent :NSObject
/**
 *  设计师ID
 */
@property (nonatomic) NSNumber *DesignerID;
/**
 *  订单ID
 */
@property (nonatomic) NSNumber *OrderId;
/**
 *  执行时间
 */
@property (nonatomic) NSString *MeasureDate;

/**
 *  设计师名,显示不用上传
 */
@property (nonatomic) NSString *desigerName;
/**
 *  客户姓名.显示不用上传
 */
@property (nonatomic) NSString *customerName;

- (NSString *)entityisNoEmpty;

@end

@interface ZEArrangeTableView : THTableView

@property (nonatomic) arrangeMent *ment;


@end
