//
//  ZEBillFlowLayout.m
//  ZoweeSale
//
//  Created by lieon on 16/6/12.
//  Copyright © 2016年 TH. All rights reserved.
//

//  在iPhone6上的标准比例
#define widthRatio  ((210 )/ 375.0)
#define heightRatio (260 /420.0)
#define standardRatio(value) ((value) / 375.0)


// 根据屏幕的宽度适配item的宽度
#define itemWidth (widthRatio * SCREEN_WIDTH)

#import "ZEBillFlowLayout.h"
#import "ZEBillCollectionView.h"
@implementation ZEBillFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
//        // 设置item的大小
//        NSLog(@"%f",self.collectionView.height);
//        CGFloat width = itemWidth;
//        CGFloat height =  130;
//        self.itemSize = CGSizeMake(width, height);
//        // 设置水平滚动
//        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        // 设置最小行间距50
//        self.minimumInteritemSpacing = 10;//格
//        self.minimumLineSpacing = 10;//行
//        // 设置内边距
////        // top, left, bottom, right
//        self.sectionInset = UIEdgeInsetsMake(standardRatio(20) * SCREEN_WIDTH,standardRatio(20) * SCREEN_WIDTH , standardRatio(20) * SCREEN_WIDTH, standardRatio(20) * SCREEN_WIDTH);
        
        
    }
    return self;
}


- (void)prepareLayout
{
    // 设置item的大小
//    CGFloat width = itemWidth;
    CGFloat width  = widthRatio * self.collectionView.width;
    CGFloat height = width * heightRatio;
    
//    CGFloat width = 50;
//    CGFloat height =  width;
    self.itemSize = CGSizeMake(width, height);
    // 设置水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置最小行间距50
    self.minimumInteritemSpacing = 10;//格
    self.minimumLineSpacing = 10;//行
    // 设置内边距
    //        // top, left, bottom, right
//    self.sectionInset = UIEdgeInsetsMake(standardRatio(20) * SCREEN_WIDTH,standardRatio(20) * SCREEN_WIDTH , standardRatio(20) * SCREEN_WIDTH, standardRatio(20) * SCREEN_WIDTH);
    self.sectionInset = UIEdgeInsetsMake(0,0, 0,0);
}
//当滚动发生时，是否要将旧的布局信息设置为无效
//保证新的布局对象信息被应用
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

// 此方法已经在父类UICollectionViewFlowLayout中
// 已经实现了，即，父类中这个方法已经能够产生出一堆
// 决定item如何显示的attributes对象了
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //1.取父类中找到已经生成的那一堆attributes
    NSArray *allAttributes = [super layoutAttributesForElementsInRect:rect];
    //2.修改里面的数据
    for (UICollectionViewLayoutAttributes *attr in allAttributes) {
        
        CGFloat delta = fabs(attr.center.x - self.collectionView.contentOffset.x - self.collectionView.bounds.size.width * 0.5);
        CGFloat precent =  1 - (delta*0.1)/(self.collectionView.bounds.size.width*0.5);
        attr.alpha = precent;
        CATransform3D transform = CATransform3DIdentity;
        transform =  CATransform3DScale(transform, precent, precent, 1);
        attr.transform3D = transform;
        attr.alpha = 1 - (delta*0.5)/(self.collectionView.bounds.size.width*0.5);
        attr.zIndex = 1;

    
        
    }
    //3.将改过数据的这一组attributes返回
    return allAttributes;
}



// 当UICollectionView停止的那一刻ContentOffset的值(控制UICollectionView停止时，有一个Item一定居中显示)
// 1.proposedContentOffset默认的ContentOffset
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    //1. 获取UICollectionView停止的时候的可视范围
    CGRect contentFrame;
    CGFloat distance = proposedContentOffset.x - _contentOffsetBeginX;
    
    if (distance>itemWidth/2) {
        contentFrame.origin = CGPointMake(_contentOffsetBeginX+itemWidth, proposedContentOffset.y);
    }else if(distance<-itemWidth/2){
        contentFrame.origin = CGPointMake(_contentOffsetBeginX-itemWidth, proposedContentOffset.y);
    }else{
        contentFrame.origin = CGPointMake(_contentOffsetBeginX, proposedContentOffset.y);
    }
    contentFrame.size = self.collectionView.frame.size;
    NSArray *array = [self layoutAttributesForElementsInRect:contentFrame];
    //2. 计算在可视范围的距离中心线最近的Item
    CGFloat minCenterX = CGFLOAT_MAX;
    CGFloat collectionViewCenterX = contentFrame.origin.x + self.collectionView.frame.size.width * 0.5;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        if(ABS(attrs.center.x - collectionViewCenterX) < ABS(minCenterX)){
            minCenterX = attrs.center.x - collectionViewCenterX;
        }
    }
    //3. 补回ContentOffset，则正好将Item居中显示

    return CGPointMake(contentFrame.origin.x + minCenterX, proposedContentOffset.y);
}


@end
