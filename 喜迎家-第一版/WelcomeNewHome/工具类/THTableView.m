//
//  THTableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "THTableView.h"
#import "YYKit.h"

@implementation THTableView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
        [self setupAfter];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
        [self setupAfter];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        [self setupAfter];
    }
    return self;
}


- (void)setup{
    //self.backgroundColor = [UIColor colorWithHexString:@"f5f2f3"];
    self.tableFooterView = [UIView new];
    _viewModel= [[YZSTableViewModel alloc]init];
    self.delegate = _viewModel;
    self.dataSource = _viewModel;
    self.cellStr = @"cell";
}
- (void)setupAfter{
    
}


@end
