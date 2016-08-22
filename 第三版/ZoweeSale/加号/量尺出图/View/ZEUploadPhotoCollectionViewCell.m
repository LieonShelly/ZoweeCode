//
//  ZEUploadPhotoCollectionViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/6/2.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEUploadPhotoCollectionViewCell.h"


@interface ZEUploadPhotoCollectionViewCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeightCons;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewWithCons;

@end
@implementation ZEUploadPhotoCollectionViewCell
{
    CGFloat _with;
    CGFloat _height;
    
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    _with = self.imageViewWithCons.constant;
    _height = self.imageViewHeightCons.constant;
}

- (IBAction)btnClick:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cellBtnDidClik" object:self userInfo:@{@"data":self.photoData}];
}


- (void)setPhotoData:(NSData*)photoData
{
    if (!photoData) {
        return;
    }
    _photoData = photoData;
//    self.btn.backgroundColor = lieonRandomColor;
    self.imageView.image = [UIImage imageWithData:_photoData];
}

- (void)setIsLastRow:(BOOL)isLastRow
{
    _isLastRow = isLastRow;
    self.btn.hidden = isLastRow;
    if (isLastRow) {
        self.imageViewWithCons.constant =  _with;
        self.imageViewHeightCons.constant = _height;
    }else{
        
        self.imageViewWithCons.constant =  self.width;
        self.imageViewHeightCons.constant = self.height;
    }
    [self layoutIfNeeded];
    
}
@end
