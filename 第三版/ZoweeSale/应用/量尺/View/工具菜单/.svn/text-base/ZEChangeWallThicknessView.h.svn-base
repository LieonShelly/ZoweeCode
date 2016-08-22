//
//  ZEChangeWallThicknessView.h
//  ZoweeSale
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 TH. All rights reserved.
//


#import <UIKit/UIKit.h>

@class ZEChangeWallThicknessView;
@protocol ZEChangeWallThicknessViewDelegate <NSObject>
@optional
- (void)changeWallThicknessView:(ZEChangeWallThicknessView*)changeWallThicknessView DidChangeWallThickness:(CGFloat)thick;

@end



@interface ZEChangeWallThicknessView : UITableViewCell

@property(nonatomic,weak) id <ZEChangeWallThicknessViewDelegate>delegate;

@property (nonatomic,strong)  NSNumber * WThick;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
