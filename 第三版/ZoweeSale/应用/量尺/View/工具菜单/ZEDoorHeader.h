//
//  ZEDoorHeader.h
//  ZoweeSale
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
   ZEModelTypeDoor,
    ZEModelTypeWindow,
    
}ZEModelType;

@class ZEDoorHeader;
@protocol ZEDoorHeaderDelegate <NSObject>

@optional
- (void)doorHeader:(ZEDoorHeader*)doorHeader didClckChangeBtn:(ZEModelType)type;

@end
@interface ZEDoorHeader : UIView
@property (weak, nonatomic)  UILabel *titleLable;
@property (weak, nonatomic)  UILabel *subTitleLable;
@property (nonatomic,weak)  id<ZEDoorHeaderDelegate> delegate;


@end
