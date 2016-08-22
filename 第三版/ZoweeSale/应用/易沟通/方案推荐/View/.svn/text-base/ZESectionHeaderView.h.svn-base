//
//  ZESectionHeaderView.h
//  ZoweeSale
//
//  Created by lieon on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

typedef enum {
    ZESectionHeaderViewBtnTypeStyle,
    ZESectionHeaderViewBtnTypeHouseType,
    ZESectionHeaderViewBtnTypeRoomType,
}ZESectionHeaderViewBtnType;

#import <UIKit/UIKit.h>
#import "ZETagModel.h"

@class ZESectionHeaderView;
@protocol ZESectionHeaderViewDelegate  <NSObject>

@optional
- (void)sectionHeaderView:(ZESectionHeaderView*)sectionHeaderView DidClickBtn:(ZESectionHeaderViewBtnType)type;

@end

@interface ZESectionHeaderView : UIView

@property (nonatomic,weak)  id<ZESectionHeaderViewDelegate> delegate;


@property (nonatomic ,strong) ZETagModel  * selectedStyleModel;
@property (nonatomic ,strong) ZETagModel * selectedHourseTypeModel;
@property (nonatomic ,strong) ZETagModel * selectedRoomTypeModel;

@end

@interface ZEheaderBtn : UIButton


@end
