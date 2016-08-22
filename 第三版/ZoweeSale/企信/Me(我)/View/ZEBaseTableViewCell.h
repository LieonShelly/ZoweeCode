//
//  ZEBaseTableViewCell.h
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZEItem.h"
#import "ZEArrowItem.h"
#import "ZENoArrowItem.h"
#import "ZENoSubtitleItem.h"

@interface ZEBaseTableViewCell : UITableViewCell

@property(nonatomic,strong) ZEItem * item;
//设置分割线是否要隐藏
@property(nonatomic) BOOL hiddeDivider;

@end
