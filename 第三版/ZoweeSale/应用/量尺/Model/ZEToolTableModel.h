//
//  ZEToolTableModel.h
//  ZoweeSale
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZEToolTableModel : NSObject
@property(nonatomic,strong) NSArray * items;
@property(nonatomic) BOOL isDoorType;
@property(nonatomic) BOOL isSpecifyDoorType;
@property(nonatomic) BOOL isWallType;
@property(nonatomic) BOOL isSpecifyRoomType;
@end
