//
//  topCollectionViewCell.m
//  iPadMG
//
//  Created by wanglj on 15/11/20.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import "topCollectionViewCell.h"

@implementation topCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self uiInit];
    }
    return self;
}

- (void)uiInit
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height )];
    
    self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height )];
    [view addSubview:self.imageview];
    [self addSubview:view];
    //self.backgroundColor = [UIColor yellowColor];
    
}

@end
