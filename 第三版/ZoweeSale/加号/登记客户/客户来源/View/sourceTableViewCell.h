//
//  sourceTableViewCell.h
//  ZoweeSale
//
//  Created by wanglj on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sourceTableViewCell : UITableViewCell
//选中
@property (nonatomic ,assign)BOOL isSelectd;

@property (nonatomic ,strong)NSString *type;
@end
