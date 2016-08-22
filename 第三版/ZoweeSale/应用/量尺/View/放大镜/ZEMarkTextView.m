//
//  ZEMarkTextView.m
//  ZoweeSale
//
//  Created by apple on 16/5/19.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEMarkTextView.h"

@implementation ZEMarkTextView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    

    
    UIImage * image = [UIImage imageNamed:@"bg_input"];
    [image drawInRect:self.bounds];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;

}


@end
