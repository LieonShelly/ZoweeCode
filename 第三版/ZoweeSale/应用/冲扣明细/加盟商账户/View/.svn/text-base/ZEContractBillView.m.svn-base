//
//  ZEContractBillView.m
//  ZoweeSale
//
//  Created by lieon on 16/6/13.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEContractBillView.h"

#import "ZEDetailed.h"
#import "ZEContractBillCell.h"

@interface ZEContractBillView ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end

@implementation ZEContractBillView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //
        [self setupUI];
        
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - publickMethod

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self reloadData];
}

#pragma mark - selfMethod

- (void)setupUI
{
    // 初始化UI
    self.delegate = self;
    self.dataSource = self;
    
    self.rowHeight = UITableViewAutomaticDimension;
    self.estimatedRowHeight = 72;
    
    [self registerNib:[UINib nibWithNibName:@"ZEContractBillCell" bundle:nil] forCellReuseIdentifier:@"ZEContractBillCell"];
    
    self.backgroundColor = hexColorString(@"f5f2f2");
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.emptyDataSetSource = self;
    self.emptyDataSetDelegate = self;
    
 
}



- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZEContractBillCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZEContractBillCell"];
    if (cell == nil) {
        cell = [[ZEContractBillCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZEContractBillCell"];
    }
    ZEDetailed * detail = self.dataArray[indexPath.row];
    cell.detail = detail;
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.contractBillViewDelegate respondsToSelector:@selector(contractBillView:DidSelectedCellModel:)]) {
        [self.contractBillViewDelegate contractBillView:self DidSelectedCellModel:self.dataArray[indexPath.row]];
    }
}
#pragma emptyDataSource Implementation

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIImage imageNamed:@"empty_image"
            ];
}
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -self.height *.25 * 0.5;
}

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
    
    return [[NSAttributedString alloc] initWithString:@"暂时没有数据\n \n" attributes:attributes];
}

//- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state
//{
//    return [UIImage imageNamed:@"assign_btn"];
//}
//
//
//- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button
//{
//    NSLog(@"我被搞了");
//
//    
//}
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor clearColor];
}


@end
