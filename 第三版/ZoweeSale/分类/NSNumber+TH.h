//
//  NSNumber+TH.h
//  ZoweeSale
//
//  Created by wanglj on 16/3/15.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (TH)
/**
 *  字符串装number
 *
 *  @param str 字符数
 *
 *  @return number结果
 */
+ (NSNumber *)numberWithString:(NSString *)str;


+ (NSNumber*)add:(NSNumber *)one and:(NSNumber *)anotherNumber;

@end
