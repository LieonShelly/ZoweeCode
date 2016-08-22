//
//  ZEGrabCustomerResult.h
//  ZoweeSale
//
//  Created by wanglj on 16/6/20.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, customerGrabState) {
    customerGrabStateInvalid = 0,//抢单失败
    customerGrabStateEffective = 1,//抢单成功
};

@interface ZEGrabCustomerResult : NSObject

@property (nonatomic, copy) NSString *CustomerName;

@property (nonatomic, copy) NSString *CustomerID;

@property (nonatomic, copy) NSString *Address;

@property (nonatomic, assign) customerGrabState State;

@property (nonatomic, strong) NSNumber *PointX;

@property (nonatomic, strong) NSNumber *PointY;

@property (nonatomic, strong) NSNumber *UserID;

@property (nonatomic, copy) NSString *strTS;

@property (nonatomic ,copy) NSString *Mobile;

@end
