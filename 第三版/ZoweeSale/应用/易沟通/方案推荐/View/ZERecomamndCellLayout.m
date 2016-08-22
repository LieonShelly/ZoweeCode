//
//  ZERecomamndCellLayout.m
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#define widthRatio  ((410 )/ 375.0)
#define heightRatio (310 /420.0)
#define standardRatio(value) ((value) / 375.0)

#import "ZERecomamndCellLayout.h"

@implementation ZERecomamndCellLayout

- (void)prepareLayout
{
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    CGFloat InteritemSpacing = 70;
    CGFloat LineSpacing = 60;
    CGFloat headerReferenceHeight = 0;
    CGFloat topInset = 30;
    
    self.itemSize = CGSizeMake((self.collectionView.width - InteritemSpacing * 2 - LineSpacing ) * 0.5,(self.collectionView.height - LineSpacing  - headerReferenceHeight- topInset * 2 ) * 0.5);
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, topInset, 0);
    self.sectionInset = UIEdgeInsetsMake(topInset, InteritemSpacing, topInset, InteritemSpacing);
    self.minimumInteritemSpacing = LineSpacing;
    self.minimumLineSpacing = LineSpacing;
    self.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, headerReferenceHeight);
}
@end
