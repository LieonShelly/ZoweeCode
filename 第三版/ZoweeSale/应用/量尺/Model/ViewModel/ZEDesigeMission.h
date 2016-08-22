//
//  ZEDesigeMission.h
//  ZoweeSale
//
//  Created by wanglj on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZEDesigeMission : NSObject

/**
 *  订单ID
 */
@property (nonatomic) NSNumber *ProjectID;
/**
 *  客户订单ID
 */
@property (nonatomic) NSNumber *OrderID;

/**
 *  缩略图ID
 */
@property (nonatomic) NSNumber *ID;
/**
 *  图片路径
 */
@property (nonatomic) NSString *ImgPath;
/**
 *  电话号码
 */
@property (nonatomic) NSString *Mobile;
/**
 *  订单地址
 */
@property (nonatomic) NSString *Address;
/**
 *  客户姓名
 */
@property (nonatomic) NSString *CustomerName;

/**
 *  不是从网上获取,本地标识是否已经上传过
 */
@property (nonatomic) NSString *isUP;

@end
