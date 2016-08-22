//
//  ZEEditArrow.h
//  ZoweeSale
//
//  Created by lieon on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZEArrowButton.h"

@class ZEEditArrow;
@protocol ZEEditArrowDelegate <NSObject>

@optional
- (void)editArrowButton:(ZEArrowButton*)arrow IsMoving:(CGPoint)point;
- (void)editArrowDidMoved:(ZEEditArrow *)arrow;

@end
@interface ZEEditArrow : NSObject

@property(nonatomic,strong) ZEArrowButton  * arrowLeft;
@property(nonatomic,strong) ZEArrowButton * arrrowRight;
@property(nonatomic,strong) ZEArrowButton  * arrowUp;
@property(nonatomic,strong) ZEArrowButton  * arrowDown;
@property (nonatomic,weak)  id<ZEEditArrowDelegate> delegate;

- (void)removeArrow;
@end

typedef enum {
    // 单开门的门型
    ZESectorViewTypeVerticalFirstQuadrant,
    ZESectorViewTypeVerticalSecondQuadrant,
    ZESectorViewTypeVerticalThirdQuadrant,
    ZESectorViewTypeVerticalForthQuadrant,
    ZESectorViewTypeHorisonFirstQuadrant,
    ZESectorViewTypeHorisonSecondQuadrant,
    ZESectorViewTypeHorisonThirdQuadrant,
    ZESectorViewTypeHorisonForthQuadrant,
    // 双开门的门型
    ZESectorViewTypeHorisonUpDoubleOpen,
    ZESectorViewTypeHorisonDownDoubleOpen,
    ZESectorViewTypeVerticalLeftDoubleOpen,
    ZESectorViewTypeVerticalRightDoubleOpen
    
}ZESectorViewType;

@interface ZESectorView : UIView

@property (nonatomic ,strong) CAShapeLayer * shapeLayer;


@property (nonatomic) ZESectorViewType sectorType;

@end