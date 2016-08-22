//
//  ZECornerLabel.m
//  ZoweeSale
//
//  Created by apple on 16/3/9.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZECornerLabel.h"

@implementation ZECornerLabel


- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
   
}


@end
