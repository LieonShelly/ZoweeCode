//
//  ZEUploadPhotoView.m
//  ZoweeSale
//
//  Created by apple on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#define imgaeInset 2
#define countItemsPerRow 3

#import "ZEUploadPhotoView.h"
#import "THNetWork.h"
#import "ZEUploadPhotoCollectionViewCell.h"
#import "MBProgressHUD+NJ.h"

#import "HUPhotoBrowser.h"
@interface ZEUploadPhotoView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,weak) UIButton  * addBtn;
@end
@implementation ZEUploadPhotoView


- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [self reloadData];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    UICollectionViewFlowLayout * layout =(UICollectionViewFlowLayout*)self.collectionViewLayout;
    CGFloat width = (self.width - imgaeInset * 4) / countItemsPerRow;
    CGFloat height = width;
    layout.itemSize = CGSizeMake(width,height);
    
}
- (instancetype)init
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    [self registerNib:[UINib nibWithNibName:@"ZEUploadCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:@"ZEUploadPhotoCollectionViewCell"];
    self.delegate = self;
    self.dataSource = self;
    
    [self addNotification];
    
    return [super initWithFrame:self.frame collectionViewLayout:layout];
    
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    NSLog(@"uploadView------%lu",self.photoArray.count);
    return self.photoArray.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     NSData* data = self.photoArray[indexPath.item];
    ZEUploadPhotoCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZEUploadPhotoCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.photoData = data;
    if (indexPath.item == self.photoArray.count - 1) {
        cell.isLastRow = YES;
    }else{
        cell.isLastRow= NO;
    }
    if (indexPath.item == 2) {
        cell.hidden = YES;
    }else{
        cell.hidden = NO;
    }
    return cell;
}


#pragma mark - UICollectionViewDelegate

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(imgaeInset, imgaeInset, imgaeInset, imgaeInset);
    
}



//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return imgaeInset;
}



//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return imgaeInset;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.item == self.photoArray.count -1) {
        if ([self.uploadDelegate respondsToSelector:@selector(uploadPhotoViewDidSletectedAddItem:)]) {
            [self.uploadDelegate uploadPhotoViewDidSletectedAddItem:self];
        }
    }else
    {
        
        ZEUploadPhotoCollectionViewCell *cell = (ZEUploadPhotoCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        NSMutableArray * images = [NSMutableArray array];
        for (int i = 0;i<self.photoArray.count-1;i++) {
            NSData * data = self.photoArray[i];
            UIImage * image = [UIImage imageWithData:data];
            [images addObject:image];
        }
        
        [HUPhotoBrowser showFromImageView:cell.imageView withImages:images placeholderImage:nil atIndex:indexPath.row dismiss:nil];
    }
}

#pragma mark - 公共方法

- (void)uploadPhotoWithParam:(NSDictionary*)param
{
    if (self.photoArray.count - 1 == 0) {
        return;
    }
    NSLog(@"uploadPhotoWithParam--%lu",self.photoArray.count-1);
    upLoadFile * file = [[upLoadFile alloc]init];
    for (int i = 0 ; i < self.photoArray.count-1;i++) {
        NSString * photoName = [NSString stringWithFormat:@"photo%d.jpeg",i];
        NSData * data = self.photoArray[i];
        file.fileData = data;
        file.type = @"jpeg";
        file.fileName = photoName ;
        file.name = photoName;
        [[THNetWork  sharedInstance] creatUploadTaskWithParameters:param Action:@"ContractFile" file:file success:^(id response) {
            [MBProgressHUD showSuccess:@"提交成功" toView:self.superview];
            
        } failure:^(NSError *error) {
            [MBProgressHUD showError:@"提交失败" toView:self.superview];
            NSLog(@"error:%@",error);
            return ;
        }];
    }
    
}

#pragma mark - getter

- (NSMutableArray *)photoArray
{
    if (_photoArray == nil) {
        UIImage * image = [UIImage imageNamed: @"+"];
        NSData * data = UIImagePNGRepresentation(image);
        _photoArray = [NSMutableArray arrayWithObject:data];
    }
    return _photoArray;
}

#pragma mark - setter


- (void)setPhotoData:(NSData *)photoData
{
    _photoData = photoData;
    NSData * data = nil;
    UIImage * image = [self thumbnaiWithImage:[UIImage imageWithData:photoData] size:[UIImage imageWithData:photoData].size ];
    data =  UIImageJPEGRepresentation(image, 0.5);
   
    [self.photoArray insertObject:data atIndex:0];
    [self reloadData];
}


#pragma mark - selfMethod




- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(imageViewDidRemove:) name:@"cellBtnDidClik" object:nil];
}


- (void)imageViewDidRemove:(NSNotification*)note
{
    NSData * data = note.userInfo[@"data"];
    for (NSData * otherData in self.photoArray) {
        if ([otherData isEqualToData:data]) {
            [self.photoArray removeObject:data];
            [self reloadData];
            return;
        }
    }
    
}

/** 生成缩略图 */
- (UIImage*) thumbnaiWithImage:(UIImage*)image size:(CGSize) size
{
    
    NSLog(@"size:%@",NSStringFromCGSize(size));
    UIImage *newImage = nil;
    if (nil == image) {
        newImage = nil;
    }else{
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newImage;
}


@end
