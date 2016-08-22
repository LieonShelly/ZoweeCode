//
//  ZEOrderInfo.m
//  ZoweeSale
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEOrderInfo.h"
#import "ZERoomInfo.h"
#import "MJExtension.h"

@implementation ZEOrderInfo

+ (NSDictionary*)mj_objectClassInArray
{
    return @{@"ORoomList":[ZERoomInfo class]};
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self.ProjectTitle = [aDecoder decodeObjectForKey:@"ProjectTitle"];
    self.OrderID = [aDecoder decodeObjectForKey:@"OrderID"];
    self.ProjectID = [aDecoder decodeObjectForKey:@"ProjectID"];
    self.OSelfNo = [aDecoder decodeObjectForKey:@"OSelfNo"];
    self.RoomNum = [aDecoder decodeObjectForKey:@"RoomNum"];
    self.ORoomList = [aDecoder decodeObjectForKey:@"ORoomList"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.ProjectTitle forKey:@"ProjectTitle"];
    [aCoder encodeObject:self.OrderID forKey:@"OrderID"];
    [aCoder encodeObject:self.ProjectID forKey:@"ProjectID"];
    [aCoder encodeObject:self.OSelfNo forKey:@"OSelfNo"];
    [aCoder encodeObject:self.RoomNum forKey:@"RoomNum"];
    [aCoder encodeObject:self.ORoomList forKey:@"ORoomList"];


}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup{
    _ProjectTitle = @"测试上传房间数据接口";
    _OSelfNo = @"12345678805";
    _RoomNum = @1;
    _OrderID = @3006196;
    _ProjectID = @0;
//    _ORoomList = [NSArray arrayWithObjects:[[ZERoomInfo alloc]init], nil];
}
@end
