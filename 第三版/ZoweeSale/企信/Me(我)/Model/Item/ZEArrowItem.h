//
//  ZEArrowItem.h
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEItem.h"

@interface ZEArrowItem : ZEItem

//目标控制器(只有在有尖尖的时候才跳转)
@property(nonatomic,copy) Class destVC;

-(instancetype)initWithIcon:(NSString*)icon title:(NSString*)title destClass:(Class) destVC;

@end
