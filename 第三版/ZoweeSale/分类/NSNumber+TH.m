//
//  NSNumber+TH.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/15.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "NSNumber+TH.h"

@implementation NSNumber (TH)

+ (NSNumber *)numberWithString:(NSString *)str {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *numTemp = [numberFormatter numberFromString:str];
    if (numTemp.isNoEmpty) {
        return numTemp;
    }
    return @0;
}

+ (NSNumber *)add:(NSNumber *)one and:(NSNumber *)anotherNumber {
        return [NSNumber numberWithFloat:[one floatValue] + [anotherNumber floatValue]];
}

@end
