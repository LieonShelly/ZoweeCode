//
//  ZETHAnnotationView.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZETHAnnotationView.h"
#import "UILable+TH.h"

@implementation ZETHAnnotationView{
    UILabel *titleLab;
    UILabel *subLab;
    UIView *_view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.image = [UIImage imageNamed:@"icon_mapRedMark"];
    UIView *view = [UIView new];
    view.frame = CGRectMake(-43, -35, 100, 35);
    view.backgroundColor = [UIColor whiteColor];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5;
    view.alpha = 0.9;
    _view = view;
    titleLab = [UILabel new];
    titleLab.frame = CGRectMake(0, 0, 100, 20);
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.text = @"";
    [view addSubview:titleLab];
    subLab = [UILabel new];
    subLab.font = [UIFont systemFontOfSize:13];
    subLab.frame = CGRectMake(0, 20, 100, 15);
    subLab.textAlignment = NSTextAlignmentCenter;
    subLab.text = @"";
    [view addSubview:subLab];
    
    [self addSubview:view];
    //self.enabled3D = YES;
    self.canShowCallout = NO;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    titleLab.text = title;
}

- (void)setSubtitle:(NSString *)subtitle{
    _subtitle = subtitle;
    subLab.text = subtitle;
    CGFloat width = [subLab labelSizeWidth];
    subLab.width = width + 20;
    _view.width = subLab.width;
    _view.x = -_view.width/2 + 6;
}


@end
