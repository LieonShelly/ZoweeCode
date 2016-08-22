//
//  registerUser.h
//  ZoweeSale
//
//  Created by wanglj on 16/2/25.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "mapLocation.h"
#import "MGLocation.h"

@interface receiveMan : NSObject

@property (nonatomic ,strong)NSString *name;

@property (nonatomic ,strong)NSNumber *ID;

@end

@interface clientsource : NSObject

@property (nonatomic ,strong)NSString *source;

@property (nonatomic ,strong)NSNumber *type;

@end

@interface designer : NSObject

@property (nonatomic) NSNumber *ID;

@property (nonatomic) NSString *Title;

@end

@interface decorate : NSObject

@property (nonatomic) NSNumber *ID;

@property (nonatomic) NSString *Title;

@end


@interface registerUser : NSObject
/**
 *  客户姓名
 */
@property (nonatomic ,strong)NSString *CustomerName;
/**
 *  省名字
 */
@property (nonatomic ,strong)NSString *ProvinceName;
/**
 *  市名字
 */
@property (nonatomic ,strong)NSString *CityName;
/**
 *  区名字
 */
@property (nonatomic ,strong)NSString *CountyName;
/**
 *  地址
 */
@property (nonatomic ,strong)NSString *Address;
/**
 *  楼盘名称
 */
@property (nonatomic ,strong)NSString *HouseName;
/**
 *  门牌号 可以为空
 */
@property (nonatomic ,strong)NSString *HouseNumber;
/**
 *  坐标点X
 */
@property (nonatomic ,strong)NSNumber *PointX;
/**
 *  坐标点Y
 */
@property (nonatomic ,strong)NSNumber *PointY;
/**
 *  电话
 */
@property (nonatomic ,strong)NSString *Mobile;
/**
 *  接待人
 */
@property (nonatomic ,strong)receiveMan *receive;
/**
 *  客户来源
 */
@property (nonatomic ,strong)clientsource *source;
/**
 *  设计师
 */
@property (nonatomic) designer *designer;
/**
 *  装饰公司
 */
@property (nonatomic) decorate *decorate;
/**
 *  备注
 */
@property (nonatomic ,strong)NSString *remark;

/**
 *  登记客户成功后返回客户ID
 */
@property (nonatomic) NSNumber *customerID;


- (NSString *)errorMessage;

- (void)addMapLocation:(mapLocation *)map;

- (void)addMGLocation:(MGLocation *)MG;

- (NSDictionary *)dictionary;

@end
