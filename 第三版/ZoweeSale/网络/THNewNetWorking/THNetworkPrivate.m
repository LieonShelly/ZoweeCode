//
//  THNetworkPrivate.m
//  YTKNetworkDemo
//
//  Created by wanglj on 16/6/8.
//  Copyright © 2016年 yuantiku.com. All rights reserved.
//

#import "THNetworkPrivate.h"
#import "YTKNetworkPrivate.h"
#import "THloginMessage.h"
#import "MJExtension.h"
#import "LFCGzipUtillity.h"
#import "userManager.h"

static const NSString *BaseStr = @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";


@implementation THNetworkPrivate


+(NSString *)requestCryptographyWithAction:(NSString *)action Parameter:(NSDictionary *)parameter{
    //版本号
    NSString *versionCode = [[YTKNetworkPrivate appVersionString] stringByReplacingOccurrencesOfString:@"." withString:@""];
    //签名码 两次MD5
    NSString *sign = [NSString stringWithFormat:@"%@%@",[parameter mj_JSONString],[THloginMessage sharedInstance].uuid];
    sign = [YTKNetworkPrivate md5StringFromString:sign];
    sign = [YTKNetworkPrivate md5StringFromString:sign];
    //参数字典
    NSDictionary *requestDic = @{
                                 @"a":action,
                                 @"d":parameter,
                                 @"s":sign,
                                 @"t":[userManager sharedInstance].token,
                                 @"at":@"2",
                                 @"v":versionCode,
                                 @"f":@"00004"
                                 };
    NSString *requestStr = [requestDic mj_JSONString];
    NSLog(@"============\n请求JSON:%@\n===========",requestStr);
    
    NSData *requestData = [requestStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64 = [requestData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    //自定义的加密方法
    base64 = [self customEncryptWithString:base64];
    return base64;
    
}

+ (id)decipheringWithResponeData:(NSData *)responeData{
    //gzip解压
    responeData = [LFCGzipUtillity uncompressZippedData:responeData];
    //utf8编码
    NSString *strBase64 = [[NSString alloc]initWithData:responeData encoding:NSUTF8StringEncoding];
    //自定义方法解码
     strBase64 = [self customDecodeWithString:strBase64];
    //base64解码
    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:strBase64 options:0];
    NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
    
   // NSDictionary *dic = [decodedString mj_JSONObject];
    THNetWorkBaseModel *model = [THNetWorkBaseModel mj_objectWithKeyValues:decodedString];
    NSLog(@"===========\n返回的Json:%@============",decodedString);
    return model;
}
//103CD40390CA444A8A01793A91515A44
/**
 *  自定义加密方法
 *
 *  @param encString 加密字符,在字符串中的第三位后和第一位以及最后一位插入随机字符
 *
 *  @return 加密后字符串
 */
+ (NSString *)customEncryptWithString:(NSString *)encString{
    NSMutableString *EncString = [NSMutableString stringWithFormat:@"%@",encString];
    [EncString insertString:[self generateRandomString] atIndex:3];
    [EncString insertString:[self generateRandomString] atIndex:0];
    [EncString insertString:[self generateRandomString] atIndex:[EncString length]];
    return [NSString stringWithFormat:@"%@",EncString];
}
/**
 *  自定义解密方法
 *
 *  @param decString 解密字符,删除字符串中的第一位和最后一位以及第四位
 *
 *  @return 解密后字符串
 */
+ (NSString *)customDecodeWithString:(NSString *)decString{
    //处理异常情况
    if (!decString) {
        return @"";
    }
    if ([decString isEqualToString:@""]) {
        return @"";
    }
    NSMutableString *DecString = [NSMutableString stringWithFormat:@"%@",decString];
    [DecString deleteCharactersInRange:NSMakeRange(0, 1)];
    [DecString deleteCharactersInRange:NSMakeRange([DecString length]-1, 1)];
    [DecString deleteCharactersInRange:NSMakeRange(3, 1)];
    return DecString;
}
/**
 *  根据BaseStr产生随机字符
 *
 *  @return 随机字符
 */
+ (NSString *)generateRandomString{
//    NSInteger inta = (arc4random_uniform(64));
//    NSString *randomStr = [BaseStr substringWithRange:NSMakeRange(inta, 1)];
//    return randomStr;
    return @"a";
}



@end
