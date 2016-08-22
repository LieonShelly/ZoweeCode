//
//  customerManager.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "THNetWork.h"
#import "choAllModel.h"
#import "MGLocation.h"
#import "orderAppointment.h"

@interface customerManager : NSObject

+ (instancetype)sharecustomerInstance;


/**
 *  登记客户
 *
 *  @param controller 请求界面
 *  @param parm       请求参数
 *  @param block      请求返回
 */
- (void)addCustomerWithController:(UIViewController *)controller parmaDic:(NSDictionary *)parm block:(void(^)(THNetWorkError *error,NSNumber *customerID))block;

/**
 *  客户来源
 *
 *  @param controller 请求界面
 *  @param block      返回结果
 */
- (void)loadCustomerSourceWithController:(UIViewController *)controller  block:(void(^)(THNetWorkError *error,NSArray *Sources))block;

/**
 *  登记客户接待人
 *
 *  @param controller 请求页面
 *  @param block      返回结果
 */
- (void)loadGuidListWithController:(UIViewController *)controller block:(void(^)(THNetWorkError *error,NSArray *guidS))block;

/**
 *  获取 客户来源,接待人,装饰公司,设计人员列表
 *
 *  @param controller 请求界面
 *  @param dic        参数
 *  @param block      返回
 */
- (void)loadAllListWithController:(UIViewController *)controller typeDIc:(NSDictionary *)dic block:(void(^)(THNetWorkError *error,NSArray *allArray))block;
/**
 *  玛格搜索楼盘地址
 *
 *  @param controller 请求
 *  @param key        关键字
 *  @param block      返回
 */
- (void)searchAddressWithController:(UIViewController *)controller searchKey:(NSString *)key block:(void(^)(THNetWorkError *error,NSArray *searchs))block;
///**
// *  获取客户列表
// *
// *  @param sortType 排序方法
// *  @param block    返回结果
// */
//- (void)getCustomerListWithSortType:(NSNumber *)sortType block:(void(^)(THNetWorkError *error,NSArray *customerList))block;
/**
 *  交付定金提交
 *
 *  @param ordre 接口数据
 *  @param block 返回
 */
- (void)DeliveryDepositWith:(orderAppointment *)ordre Block:(void(^)(THNetWorkError *error))block;
/**
 *  获取订单编号
 *
 *  @param block 返回
 */
- (void)getOrderNoBlock:(void(^)(THNetWorkError *error,NSString *orderID))block;

///**
// *  各种客户列表
// *
// *  @param interface 接口名
// *  @param block     返回结果
// */
//- (void)allCustomerListWithActivate:(NSString *)interface WithBlock:(void(^)(THNetWorkError *error,NSArray *customers))block;
/**
 *  出图完成
 *
 *  @param parm  参数
 *  @param block 返回
 */
- (void)FigureOutWithPrame:(NSDictionary *)parme Block:(void(^)(THNetWorkError *error))block;
/**
 *  所有审核
 *
 *  @param prame     参数
 *  @param interface 接口名
 *  @param block     返回
 */
- (void)allReviewWithPrame:(NSDictionary *)prame interface:(NSString *)interface Block:(void(^)(THNetWorkError *error))block;

/**
 *  签订合同
 *
 *  @param parm  参数
 *  @param block 返回
 */
- (void)OrderContractWithParm:(NSDictionary *)parm Block:(void(^)(THNetWorkError *error))block;

/**
 *  客户流失
 *
 *  @param parm  请求参数
 *  @param block 返回
 */

- (void)customerLossWithParm:(NSDictionary *)parm Block:(void(^)(THNetWorkError *error))block;
/**
 *  凭证类型列表
 *
 *  @param block <#block description#>
 */
- (void)GetVoucherTypeWithBlock:(void(^)(THNetWorkError *error,NSArray *array))block;

@end
