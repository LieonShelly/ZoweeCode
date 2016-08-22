//
//  ZEChooseIcon.h
//  ZoweeSale
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ZEChooseIconButtonTypeCamera,
    ZEChooseIconButtonTypeAblum,
    ZEChooseIconButtonTypeCancil,
}ZEChooseIconButtonType;

@class ZEChooseIcon;
@protocol  ZEChooseIconDelegate<NSObject>

- (void)ZEChooseIcon:(ZEChooseIcon*)icon DidClickBtn:(ZEChooseIconButtonType)buttonType;

@end

@interface ZEChooseIcon : UIView

@property (nonatomic,weak) id<ZEChooseIconDelegate>delegate;

+ (instancetype)chooseIcon;
@end
