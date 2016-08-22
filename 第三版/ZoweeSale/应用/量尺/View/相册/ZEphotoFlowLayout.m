//
//  ZEphotoFlowLayout.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEphotoFlowLayout.h"

@implementation ZEphotoFlowLayout
-(void)prepareLayout{
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.itemSize = CGSizeMake(160,160);
    self.sectionInset = UIEdgeInsetsMake(0, 32, 0, 0);
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0.0f;
    self.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 46);
}




@end
