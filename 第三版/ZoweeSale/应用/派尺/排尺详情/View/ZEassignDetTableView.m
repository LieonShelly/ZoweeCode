//
//  ZEassignDetTableView.m
//  ZoweeSale
//
//  Created by wanglj on 16/5/26.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEassignDetTableView.h"

@interface ZEassignDetTableView()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end

@implementation ZEassignDetTableView



- (void)awakeFromNib
{
    [super awakeFromNib];
    self.emptyDataSetSource = self;
    self.emptyDataSetDelegate = self;

}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    [self reloadData];
}
#pragma emptyDataSource Implementation

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"empty_image"
            ];
}
//- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
//{
//    return -self.height *.25;
//}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
    
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
    
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

//- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
//{
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:15.0f],NSForegroundColorAttributeName:hexColorString(@"fa5a5a")};
//    
//    return [[NSAttributedString alloc] initWithString:@"安排量尺" attributes:attributes];
//}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],NSForegroundColorAttributeName:hexColorString(@"999999")};
    
    return [[NSAttributedString alloc] initWithString:@"今天还有需要量尺的客户,\n马上去安排吧\n" attributes:attributes];
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
{
    return [UIImage imageNamed:@"assign_btn"];
}


- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
{
    NSLog(@"我被搞了");
    [[NSNotificationCenter defaultCenter]postNotificationName:@"emptyTableViewDidCilckBtn" object:self];
    
}
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor clearColor];
}

@end

