//
//  ZEAppCollectionViewCell.m
//  ZoweeSale
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEAppCollectionViewCell.h"


@interface ZEAppCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;

@end

@implementation ZEAppCollectionViewCell


- (void)setAppIndexModel:(APPIndexModel *)appIndexModel
{
    _appIndexModel = appIndexModel;
    self.imageIcon.image = [UIImage imageNamed:appIndexModel.iconName];
    self.appNameLabel.text = appIndexModel.title;
    
}

@end
