//
//  ZEWSubInfo.m
//  ZoweeSale
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEWSubInfo.h"

@implementation ZEWSubInfo




- (instancetype)initWithCoder:(NSCoder *)coder
{
    self.WallSubTitle = [coder decodeObjectForKey:@"WallSubTitle"];
    self.WSGroup = [coder decodeObjectForKey:@"WSGroup"];
    self.WSType = [coder decodeObjectForKey:@"WSType"];
    self.WSNo = [coder decodeObjectForKey:@"WSNo"];
    self.WSRemark = [coder decodeObjectForKey:@"WSRemark"];
    self.WSSides = [coder decodeObjectForKey:@"WSSides"];
    self.WSInSides = [coder decodeObjectForKey:@"WSInSides"];
    self.WSSX = [coder decodeObjectForKey:@"WSSX"];
    self.WSSY = [coder decodeObjectForKey:@"WSSY"];
    self.WSEX = [coder decodeObjectForKey:@"WSEX"];
    self.WSEY = [coder decodeObjectForKey:@"WSEY"];
    self.WSLength = [coder decodeObjectForKey:@"WSLength"];
    self.WSWallNo = [coder decodeObjectForKey:@"WSWallNo"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.WallSubTitle forKey:@"WallSubTitle"];
    [coder encodeObject:self.WSGroup forKey:@"WSGroup"];
    [coder encodeObject:self.WSType forKey:@"WSType"];
    [coder encodeObject:self.WSNo forKey:@"WSNo"];
    [coder encodeObject:self.WSRemark forKey:@"WSRemark"];
    [coder encodeObject:self.WSSides forKey:@"WSSides"];
    [coder encodeObject:self.WSInSides forKey:@"WSInSides"];
    [coder encodeObject:self.WSSX forKey:@"WSSX"];
    [coder encodeObject:self.WSSY forKey:@"WSSY"];
    [coder encodeObject:self.WSEX forKey:@"WSEX"];
    [coder encodeObject:self.WSEY forKey:@"WSEY"];
    [coder encodeObject:self.WSLength forKey:@"WSLength"];
    [coder encodeObject:self.WSWallNo forKey:@"WSWallNo"];
}



@end
