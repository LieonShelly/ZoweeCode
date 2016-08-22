//
//  ZEFurnitureView.h
//  ZoweeSale
//
//  Created by lieon on 16/6/30.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZEFurnitureModel.h"

@class ZEFurnitureView;
@protocol ZEFurnitureViewDelegate <NSObject>

@optional
- (void)furnitureView:(ZEFurnitureView*)furnitureView DidSelcetedFurniture:(ZEFurnitureModel*)furniture;

@end

@interface ZEFurnitureView : UIView
@property (nonatomic ,strong) NSArray * models;
@property (nonatomic,weak)  id<ZEFurnitureViewDelegate> delegate;
@end
