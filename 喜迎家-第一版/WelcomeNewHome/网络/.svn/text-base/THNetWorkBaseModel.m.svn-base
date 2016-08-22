//
//  THNetWorkBaseModel.m
//  YTKNetworkDemo
//
//  Created by wanglj on 16/6/8.
//  Copyright © 2016年 yuantiku.com. All rights reserved.
//

#import "THNetWorkBaseModel.h"
#import "MJExtension.h"

@implementation Body

- (NSString *)description{
    return [NSString stringWithFormat:@"{\n ReturnParList:%@}",_ReturnParList];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        [self mj_decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [self mj_encode:aCoder];
}
@end

@implementation THNetWorkBaseModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"Body":[Body class]
             };
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        [self mj_decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [self mj_encode:aCoder];
}

- (NSString *)description{
    NSString *mess = [NSString stringWithFormat:@"r:%lu\n Err:%lu]\n ErrMsg:%@\n d:%@\n",(unsigned long)_r,(unsigned long)_Err,_ErrMsg,_d];
    return mess;
}

@end
