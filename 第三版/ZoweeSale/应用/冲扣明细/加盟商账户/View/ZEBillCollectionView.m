//
//  ZEBillCollectionView.m
//  ZoweeSale
//
//  Created by lieon on 16/6/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEBillCollectionView.h"

#import "ZEBillCollectionViewCell.h"
#import "ZEBillFlowLayout.h"

#import "ZEBillCollectionViewCell.h"

@interface ZEBillCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@end

@implementation ZEBillCollectionView{
    ZEBillFlowLayout *_flowlayout;
}



- (instancetype)init
{
    ZEBillFlowLayout * flowlayout = [[ZEBillFlowLayout alloc]init];
    _flowlayout = flowlayout;
    // top, left, bottom, right
     self.contentInset = UIEdgeInsetsMake((50/375.0)*SCREEN_WIDTH, (80/375.0)*SCREEN_WIDTH, (50/375.0)*SCREEN_WIDTH, (80/375.0)*SCREEN_WIDTH);
    
    self.delegate = self;
    self.dataSource = self;
    //self.pagingEnabled = YES;
    [self registerNib:[UINib nibWithNibName:@"ZEBillCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ZEBillCollectionViewCell"];
    return [super initWithFrame:CGRectZero collectionViewLayout:flowlayout];
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

#pragma mark - publickMethod

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self reloadData];
    if (self.dataArray.count == 0) {
        return;
    }
    // 将collectionView在控制器view的中心点转化成collectionView上的坐标
    [self scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.dataArray.count -1 inSection:0] atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
}



#pragma mark - UICollectionViewDataSource


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger cou = self.dataArray.count;;
    return self.dataArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZEBillCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZEBillCollectionViewCell" forIndexPath:indexPath];
//    cell.backgroundColor = lieonRandomColor;
    cell.monthMoney = self.dataArray[indexPath.item];
    return cell;
}


#pragma mark - UICollectionDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"我被搞了");
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 将collectionView在控制器view的中心点转化成collectionView上的坐标
    CGPoint pInView = [self.superview convertPoint:self.center toView:self];
    // 获取这一点的indexPath
    NSIndexPath *indexPath = [self indexPathForItemAtPoint:pInView];
    
    
    // 发送通知给tableView
    [[NSNotificationCenter defaultCenter]postNotificationName:@"monthChanged" object:self userInfo:@{@"monthMoney":self.dataArray[indexPath.row]}];
    // 更新底部的数据
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    _flowlayout.contentOffsetBeginX = scrollView.contentOffset.x;
}

@end
