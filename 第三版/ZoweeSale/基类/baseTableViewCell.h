//
//  baseTableViewCell.h
//  ZoweeSale
//
//  Created by wanglj on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface baseTableViewCell : UITableViewCell

+ (NSString *)CellIdentifier;
/**
 *  初始化设置,子类重写
 */
- (void)setup;


@end
