//
//  ZERecommandView.h
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZERecommandView,ZERecommandModel;
@protocol ZERecommandViewDelegate <NSObject>

@optional
- (void)recommandView:(ZERecommandView*)recommandView DidSlectedItem:(ZERecommandModel*)model;

@end
@interface ZERecommandView : UICollectionView


@property (nonatomic ,strong) NSArray * dataArray;
@property (nonatomic,weak)  id<ZERecommandViewDelegate> recommandDelegate;

@end
