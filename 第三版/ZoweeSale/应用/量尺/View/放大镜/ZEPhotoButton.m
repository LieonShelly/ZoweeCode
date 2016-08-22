//
//  ZEPhotoButton.m
//  ZoweeSale
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPhotoButton.h"

@implementation ZEPhotoButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}


@end
