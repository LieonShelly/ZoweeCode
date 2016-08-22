//
//  ZESingleDetail.h
//  ZoweeSale
//
//  Created by apple on 16/6/14.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZESingleDetail : NSObject

/**
 *
 ContractSelfNo	String	合同自编号
 */
@property (nonatomic ,copy) NSString * ContractSelfNo;
/**
 *  ContractNo NSString  合同号
 */
@property(nonatomic,copy)NSString * ContractNo;
/**
 *
 CustomerName	String	客户名称
 */
@property (nonatomic ,copy) NSString * CustomerName;
/**
 *
 Amount	Double	每笔金额
 */
@property (nonatomic ,strong) NSNumber * Amount;
/**
 *
 AccTime	Date	过账日期	如：2015-09-17 15:59:05
 */
@property (nonatomic ,copy) NSString * AccTime;
/**
 *  DetailNo String 充扣编号
 */
@property(nonatomic,copy)NSString *DetailNo;
/**
 *  ShopName  String  店名
 */
@property(nonatomic,copy)NSString *ShopName;
/**
 *  PaymentsTitle    String 收支类型
 */
@property(nonatomic,copy)NSString *PaymentsTitle;
/**
 *  SubjectTitle String  科目名称
 */
@property(nonatomic,copy)NSString *SubjectTitle;
/**
 *  Remark String 备注
 */
@property(nonatomic,copy)NSString *Remark;
@end
