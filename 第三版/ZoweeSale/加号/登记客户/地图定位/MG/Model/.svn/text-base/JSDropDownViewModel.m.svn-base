//
//  JSDropDownViewModel.m
//  ZoweeSale
//
//  Created by wanglj on 16/7/19.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "JSDropDownViewModel.h"
#import "ZEHouseArea.h"
#import "HZURLNavigation.h"
#import "YYKit.h"
#import "MGLocationViewController.h"

@implementation JSDropDownViewModel{
    NSInteger _currentData1Index;
    NSArray *_houseAreaArray;
}
- (instancetype)initWithBlock:(viewModelNetFinish)block;
{
    self = [super init];
    if (self) {
        _finshBlock = block;
        [self Setup];
    }
    return self;
}
- (void)Setup{
    _currentData1Index = 1;
    YYCache *cache = [YYCache cacheWithName:@"houseArea"];
    _houseAreaArray = (NSArray *)[cache objectForKey:@"array"];
    THBaseRequestApi *api = [[THBaseRequestApi alloc]initWithAction:@"LoadHouseArea" Requestparameter:@{}cacheTime:oneHour*24 ModelClassName:@"ZEHouseArea"];
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        if (request.responseJSONObject) {
            _houseAreaArray = request.responseJSONObject;
            if (!_houseAreaArray.isNoEmpty) {
                [[HZURLNavigation currentViewController] showAlertWithMsg:@"请先设置加盟商所在省份"];
            }
            if (_finshBlock) {
                _finshBlock(self);
            }
            [cache setObject:_houseAreaArray forKey:@"array"];
        }else{
            
        }
    } failure:^(YTKBaseRequest *request) {
    }];
    
    
}

- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu {
    if (_houseAreaArray.isNoEmpty) {
        return 1;
    }
    return 0;
}

-(BOOL)displayByCollectionViewInColumn:(NSInteger)column{
    
    return NO;
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    return YES;
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
    return 0.3;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    return _currentData1Index;
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    if (!_houseAreaArray.isNoEmpty) {
        return 0;
    }
    if (column==0) {
        if (leftOrRight==0) {
            
            return _houseAreaArray.count;
        } else{
            
            ZEHouseArea *menuArea = [_houseAreaArray objectAtIndex:leftRow];
            return menuArea.AreaList.count;
        }
    }
    return 0;
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column{
    return @"市,区选择";
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath {
    if (indexPath.column==0) {
        if (indexPath.leftOrRight==0) {
            ZEHouseArea *menuArea = _houseAreaArray[indexPath.row];
            return menuArea.CityName;
        } else{
            ZEHouseArea *menuArea = _houseAreaArray[indexPath.leftRow];
            area *Area = menuArea.AreaList[indexPath.row];
            return Area.AreaName;
        }
    }
    return nil;
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath {
    if(indexPath.leftOrRight==0){
        _currentData1Index = indexPath.row;
        return;
    }else{
        ZEHouseArea *menuArea = _houseAreaArray[indexPath.leftRow];
        area *Area = menuArea.AreaList[indexPath.row];
        THBaseRequestApi *api = [[THBaseRequestApi alloc]initWithAction:@"SearchAddressByCityID" Requestparameter:@{@"CityID":menuArea.CityID,@"AreaID":Area.AreaID} ModelClassName:@"MGLocation"];
        [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
            if (request.responseJSONObject) {
                NSArray *address = request.responseJSONObject;
                MGLocationViewController *controller = (MGLocationViewController *)[HZURLNavigation currentViewController];
                controller.tabView.searchArray = address;
                controller = nil;
            }else{
                
            }
        } failure:^(YTKBaseRequest *request) {
        }];
    }
}


@end
