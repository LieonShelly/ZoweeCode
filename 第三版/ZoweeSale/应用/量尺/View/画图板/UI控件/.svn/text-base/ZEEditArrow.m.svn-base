//
//  ZEEditArrow.m
//  ZoweeSale
//
//  Created by lieon on 16/6/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#define arrowInset 50

#import "ZEEditArrow.h"

@interface ZEEditArrow ()

@property (nonatomic,strong) UIPanGestureRecognizer * arrowPan;

@end

@implementation ZEEditArrow


- (UIPanGestureRecognizer *)arrowPan
{
    
    if (_arrowPan == nil) {
        _arrowPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(arrowPanAction:)];
    }
    return _arrowPan;
}

- (ZEArrowButton *)arrowLeft
{
    if (_arrowLeft == nil) {
        _arrowLeft = [[ZEArrowButton alloc]init];
        _arrowLeft.image = [UIImage imageNamed:@"image_arrow_left"];
        
        _arrowLeft.type = ZEArrowButtonTypeLeft;
        UIPanGestureRecognizer * pan =  [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(arrowPanAction:)];
        [_arrowLeft addGestureRecognizer:pan];
         _arrowLeft.userInteractionEnabled = YES;

        _arrowLeft.size = CGSizeMake(arrowInset, arrowInset);
//        _arrowLeft.backgroundColor = lieonRandomColor;
        [_arrowLeft setContentMode:UIViewContentModeTop];
    }
    return _arrowLeft;
}

- (ZEArrowButton *)arrrowRight
{
    if (_arrrowRight == nil) {
        _arrrowRight = [[ZEArrowButton alloc]init];
        _arrrowRight.image = [UIImage imageNamed:@"image_arrow_right"];
        _arrrowRight.size = CGSizeMake(arrowInset, arrowInset);
        
        UIPanGestureRecognizer * pan =  [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(arrowPanAction:)];
        _arrrowRight.type = ZEArrowButtonTypeRight;
        [_arrrowRight addGestureRecognizer:pan];
        _arrrowRight.contentMode = UIViewContentModeTop;
//        _arrrowRight.backgroundColor = lieonRandomColor;
        _arrrowRight.userInteractionEnabled = YES;
    }
    return _arrrowRight;
}

- (ZEArrowButton *)arrowUp
{
    if (_arrowUp == nil) {
        _arrowUp = [[ZEArrowButton alloc]init];
        
        _arrowUp.image = [UIImage imageNamed:@"image_arrow_up"];
        _arrowUp.size = CGSizeMake(arrowInset, arrowInset);
        _arrowUp.contentMode = UIViewContentModeLeft;
        _arrowUp.type = ZEArrowButtonTypeUp;
         UIPanGestureRecognizer * pan =  [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(arrowPanAction:)];
        [_arrowUp addGestureRecognizer:pan];
//        _arrowUp.backgroundColor = lieonRandomColor;
        _arrowUp.userInteractionEnabled = YES;

    }
    return _arrowUp;
}

- (ZEArrowButton *)arrowDown
{
    if (_arrowDown == nil) {
        _arrowDown = [[ZEArrowButton alloc]init];
        _arrowDown.image = [UIImage imageNamed:@"image_arrow_down"];
        _arrowDown.size = CGSizeMake(arrowInset, arrowInset);
        _arrowDown.contentMode = UIViewContentModeLeft;
        UIPanGestureRecognizer * pan =  [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(arrowPanAction:)];
        _arrowDown.type = ZEArrowButtonTypeDown;
        [_arrowDown addGestureRecognizer:pan];
//        _arrowDown.backgroundColor = lieonRandomColor;
        _arrowDown.userInteractionEnabled = YES;
    }
    return _arrowDown;
}



#pragma maek - publickMethod
- (void)removeArrow
{
    [self.arrrowRight removeFromSuperview];
    [self.arrowLeft removeFromSuperview];
    [self.arrowUp removeFromSuperview];
    [self.arrowDown removeFromSuperview];
}


#pragma mark - selfMethod

- (void)arrowPanAction:(UIPanGestureRecognizer*)pan
{
    ZEArrowButton * arrow = (ZEArrowButton*)pan.view;
    CGPoint point = [pan locationInView:arrow.superview];
    if ([self.delegate respondsToSelector:@selector(editArrowButton:IsMoving:)]) {
        [self.delegate editArrowButton:arrow IsMoving:point];
    }
    if (pan.state == UIGestureRecognizerStateEnded) {
        [self.delegate editArrowDidMoved:self];
    }
}


@end
