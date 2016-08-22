//
//  ZECustomerBaseInfo.h
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZECustomerBaseInfo : NSObject

/** CustomerIDInteger登记客户ID */
@property(nonatomic,assign) NSInteger CustomerID;

/**  String客户姓名 ,本地需要验证非空*/
@property(nonatomic,copy) NSString * CustomerName;


/** Integer省ID 本地验证非0 */
@property(nonatomic,assign) NSInteger ProvinceID;

/** Integer 城市ID 本地验证非0 */
@property(nonatomic,assign) NSInteger CityID;

/** Integer 区ID 没有的情况下存0 */
@property(nonatomic,assign) NSInteger CountyID;

/** 地址 本地验证非空 */
@property(nonatomic,copy) NSString * Address;

/** double 坐标点X 默认值 0*/
@property(nonatomic,assign) double PointX ;
/** double 坐标点Y 默认值 0 */
@property(nonatomic,assign) double PointY;

/** 门牌号 可以为空 */
@property(nonatomic,copy) NSString * HouseNumber;

/** String 电话 本地验证基本格式 */
@property(nonatomic,copy) NSString * Mobile;

/**   Integer 接待人ID可以不选(没有的情况下传0)*/
@property(nonatomic,assign) NSInteger GuideID;
/**  String 接待人名称 */
@property(nonatomic,copy) NSString * GuideName;

/**  Integer 客户来源ID*/
@property(nonatomic,assign) NSInteger SourceID;

/**   客户来源名称 */
@property(nonatomic,copy) NSString * SourceName;

/**  备注 */
@property(nonatomic,copy) NSString * Remark;

/**
 *  设计师的名字
 */
@property(nonatomic,copy) NSString *  DesignerName ;
/**
 *  家装公司
 */
@property(nonatomic,copy) NSString *  DecorateName;

@end
