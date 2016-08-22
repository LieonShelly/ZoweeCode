//
//  THloginMessage.h
//  YTKNetworkDemo
//
//  Created by wanglj on 16/6/8.
//  Copyright © 2016年 yuantiku.com. All rights reserved.
//

typedef enum {
    NetType4G = 0,
    NetTypeWifi = 1,
    NetTypeNone = 2
}THloginMessageNetType;

#import <Foundation/Foundation.h>

@interface THloginMessage : NSObject

+ (THloginMessage *)sharedInstance;

@property (nonatomic,copy) NSString *uuid;

@property (nonatomic,copy) NSString *DeviceCode;

@property (nonatomic ) THloginMessageNetType NetType;

@end

