//
//  ZEHouseArea.h
//  ZoweeSale
//
//  Created by wanglj on 16/7/19.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface area : NSObject<NSCoding>

@property (nonatomic ,strong) NSNumber *AreaID;

@property (nonatomic ,copy) NSString *AreaName;

@end


@interface ZEHouseArea : NSObject<NSCoding>

@property (nonatomic ,strong) NSNumber *CityID;

@property (nonatomic ,copy) NSString *CityName;

@property (nonatomic ,copy) NSArray *AreaList;

@end

