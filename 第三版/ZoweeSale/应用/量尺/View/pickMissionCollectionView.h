//
//  pickMissionCollectionView.h
//  ZoweeSale
//
//  Created by wanglj on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZEDesigeMissionCell.h"

@protocol pickProjcetDelegate <NSObject>

- (void)pickProject:(ZEDesigeMission *)mission;

@end


@interface pickMissionCollectionView : UICollectionView

@property (nonatomic) NSArray *Source;

@property (nonatomic) id<pickProjcetDelegate>Pdelegate;

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;

@end
