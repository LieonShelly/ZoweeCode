//
//  ZECustomerTeam.h
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZECustomerTeam : NSObject

/**员工ID*/
@property(nonatomic,assign) NSInteger UserID;

/**
 员工名称
 */
@property(nonatomic,copy) NSString * UserName;

/**
 职位名称
 */
@property(nonatomic,copy) NSString * JobName;

/**
 *  头像的url
 */
@property(nonatomic,copy) NSString * Url;




@end
