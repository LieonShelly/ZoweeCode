//
//  ZEPersonalInfoCell.h
//  ZoweeSale
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZEPersonalInfo.h"

@class ZEPersonalInfoCell;
@protocol ZEPersonalInfoCellDelegate <NSObject>

@optional

- (void)personalInfoCellDidClickIconImgaeView:(ZEPersonalInfoCell*)personalCell;

- (void)personalInfoCell:(ZEPersonalInfoCell*)personalCell DidClickIconImgaeViewToPresentViewController:(UIViewController*)vc animated:(BOOL) flag completion:(void(^)(void))coompletion;


@end
@interface ZEPersonalInfoCell : UITableViewCell

@property(nonatomic,strong) NSData * headerData;

@property(nonatomic,strong) ZEPersonalInfo * userInfos;

@property (nonatomic,weak) id <ZEPersonalInfoCellDelegate> delegate;
@end
