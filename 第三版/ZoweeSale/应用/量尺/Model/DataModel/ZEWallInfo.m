//
//  ZEWallInfo.m
//  ZoweeSale
//
//  Created by apple on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEWallInfo.h"
#import "ZEWSubInfo.h"

@implementation ZEWallInfo

+ (NSDictionary*)mj_objectClassInArray
{
    return @{@"WSubList":[ZEWSubInfo class]};
}

- (NSMutableArray *)WSubList
{
    if (_WSubList == nil) {
        _WSubList = [NSMutableArray array];
    }
    return _WSubList;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
//        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self.WallNo = [coder decodeObjectForKey:@"wallNO"];
    self.WSX = [coder decodeObjectForKey:@"WSX"];
    self.WSY = [coder decodeObjectForKey:@"WSY"];
    self.WEX = [coder decodeObjectForKey:@"WEX"];
    self.WEY = [coder decodeObjectForKey:@"WEY"];
    self.WPreNo = [coder decodeObjectForKey:@"WPreNo"];
    self.WNextNo = [coder decodeObjectForKey:@"WNextNo"];
    self.WThick = [coder decodeObjectForKey:@"WThick"];
    self.WLength = [coder decodeObjectForKey:@"WLength"];
    self.WVisble = [coder decodeObjectForKey:@"WVisble"];
    self.WDoorCount = [coder decodeObjectForKey:@"WDoorCount"];
    self.WWindowsCount = [coder decodeObjectForKey:@"WWindowsCount"];
    self.WSubList = [coder decodeObjectForKey:@"WSubList"];
    return self;
}
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.WallNo forKey:@"wallNO"];
    [coder encodeObject:self.WSX forKey:@"WSX"];
    [coder encodeObject:self.WSY forKey:@"WSY"];
    [coder encodeObject:self.WEX forKey:@"WEX"];
    [coder encodeObject:self.WEY forKey:@"WEY"];
    [coder encodeObject:self.WPreNo forKey:@"WPreNo"];
    [coder encodeObject:self.WNextNo forKey:@"WNextNo"];
    [coder encodeObject:self.WThick forKey:@"WThick"];
    [coder encodeObject:self.WLength forKey:@"WLength"];
    [coder encodeObject:self.WVisble forKey:@"WVisble"];
    [coder encodeObject:self.WDoorCount forKey:@"WDoorCount"];
    [coder encodeObject:self.WWindowsCount forKey:@"WWindowsCount"];
    [coder encodeObject:self.WSubList forKey:@"WSubList"];

}

- (void)setup {
    _WallNo = @"123";
    _WSX = @100;
    _WSY = @100;
    _WEX = @200;
    _WEY = @200;
    _WPreNo = @"13212";
    _WNextNo = @"sdf";
    _WThick = @34;
    _WLength = @120;
    _WVisble = @1;
    _WDoorCount = @1;
    _WWindowsCount = @1;
    _WSubList = [NSMutableArray arrayWithObjects:[[ZEWSubInfo alloc]init], nil];
    
}
@end
