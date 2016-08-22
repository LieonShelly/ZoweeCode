//
//  ZEArrowItem.m
//  ZoweeSale
//
//  Created by apple on 16/3/22.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEArrowItem.h"

@implementation ZEArrowItem

-(instancetype)initWithIcon:(NSString*)icon title:(NSString*)title destClass:(Class) destVC
{
    if(self = [super initWithIcon:icon title:title])
    {
        self.destVC =destVC;
    }
    return self;
}

@end
