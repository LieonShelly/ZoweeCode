//
//  ZEToolTabeleView.h
//  ZoweeSale
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZEToolTableModel.h"

#import "ZEFurnitureModel.h"

@class ZEToolTabeleView;
@protocol ZEToolTabeleViewDelegate <NSObject>

@optional
- (void)toolTabeleView:(ZEToolTabeleView*)toolTableView DidSelcetedFurniture:(ZEFurnitureModel*)furniture;

- (void)toolTabeleView:(ZEToolTabeleView*)toolTableView DidChangeWallThickness:(CGFloat)thickness;

@end

@interface ZEToolTabeleView : UITableView 

@property(nonatomic,strong)ZEToolTableModel *toolTableModel;

@property (nonatomic,weak) UIView * toolHeader;



@property (nonatomic,weak) id<ZEToolTabeleViewDelegate> toolDelegate;


@end
