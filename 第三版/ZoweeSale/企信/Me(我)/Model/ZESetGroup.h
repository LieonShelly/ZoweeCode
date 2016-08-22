//
//  ZESetGroup.h
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZESetGroup : NSObject

//头部标题
@property (nonatomic,copy) NSString * headerTitle;
//底部标题
@property(nonatomic,copy) NSString * footerTitle;
//当前分组中所有行的数组（）
@property(nonatomic,strong) NSArray * items;

@end
