//
//  ZEphotosCollectionView.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEphotosCollectionView.h"
#import "ZEPhotoCollectionViewCell.h"
#import "ZEPhotoCollectionReusableView.h"
#import "ZEphotoFlowLayout.h"
#import "UIImageView+WebCache.h"
#import "HZPhotoBrowser.h"
#import "HZURLNavigation.h"

@interface ZEphotosCollectionView ()<HZPhotoBrowserDelegate>

@end

@implementation ZEphotosCollectionView{
    ZEProejectImage *_image;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    ZEphotoFlowLayout *flowLayout = [[ZEphotoFlowLayout alloc]init];
    self = [self initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[ZEPhotoCollectionViewCell class ] forCellWithReuseIdentifier:@"collectionCell"];
    [self registerClass:[ZEPhotoCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    self.backgroundColor = hexColorString(@"f2f2f2");
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self reloadData];
}


#pragma mark - UICollectionViewDelegate 

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    ZEProejectImage *image = _dataArray[section];
    return image.ImageList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"collectionCell";
    
    ZEPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
    ZEProejectImage *image = _dataArray[indexPath.section];
    cell.imagePath = image.ImageList[indexPath.row];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusable = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        ZEPhotoCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        ZEProejectImage *image = _dataArray[indexPath.section];
        view.title = image.RoomTitle;
        reusable = view;
    }
    return reusable;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //启动图片浏览器
    HZPhotoBrowser *browserVc = [[HZPhotoBrowser alloc] init];
    ZEPhotoCollectionViewCell *collectCell = (ZEPhotoCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    browserVc.sourceImagesContainerView = collectCell.contentView; // 原图的父控件
    _image = _dataArray[indexPath.section];
    browserVc.imageCount = _image.ImageList.count; // 图片总数
    browserVc.currentImageIndex = indexPath.row;
    browserVc.delegate = self;
    [browserVc showWithController:[HZURLNavigation currentViewController]];
    
}
#pragma mark - photobrowser代理方法
- (UIImage *)photoBrowser:(HZPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageList *listPath = _image.ImageList[index];
    [imageView sd_setImageWithURL:[NSURL URLWithString:listPath.ImagePath]];
    return imageView.image;
}

- (NSURL *)photoBrowser:(HZPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    imageList *listPath = _image.ImageList[index];
    return [NSURL URLWithString:listPath.ImagePath];
}
@end
