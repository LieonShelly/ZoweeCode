//
//  ZEPesonalNameViewCell.h
//  ZoweeSale
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZEPersonalInfo.h"

@interface ZEPesonalNameViewCell : UITableViewCell

@property(nonatomic,strong) ZEPersonalInfo * userInfos;

+ (instancetype)cellWithTableView:(UITableView*)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier;
@end
