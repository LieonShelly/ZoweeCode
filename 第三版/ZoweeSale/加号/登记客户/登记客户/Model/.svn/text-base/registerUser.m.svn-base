//
//  registerUser.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/25.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "registerUser.h"
#import "MJExtension.h"
#import "userManager.h"

@implementation registerUser


- (NSString *)errorMessage {
    if (!(self.CustomerName.length > 0)) {
        return @"客户姓名不能为空";
    }else if (!(self.Mobile.length > 0)) {
        return @"客户电话不能为空";
    }else if (self.Mobile.length < 11) {
        return @"客户电话格式不正确";
    }else if (!(self.Address.length > 0)) {
        return @"楼盘信息不能为空";
    }
    if (![_decorate.ID isEqual:@0]&&_decorate) {
        if ([_designer.ID isEqual:@0]) {
            return @"选择了装饰公司,就必须选设计师";
        }
    }
    return nil;
}

- (void)addMapLocation:(mapLocation *)map {
    self.ProvinceName = map.ProvinceName;
    self.CityName = map.CityName;
    self.CountyName = map.CountyName;
    self.Address = map.Address;
    self.HouseName = map.HouseName;
    self.PointX = map.PointX;
    self.PointY = map.PointY;
}
- (void)addMGLocation:(MGLocation *)MG {
    self.ProvinceName = MG.ProvinceName;
    self.CityName = MG.CityName;
    self.CountyName = MG.CountyName;
    self.Address = MG.Address;
    self.HouseName = MG.Title;
    self.PointX = MG.PointX;
    self.PointY = MG.PointY;
}

- (NSDictionary *)dictionary {
    NSDictionary *dic = @{
                          @"CustomerName": self.CustomerName,
                          @"ProvinceName":self.ProvinceName,
                          @"CityName":self.CityName,
                          @"CountyName":self.CountyName,
                          @"Address":self.Address,
                          @"HouseName":self.HouseName,
                          @"HouseNumber":self.HouseNumber,
                          @"PointX":self.PointX,
                          @"PointY":self.PointY,
                          @"Mobile":self.Mobile,
                          @"GuideID":self.receive.ID,
                          @"SourceID":self.source.type,
                          @"Remark":self.remark,
                          @"DesignerID":self.designer.ID
                          };
    return dic;
    
}
- (receiveMan *)receive {
    if (!_receive) {
        _receive = [[receiveMan alloc]init];
       // NSDictionary *user = [userManagershare loadingLoginMessagr];
        _receive.ID = [userManager sharedInstance].UserID;
        _receive.name = [userManager sharedInstance].userName;
    }
    return _receive;
}

- (clientsource *)source {
    if (!_source) {
        _source = [[clientsource alloc]init];
        _source.type = @0;
        _source.source = @"";
    }
    return _source;
}

- (designer *)designer {
    if (!_designer) {
        _designer = [[designer alloc]init];
    }
    return _designer;
}

- (decorate *)decorate {
    if (!_decorate) {
        _decorate = [[decorate alloc]init];
    }
    return _decorate;
}


- (NSString *)HouseNumber {
    if (!_HouseNumber) {
        _HouseNumber = @"";
    }
    return _HouseNumber;
}

- (NSNumber *)PointX {
    if (!_PointX) {
        _PointX = @0;
    }
    return _PointX;
}

- (NSNumber *)PointY {
    if (!_PointY) {
        _PointY = @0;
    }
    return _PointY;
}

- (NSString *)remark {
    if (!_remark) {
        _remark = @"";
    }
    return _remark;
}

@end


@implementation receiveMan



@end

@implementation clientsource



@end

@implementation  designer

- (instancetype)init
{
    self = [super init];
    if (self) {
        _ID = @0;
        _Title = @"";
    }
    return self;
}


@end


@implementation decorate

- (instancetype)init
{
    self = [super init];
    if (self) {
        _ID = @0;
        _Title = @"";
    }
    return self;
}

@end