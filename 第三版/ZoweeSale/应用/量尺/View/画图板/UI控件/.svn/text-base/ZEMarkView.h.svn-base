//
//  ZEMarkView.h
//  ZoweeSale
//
//  Created by lieon on 16/6/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ZEMarkViewTypeHorison,
    ZEMarkViewTypeVertical,
}ZEMarkViewType;

@interface ZEMarkView : UIView


@property (nonatomic ,copy) NSString * text;

@property (nonatomic ,strong) UILabel * textLabel;

+ (instancetype) markViewWithType:(ZEMarkViewType)type;


@end


typedef enum{
    ZEArrowTypeHorision,
    ZEArrowTypeVertical,
    
}ZEArrowType;

@interface ZEArrow : UIView

@property (nonatomic ,strong) CAShapeLayer * shapeLayer;


@property (nonatomic)ZEArrowType type;

@end


