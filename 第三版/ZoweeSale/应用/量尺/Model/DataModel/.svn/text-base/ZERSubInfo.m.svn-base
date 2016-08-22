//
//  ZERSubInfo.m
//  ZoweeSale
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//  

#import "ZERSubInfo.h"

@implementation ZERSubInfo

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
    self.RoomSubTitle = [coder decodeObjectForKey:@"RoomSubTitle"];
    self.RSGroup = [coder decodeObjectForKey:@"RSGroup"];
    self.RSType = [coder decodeObjectForKey:@"RSType"];
    self.RSNo = [coder decodeObjectForKey:@"RSNo"];
    self.RSRemark = [coder decodeObjectForKey:@"RSRemark"];
    self.RSSX = [coder decodeObjectForKey:@"RSSX"];
    self.RSSY = [coder decodeObjectForKey:@"RSSY"];
    self.RSLength = [coder decodeObjectForKey:@"RSLength"];
    self.RSHeight = [coder decodeObjectForKey:@"RSHeight"];
    self.RSRoomNo = [coder decodeObjectForKey:@"RSRoomNo"];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.RoomSubTitle forKey:@"RoomSubTitle"];
    [coder encodeObject:self.RSGroup forKey:@"RSGroup"];
    [coder encodeObject:self.RSType forKey:@"RSType"];
    [coder encodeObject:self.RSNo forKey:@"RSNo"];
    [coder encodeObject:self.RSRemark forKey:@"RSRemark"];
    [coder encodeObject:self.RSSX forKey:@"RSSX"];
    [coder encodeObject:self.RSSY forKey:@"RSSY"];
    [coder encodeObject:self.RSLength forKey:@"RSLength"];
    [coder encodeObject:self.RSHeight forKey:@"RSHeight"];
    [coder encodeObject:self.RSRoomNo forKey:@"RSRoomNo"];
}

- (void)setup {
    
    _RoomSubTitle = @"测试附加物";
    _RSGroup = @1;
    _RSType = @1;
    _RSNo = @"1";
    _RSRemark = @"测试的时候呵呵哒";
    _RSSX = @10000;
    _RSSY = @10000;
    _RSLength = @1233;
    _RSHeight = @13434;
    _RSRoomNo = @"12";
    
}
@end
