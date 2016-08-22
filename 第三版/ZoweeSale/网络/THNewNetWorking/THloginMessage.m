//
//  THloginMessage.m
//  YTKNetworkDemo
//
//  Created by wanglj on 16/6/8.
//  Copyright © 2016年 yuantiku.com. All rights reserved.
//

#import "THloginMessage.h"
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

@implementation THloginMessage

+ (THloginMessage *)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _uuid = [self randomUUID];
        _DeviceCode = [self getDeviceVersion];
        _NetType = AFNetworkReachabilityStatusUnknown;
    }
    return self;
}
/**
 *  UUID初始化
 *
 *  @return UUID
 */
- (NSString *)randomUUID {
    if(NSClassFromString(@"UIDevice") && [UIDevice instancesRespondToSelector:@selector(identifierForVendor)]) {
        // only available in iOS >= 6.0
        NSString *uuid = [[UIDevice currentDevice].identifierForVendor UUIDString];
        uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
        return uuid;
    }
    return nil;
}

- (NSString *)getDeviceVersion{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //未考虑iPhone3等较老设备
    if ([deviceString hasPrefix:@"iPhone3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"]||[deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,3"]||[deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceString hasPrefix:@"iPhone6"])    return @"iPhone 5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    //iPod
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    //iPad
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2";//(WiFi)
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";// (GSM)
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2";// (CDMA)
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";//(32nm)
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad mini";//(WiFi)
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad mini";//(GSM)
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad mini";//(CDMA)
    
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3";//(WiFi)
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3";//(CDMA)
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";//(4G)
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4";// (WiFi)
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";// (4G)
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4";// (CDMA)
    
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad mini 4";
    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Air 2mini";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    
    if ([deviceString isEqualToString:@"iPad4,4"]
        ||[deviceString isEqualToString:@"iPad4,5"]
        ||[deviceString isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    
    if ([deviceString isEqualToString:@"iPad4,7"]
        ||[deviceString isEqualToString:@"iPad4,8"]
        ||[deviceString isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    return @"iPhone";
}
@end
