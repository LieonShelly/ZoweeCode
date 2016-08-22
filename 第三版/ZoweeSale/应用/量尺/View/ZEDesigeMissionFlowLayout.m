//
//  ZEDesigeMissionFlowLayout.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEDesigeMissionFlowLayout.h"
#import "THloginMessage.h"

@implementation ZEDesigeMissionFlowLayout

-(void)prepareLayout
{
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    if ([[THloginMessage sharedInstance].DeviceCode hasPrefix:@"iPad"]) {
        self.itemSize = CGSizeMake(SCREEN_WIDTH-324,SCREEN_HEIGHT-289);
    }else{
        self.itemSize = CGSizeMake(SCREEN_WIDTH-324,SCREEN_HEIGHT-210);
    }
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.sectionInset = UIEdgeInsetsMake(0, 162, 0, 162);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *attr in array)
    {
        CGFloat delta = fabs(attr.center.x - self.collectionView.contentOffset.x - self.collectionView.bounds.size.width * 0.5);
        CGFloat precent =  1 - (delta*0.1)/(self.collectionView.bounds.size.width*0.5);
        attr.alpha = precent;
        CATransform3D transform = CATransform3DIdentity;
        transform =  CATransform3DScale(transform, precent, precent, 1);
        attr.transform3D = transform;
        attr.alpha = 1 - (delta*0.5)/(self.collectionView.bounds.size.width*0.5);;
        attr.zIndex = 1;
    }
    return array;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGPoint proposePoint = proposedContentOffset;
    CGFloat offset = (self.itemSize.width+self.minimumLineSpacing)*0.5;
    //NSLog(@"%f",offset);
    CGFloat hCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    //NSLog(@"%f,%f",hCenter,self.collectionView.contentOffset.x);
    CGRect currentRect = CGRectMake(proposedContentOffset.x, 0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    
    NSArray* array = [super layoutAttributesForElementsInRect:currentRect];
    for (UICollectionViewLayoutAttributes* layoutAttributes in array)
    {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        // NSLog(@"%f",itemHorizontalCenter);
        if (ABS(itemHorizontalCenter - hCenter) < ABS(offset))
        {
            //NSLog(@"%f",ABS(itemHorizontalCenter - hCenter));
            offset = itemHorizontalCenter - hCenter;
            proposePoint.x = proposePoint.x + offset;
        }
    }
    return proposePoint;
}


@end
