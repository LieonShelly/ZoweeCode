//
//  workZoneModel.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface workZoneModel : NSObject
/**
 *  头像URL
 */
@property (nonatomic) NSString *HeadUrl;
/**
 *  动态所属人名称
 */
@property (nonatomic) NSString *UserName;
/**
 *  发布时间
 */
@property (nonatomic) NSString *PublishTime;
/**
 *  发布尾巴
 */
@property (nonatomic) NSString *PublishTag;
/**
 *  标题
 */
@property (nonatomic) NSString *Title;
/**
 *  内容摘要(80个字符，40个中文左右)
 */
@property (nonatomic) NSString *Content;
/**
 *  客户名称
 */
@property (nonatomic) NSString *CustomerName;
/**
 *  客户ID
 */
@property (nonatomic) NSNumber *CustomerID;


/**
 *  界面上显示的日期以及发布的手机
 */
@property (nonatomic , getter=timeAndTagStr,readonly) NSString *timeTag;


@end

@interface workZoneList : NSObject

@property (nonatomic) NSNumber *MaxID;

@property (nonatomic) NSMutableArray *workZoneList;

@end
