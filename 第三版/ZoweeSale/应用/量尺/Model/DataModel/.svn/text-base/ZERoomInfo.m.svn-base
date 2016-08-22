//
//  ZERoomInfo.m
//  ZoweeSale
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERoomInfo.h"
#import "ZEWallInfo.h"
#import "MJExtension.h"
#import "ZERSubInfo.h"

@implementation ZERoomInfo

+ (NSDictionary*)mj_objectClassInArray
{
    return @{@"RWallList":[ZEWallInfo class],@"RSubList":[ZERSubInfo class]};
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self.RoomTitle = [coder decodeObjectForKey:@"RoomTitle"];
    self.RNo = [coder decodeObjectForKey:@"RNo"];
    self.RType = [coder decodeObjectForKey:@"RType"];
    self.RArea = [coder decodeObjectForKey:@"RArea"];
    self.RSX = [coder decodeObjectForKey:@"RSX"];
    self.RSY = [coder decodeObjectForKey:@"RSY"];
    self.RPlatHeight = [coder decodeObjectForKey:@"RPlatHeight"];
    self.RWallCount = [coder decodeObjectForKey:@"RWallCount"];
    self.RDoorCount = [coder decodeObjectForKey:@"RDoorCount"];
    self.RWindowsCount = [coder decodeObjectForKey:@"RWindowsCount"];
    self.RWallList = [coder decodeObjectForKey:@"RWallList"];
    self.RSubList = [coder decodeObjectForKey:@"RSubList"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.RoomTitle forKey:@"RoomTitle"];
    [coder encodeObject:self.RNo forKey:@"RNo"];
    [coder encodeObject:self.RType forKey:@"RType"];
    [coder encodeObject:self.RArea forKey:@"RArea"];
    [coder encodeObject:self.RSX forKey:@"RSX"];
    [coder encodeObject:self.RSY forKey:@"RSY"];
    [coder encodeObject:self.RPlatHeight forKey:@"RPlatHeight"];
    [coder encodeObject:self.RWallCount forKey:@"RWallCount"];
    [coder encodeObject:self.RDoorCount forKey:@"RDoorCount"];
    [coder encodeObject:self.RWindowsCount forKey:@"RWindowsCount"];
    [coder encodeObject:self.RWallList forKey:@"RWallList"];
    [coder encodeObject:self.RSubList forKey:@"RSubList"];
}

- (void)setup {
    _RNo = @"110";
    _RType = @0;
    _RPlatHeight = @(3 * 1000);
    _RWallCount = @4;
}
@end
