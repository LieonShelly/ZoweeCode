//
//  ZEHouseArea.m
//  ZoweeSale
//
//  Created by wanglj on 16/7/19.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEHouseArea.h"

@implementation ZEHouseArea

+ (NSDictionary*)mj_objectClassInArray
{
    return @{@"AreaList":[area class]};
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

@implementation area

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
