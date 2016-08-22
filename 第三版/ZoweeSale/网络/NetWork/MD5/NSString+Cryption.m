//
//  NSString+Cryption.m
//  517TelMeeting
//
//  Created by yunsheng on 15/7/28.
//  Copyright (c) 2015年 517na. All rights reserved.
//

#import "NSString+Cryption.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Cryption)

-(NSString *) md5
{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

@end
