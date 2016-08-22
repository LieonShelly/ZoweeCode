//
//  ZEToolTabeleView.h
//  ZoweeSale
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZEToolTabeleView;
@protocol ZEToolTabeleViewDelegate <NSObject>

@optional
- (void)toolTabeleViewDidSelcetedIndexPath:(NSIndexPath*)indexpath;

@end

@interface ZEToolTabeleView : UITableView 

@property(nonatomic,strong) NSArray * items;

@property (nonatomic,weak) id<ZEToolTabeleViewDelegate> toolDelegate;

@end
