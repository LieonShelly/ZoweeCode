//
//  ZEBoundCornorImageView.m
//  ZoweeSale
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEBoundCornorImageView.h"

@implementation ZEBoundCornorImageView


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.layer.cornerRadius = self.width * 0.5;
    self.layer.masksToBounds = YES;
}


@end
