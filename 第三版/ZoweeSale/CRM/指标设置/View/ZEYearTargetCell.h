//
//  ZEYearTargetCell.h
//  ZoweeSale
//
//  Created by apple on 16/6/28.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "baseTableViewCell.h"
#import "ZEYearTarget.h"
@interface ZEYearTargetCell : baseTableViewCell
@property(nonatomic,assign)int month;
@property(nonatomic,strong)NSNumber * amount;
@property(nonatomic,copy)void (^sendData)(NSString * data);
@end
