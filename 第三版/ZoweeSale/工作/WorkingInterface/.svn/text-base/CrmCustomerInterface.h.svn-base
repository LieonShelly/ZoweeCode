//
//  CrmCustomerInterface.h
//  ZoweeSale
//
//  Created by apple on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "THNetWork.h"
#import "IntentionEntityClass.h"
#import "customerDetail.h"
#import "HZURLNavigation.h"
#import "customerSort.h"

@interface CrmCustomerInterface : NSObject
+ (instancetype)shareCrmCustomInstance;

/**
 *  客户详细信息
 *
 *  @param controller 请求界面
 *  @param ID         客户ID
 *  @param block      请求结果
 */
- (void)loadCustomerDetailInfoWithController:(UIViewController *)controller customerID:(NSNumber *)ID Block:(void(^)(THNetWorkError *error,customerDetail *detail))block;

/**
 *  意向客户
 *
 *  @param inerface 接口名
 *  @param type     排序类型
 *  @param sort     正反排序
 *  @param bolck    返回结果
 */- (void)loadAllCustomerListWithInterface:(NSString *)inerface  Type:(customersSort)type Sort:(sortDirectionType)sort Block:(void(^)(THNetWorkError * error,NSArray * array))bolck;

/**
 *  关注客户
 *
 *  @param orderID     客户的id
 *  @param IsAttention 是否已关注 0未,1已
 *  @param bolck       请求返回
 */
- (void)concernWithOrderID:(NSNumber *)orderID IsAttention:(NSNumber *)IsAttention Block:(void(^)(THNetWorkError * error))bolck;
/**
 *  流失客户
 *
 *  @param orderID 客户id
 *  @param bolck   请求返回
 */
- (void)LossCustomerWithOrderID:(NSNumber *)orderID Block:(void(^)(THNetWorkError * error))bolck;
/**
 *  天气获取
 *
 *  @param cityName 城市名
 *  @param bolck    请求结果
 */
- (void)GetWeatherWithcityName:(NSString *)cityName Block:(void(^)(THNetWorkError * error,NSString *weather))bolck;
/**
 *  客户附件列表
 *
 *  @param orderID 订单ID
 *  @param bolck   返回
 */
- (void)GetCustomerFileListWithOrderID:(NSNumber *)orderID Block:(void(^)(THNetWorkError * error,NSArray *fileArray))bolck;


@end
