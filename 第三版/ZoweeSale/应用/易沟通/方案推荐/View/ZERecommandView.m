//
//  ZERecommandView.m
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZERecommandView.h"
#import "ZERecomamndCellLayout.h"
#import "ZERecommandCollectionViewCell.h"

#import "ZERecommandViewController.h"

@interface ZERecommandView()<UICollectionViewDelegate,UICollectionViewDataSource>


@end
@implementation ZERecommandView

- (instancetype)init
{

    ZERecomamndCellLayout * layout = [[ZERecomamndCellLayout alloc]init];
    self.dataSource = self;
    self.delegate = self;
    [self registerNib:[UINib nibWithNibName:@"ZERecommandCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ZERecommandCollectionViewCell"];
    [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
   return  [super initWithFrame:CGRectZero collectionViewLayout:layout];
}

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self reloadData];
}

#pragma mark - UICollectionViewDataSource



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
      return self.dataArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZERecommandCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZERecommandCollectionViewCell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZERecommandModel * model = self.dataArray[indexPath.item];
    if ([self.recommandDelegate respondsToSelector:@selector(recommandView:DidSlectedItem:)]) {
        [self.recommandDelegate recommandView:self DidSlectedItem:model];
    }
}



#pragma mark - getter



@end
