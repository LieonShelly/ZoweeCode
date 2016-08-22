//
//  reviceTableViewCell.h
//  ZoweeSale
//
//  Created by wanglj on 16/2/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface reviceTableViewCell : UITableViewCell
//头像
@property (nonatomic ,strong)NSString *photeImg;
//姓名
@property (nonatomic ,strong)NSString *name;
//选中
@property (nonatomic ,assign)BOOL isSelectd;

@end
