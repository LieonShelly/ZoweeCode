
//
//  detailTableViewCell.h
//  ZoweeSale
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "baseTableViewCell.h"
#import "ZESingleDetail.h"
@interface detailTableViewCell : baseTableViewCell
@property(nonatomic,strong)ZESingleDetail *singleDetail;

@property (nonatomic,copy)NSString *title;

@property (nonatomic,copy)NSString *detail;


@end
