
//
//  customImageview.m
//  ZoweeSale
//
//  Created by apple on 16/2/25.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "customImageview.h"

@implementation customImageview

//重写drawRect:方法
- (void)drawRect:(CGRect)rect {
    [self.image drawInRect:rect];
}
 //重写set方法
- (void)setImage:(UIImage *)image {
  _image = image;
  [self setNeedsDisplay];
}


@end
