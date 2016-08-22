//
//  ZETableViewImgaeLeftCell.h
//  ZoweeSale
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZEDoorEditOption.h"
#import "ZEWallEditOption.h"

@interface ZETableViewImgaeLeftCell : UITableViewCell

@property(nonatomic,strong) ZEDoorEditOption * edtionOption;
@property(nonatomic,strong)ZEWallEditOption *wallEdtitOption;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
