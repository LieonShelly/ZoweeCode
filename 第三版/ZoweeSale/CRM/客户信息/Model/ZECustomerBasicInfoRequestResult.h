//
//  ZECustomerBasicInfoRequestResult.h
//  ZoweeSale
//
//  Created by apple on 16/3/10.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZECustomerBasicInfoRequestResult : NSObject
/** 存放跟进情况模型 */
@property (nonatomic,strong) NSDictionary * ReturnParList;
/** 返回结果的状态码*/
@property(nonatomic,assign) NSInteger Result;
@end
