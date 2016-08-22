//
//  ZWWSubUIContainer.m
//  easyMeasure
//
//  Created by apple on 16/5/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#define defaultFrame CGRectMake(0, 0, 96, 96)
#define arrowInset 40
#define animationDuration 0.1
#define selfWidth (self.btn.width)
#define selfHeight (self.btn.height)

#import "ZWWSubUIContainer.h"
#import "ZEEditArrow.h"

@interface ZWWSubUIContainer ()

@property(nonatomic,weak) CAShapeLayer  * shapeLayer;
@property (nonatomic ,strong) ZESectorView * sector;
@property (nonatomic,strong) UIPanGestureRecognizer * doorPan;
@property (nonatomic,strong) CABasicAnimation * rotateAnimation;
@property (nonatomic ,strong) ZEEditArrow * editArrow;

@end
@implementation ZWWSubUIContainer
{
    CGPoint _center ;
    CGPoint _startPoint ;
    CGPoint _endPoint;
    CGFloat _staerAngle;
    CGFloat _endAngle;
    CGFloat _radius;
    CGRect _frame; // shapeLayer的frame(外部只需要改变frame的值即可)
    
}

#pragma mark - getter

- (ZESectorView *)sector
{
    if (_sector == nil) {
        _sector = [[ZESectorView alloc]init];
    }
    return _sector;
}

- (ZEEditArrow *)editArrow
{
    if (_editArrow == nil) {
        _editArrow = [[ZEEditArrow alloc]init];
    }
    return _editArrow;
}

- (UIPanGestureRecognizer *)doorPan
{
    if (_doorPan == nil) {
        _doorPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveDoorPan:)];
    }
    return _doorPan;
}

#pragma mark - 外部接口
- (void)setBelongedWall:(ZWWallLayer *)belongedWall
{
    _belongedWall = belongedWall;
    
    switch (self.wsubInfo.WSGroup.integerValue) {
        case ZEFurnitureGroupTypeWindow:
            [self creatWindow];
            break;
            
        case ZEFurnitureGroupTypeDoor:
            [self creatDoor];
            break;
    }
    
    // 通过遍历墙体编号，知道墙的方位
    if (_belongedWall.wall.WallNo.integerValue %2 ==0 ) {
        self.isHorison = YES;
  
    }else{
        
        self.isVertical = YES;
        // 判断控件将要输出的类型
      
    }
   
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.btn.size = image.size;
    [self.btn setImage:image forState:UIControlStateNormal];
}

- (void)singleOpenDoorLeftAndRightExchange
{
    if (self.isHorison) { // 水平方向
        if (self.wsubInfo.WSInSides.integerValue == 0) { // (0,向内，1，向外)
            if (self.wsubInfo.WSSides.integerValue == 0) { // (0,向左，1，向右)
                [self sectorViewHorisonInSideWithLeftToRight];
                return;
            }
            if (self.wsubInfo.WSSides.integerValue == 1) { // (0,向左，1，向右)
                [self sectorViewHorisonInSideWithRightToLeft];
                return;
            }
            
        }
        if (self.wsubInfo.WSInSides.integerValue == 1) // 向外
        {
            if (self.wsubInfo.WSSides.integerValue == 0) { // (0,向左，1，向右)
                [self sectorViewHorisonOutSideWithLeftToRight];
                return;
            }
            if (self.wsubInfo.WSSides.integerValue == 1) { // (0,向左，1，向右)
                [self sectorViewHorisonOutSideWithRightToLeft];
                return;
            }
        }
    }
    
    if (self.isVertical) {
        if (self.wsubInfo.WSInSides.integerValue == 0) // 向内
        {
            if (self.wsubInfo.WSSides.integerValue == 0) { // 向左
                [self sectorViewVerticalInSideWithLeftToRight];
                return;
            }
            if (self.wsubInfo.WSSides.integerValue == 1) { // 向右
                [self sectorViewVerticalInSideWithRightToLeft];
                return;
            }
        }
        if (self.wsubInfo.WSInSides.integerValue == 1)
        {
            if (self.wsubInfo.WSSides.integerValue == 0) { // 向左
                [self sectorViewVerticalOutSideWithLeftToRight];
                return;
            }
            if (self.wsubInfo.WSSides.integerValue == 1) { // 向右
                [self sectorViewVerticalOutSideWithRightToLeft];
                return;
            }
        }
        
    }

}

/**
 *  左右对调
 */
- (void)leftAndRightExchange

{
    switch (self.wsubInfo.WSType.integerValue) {
        case ZEFurnitureTypeDoubleOpenDoor:
            
            break;
        case ZEFurnitureTypeSingleOpenDoor:
            [self singleOpenDoorLeftAndRightExchange];
            break;
        default:
            break;
    }
}




/**
 *  里外对调
 */
- (void)outAndInnerExchange
{
    
    switch (self.wsubInfo.WSType.integerValue) {
        case ZEFurnitureTypeSingleOpenDoor:
            [self singleDoorOutAndInner];
            break;
        case ZEFurnitureTypeDoubleOpenDoor:
            [self doubleOpenDoorOutAndInner];
            break;
        default:
            break;
    }
    
}

- (void)doubleOpenDoorOutAndInner
{
    
    if (self.isHorison) { // 水平方向
        if (self.wsubInfo.WSInSides.integerValue == 0) { // (0,向内，1，向外)
            [self updateLayoutForHorisonOutside];
            [self doubleOpenDoorSectorHorisonWithDownToUp];
            return;
        }
        if (self.wsubInfo.WSInSides.integerValue == 1)
        {
            [self updateLayoutForHorisonInside];
            [self doubleOpenDoorSectorViewHorisonWithUpToDown];
            return;
        }
    }
    
    if (self.isVertical) {
        if (self.wsubInfo.WSInSides.integerValue == 0) { // (0,向内，1，向外)
            [self updateLayoutForVerticalOutside];
            [self doubleOpenDoorSectorViewVerticalLeftToRight];
            return;
        }
        if (self.wsubInfo.WSInSides.integerValue == 1) {
            [self updateLayoutForVerticalInside];
            [self doubleOpenDoorSectorViewVerticalInSideWithRightToLeft];
        }
    }
    
  
    
}
- (void)singleDoorOutAndInner
{
    
    if (self.isHorison) { // 水平方向
        if (self.wsubInfo.WSInSides.integerValue == 0) { // (0,向内，1，向外)
            [self updateLayoutForHorisonOutside];
            [self sectorHorisonOutSideWithRightToLeft];
            return;
        }
        if (self.wsubInfo.WSInSides.integerValue == 1)
        {
            [self updateLayoutForHorisonInside];
            [self sectorViewHorisonInSideWithRightToLeft];
            return;
        }
    }
    
    if (self.isVertical) {
        if (self.wsubInfo.WSInSides.integerValue == 0) { // (0,向内，1，向外)
            [self updateLayoutForVerticalOutside];
            [self sectorViewVerticalOutSideWithLeftToRight];
            return;
        }
        if (self.wsubInfo.WSInSides.integerValue == 1) {
            [self updateLayoutForVerticalInside];
            [self sectorViewVerticalInSideWithRightToLeft];
        }
    }
}
/**
 *  根据模型创建墙体附加物
 */

+ (instancetype)wsubUIWithWSubInfo:(ZEWSubInfo *)wsubInfo belongedWall:wall
{
    NSLog(@"wsubUIWithWSubInfo墙体编号%@----里外属性%@---左右属性%@",wsubInfo.WSWallNo,wsubInfo.WSInSides,wsubInfo.WSSides);
    CGFloat x = wsubInfo.WSSX.floatValue;
    CGFloat y = wsubInfo.WSSY.floatValue;
    CGFloat width = wsubInfo.WSLength.floatValue;
    CGFloat height = wsubInfo.WSHeight.floatValue;
    ZWWSubUIContainer  * subUI = [[ZWWSubUIContainer alloc]init];
    subUI.belongedWall = wall;
    // 赋值数据
    subUI.wsubInfo = wsubInfo;
    subUI.image = [UIImage imageWithWSuInfo:wsubInfo];
    //判断是在水平墙上还是在垂直墙上
    if (wsubInfo.WSWallNo.integerValue %2 == 0)
    {
        subUI.isHorison = YES;
        //判断里外属性
        if (wsubInfo.WSInSides.integerValue == 0) //(0,向内，1，向外)
        {
            [subUI updateLayoutForHorisonInside];
            if (wsubInfo.WSSides.integerValue == 0) // (0,向左，1，向右)
            {
                [subUI sectorViewHorisonInSideWithRightToLeft];
            }
            if (wsubInfo.WSSides.integerValue == 1)
            {
                [subUI sectorViewHorisonInSideWithLeftToRight];
            }
        
        }else if (wsubInfo.WSInSides.integerValue == 1)//向外
        {
            [subUI updateLayoutForHorisonOutside];
            if (wsubInfo.WSSides.integerValue == 0) // (0,向左，1，向右)
            {
                [subUI sectorViewHorisonOutSideWithRightToLeft];
            }
            if (wsubInfo.WSSides.integerValue == 1)
            {
                [subUI sectorViewHorisonOutSideWithLeftToRight];
            }
        }
    
    }
    else {
        subUI.isVertical = YES;
        //判断里外属性
        if (wsubInfo.WSInSides.integerValue == 0) //(0,向内，1，向外)
        {
            [subUI updateLayoutForVerticalInside];
            if (wsubInfo.WSSides.integerValue == 0)// (0,向左，1，向右)
            {
                [subUI sectorViewVerticalInSideWithRightToLeft];
            }
            if (wsubInfo.WSSides.integerValue == 1)
            {
                [subUI sectorViewVerticalInSideWithLeftToRight];
            }
            
        }else if (wsubInfo.WSInSides.integerValue == 1)//向外
            {
             [subUI updateLayoutForVerticalOutside];
             if (wsubInfo.WSSides.integerValue == 0) // (0,向左，1，向右)
             {
                [subUI sectorViewVerticalOutSideWithRightToLeft];
             }
             if (wsubInfo.WSSides.integerValue == 1)
             {
                [subUI sectorViewVerticalOutSideWithLeftToRight];
             }
        }
    }
    subUI.frame = CGRectMake(x, y, width, height);
    [subUI setNeedsLayout];
    return subUI;
}


- (void)updateSubUIInfo
{
    NSLog(@"updateSubUIInfo--%@",NSStringFromCGRect(self.frame));
    self.wsubInfo.WSSX = TwoBitNumber(self.frame.origin.x);
    self.wsubInfo.WSSY = TwoBitNumber(self.frame.origin.y);
    self.wsubInfo.WSLength = TwoBitNumber(self.frame.size.width);
    self.wsubInfo.WSHeight = TwoBitNumber(self.frame.size.height);
}

- (void)convertWsubUIPositionToWorldCoordinate
{
    NSInteger num = self.wsubInfo.WSWallNo.integerValue;
    
    CGFloat wsx = self.belongedWall.wall.WSX.doubleValue;
    CGFloat wsy = self.belongedWall.wall.WSY.doubleValue;
//      NSLog(@"墙体编号:%@,控件的frame:%@,墙体的起点x:%f,墙体的起点y:%f",self.belongedWall.wall.WallNo, NSStringFromCGRect(self.frame),wsx,wsy);
    
    CGFloat sx = 0;
    CGFloat sy = 0;
    CGFloat ex = 0;
    CGFloat ey = 0;
    CGFloat height = 0;
    
    switch (num) {
        case 0:
        {
            sx = self.x - wsx;
            sy = 0;
            height = self.btn.height;
            ex = CGRectGetMaxX(self.frame) - wsx;
            ey = sy;

            break;
        }
        case 1:
        {
            sx = 0;
            sy = self.y - wsy;
            height = self.btn.height;
            ex = 0;
            ey = CGRectGetMaxY(self.frame) - wsy;
            
            break;
        }
        case 2:
            
        {
            sx = CGRectGetMaxX(self.frame) - wsx;
            sy = 0;
            height = self.btn.height;
            ex = self.x - wsx;
            ey =  0;
            
            break;
        }
        case 3:
        {
            sx = 0;
            sy = CGRectGetMaxY(self.frame) - wsy;
            height = self.btn.height;
            ex = sx;
            ey = self.y - wsy;
            
            break;
        }
        
    }
    NSLog(@"墙的起点:%@,控件的frame:%@,相对于第%@号墙-控件的起点%@,终点%@",NSStringFromCGPoint(CGPointMake(wsx, wsy)),NSStringFromCGRect(self.frame), self.belongedWall.wall.WallNo,NSStringFromCGPoint(CGPointMake(sx, sy)),NSStringFromCGPoint(CGPointMake(ex, ey)));
    self.wsubInfo.WSSX = OneBitNumber(sx * convertRatio);
    self.wsubInfo.WSSY = OneBitNumber(sy* convertRatio);
    self.wsubInfo.WSEX = OneBitNumber(ex* convertRatio);
    self.wsubInfo.WSEY = OneBitNumber(ey* convertRatio);
    self.wsubInfo.WSHeight = OneBitNumber(height* convertRatio);
}


#pragma mark - 初始化

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIButton * btn = [[UIButton alloc]init];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        self.btn = btn;
        self.btn.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.sector];
        
        [self addGestureRecognizer:self.doorPan];
        
    }
    return self;
}

#pragma mark -  私有方法

- (void)creatWindow
{
    self.sector.hidden = YES;
    // 判断将要输出哪种窗
    switch (self.wsubInfo.WSType.integerValue) {
        case ZEFurnitureTypeSingleWindow:
            [self creatSingleWindow];
            break;
        case ZEFurnitureTypeBayWindow:
            [self creatBayWindow];
            break;
        case  ZEFurnitureTypeFrenchWindow:
            [self creatFrenchWindow];
            break;
        default:
            break;
    }
}

- (void)creatSingleWindow
{
    
}

- (void)creatBayWindow
{
    
}

- (void)creatFrenchWindow
{
    
}

/**
 *  创建门
 */
- (void)creatDoor
{
    switch (self.wsubInfo.WSType.integerValue) {
        case ZEFurnitureTypeSingleOpenDoor:
            [self creatSingleOpenDoor];
            break;
        case ZEFurnitureTypeDoubleOpenDoor:
            [self creatDoubleOpenDoor];
            break;
            
        case ZEFurnitureTypePushAndPullDoor:
            [self creatPushAndPullDoor];
            break;
    }
    
}

- (void)creatSingleOpenDoor
{
  // 默认是单开门
    switch (self.belongedWall.wall.WallNo.integerValue) {
        case 0:
        case 2:
        {
            self.sector.sectorType = ZESectorViewTypeHorisonThirdQuadrant;
            self.wsubInfo.WSInSides = @(1);
            break;
        
        }
        case 1:
        case 3:
        {
            self.sector.sectorType = ZESectorViewTypeVerticalFirstQuadrant;
            self.wsubInfo.WSInSides = @(0);
            break;
        }
        default:
            break;
    }
}

- (void)creatDoubleOpenDoor
{
    switch (self.belongedWall.wall.WallNo.integerValue) {
        case 0:
        case 2:
        {
            self.sector.sectorType = ZESectorViewTypeHorisonDownDoubleOpen;
            break;
            
        }
        case 1:
        case 3:
        {
            self.sector.sectorType = ZESectorViewTypeVerticalRightDoubleOpen;
            break;
        }
        default:
            break;
    }
}

- (void)creatPushAndPullDoor
{
    self.sector.hidden = YES;
}

- (void)setIsVertical:(BOOL)isVertical
{
    _isVertical = isVertical;
    
    // 布局子控件
    self.btn.width = self.belongedWall.wall.WThick.doubleValue;
    [self updateLayoutForVerticalInside];

}

- (void)setIsHorison:(BOOL)isHorison
{
    _isHorison = isHorison;
    
    //  布局子控件
    self.btn.height = self.belongedWall.wall.WThick.doubleValue;
    [self updateLayoutForHorisonInside];
}



- (void)btnClick:(UIButton*)btn
{
    
    [btn addGestureRecognizer:self.doorPan];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"wsbUIClick" object:nil userInfo:@{@"wsbUI":self}];
}
- (void)moveDoorPan:(UIPanGestureRecognizer*)pan
{
    
    // 发出通知告知控制器，开始拖动了，要求溢出箭头
    [[NSNotificationCenter defaultCenter] postNotificationName:@"subUIIsMoving" object:self];
    
    CGPoint point = [pan locationInView:self.superview];
    
    ZWWallLayer * wallLayer = self.belongedWall;
   
    CGRect range = wallLayer.range;
    
    switch (wallLayer.direction) {
        case ZEWallLayerDirectionHorizontalUp:
        case  ZEWallLayerDirectionHorizontalDown:
        {
            if (point.x >= CGRectGetMaxX(range)- self.width * 0.5) {
                point.x = CGRectGetMaxX(range)- self.width * 0.5;
            }
            if (point.x < range.origin.x +self.width * 0.5) {
                point.x = range.origin.x +self.width * 0.5;
            }
            self.centerX = point.x;
            
        }
            break;
            
        case ZEWallLayerDirectionVerticalLeft:
        case ZEWallLayerDirectionVerticalRight:
        {
            if (point.y >= CGRectGetMaxY(range) - self.height * 0.5) {
                point.y = CGRectGetMaxY(range)- self.height * 0.5;
            }
            if (point.y <= range.origin.y + self.height * 0.5) {
                point.y = range.origin.y + self.height * 0.5;
            }
            self.centerY = point.y;
        }
            break;
    }
    if (pan.state == UIGestureRecognizerStateEnded) {
        [pan.view removeGestureRecognizer:pan];
        [self updateSubUIInfo];
    }

}


/**
 *  更新水平向屋内的约束
 */

- (void)updateLayoutForHorisonInside
{
    self.wsubInfo.WSInSides = [NSNumber numberWithInt:0];
    
    self.btn.sd_layout
    .leftSpaceToView(self,0)
    .topSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(self.btn.height);
    [self.btn updateLayout];
    
    
    [self.sector sd_resetLayout];
    self.sector.sd_layout
    .leftEqualToView(self.btn)
    .rightEqualToView(self.btn)
    .heightIs(self.btn.width)
    .topSpaceToView(self.btn,0);
    [self.sector updateLayout];
    [self updateSubUIInfo];
}

/**
 *  更新水平向屋外的约束
 */
- (void)updateLayoutForHorisonOutside
{
    [self.sector sd_resetLayout];
    self.wsubInfo.WSInSides = [NSNumber numberWithInt:1];
    self.btn.sd_layout
    .leftSpaceToView(self,0)
    .topSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(self.btn.height);
    [self.btn updateLayout];
    
    [self.sector sd_resetLayout];
    self.sector.sd_layout
    .leftEqualToView(self.btn)
    .rightEqualToView(self.btn)
    .heightIs(self.btn.width)
    .bottomSpaceToView(self.btn,0);
    [self.sector updateLayout];
    
    [self updateSubUIInfo];
}

/**
 *  更新垂直向屋外的约束
 */
- (void)updateLayoutForVerticalOutside
{
    
    self.wsubInfo.WSInSides = @(1);
    // 布局子控件
    self.btn.sd_layout
    .topSpaceToView(self,0)
    .bottomSpaceToView(self,0)
    .leftSpaceToView(self,0)
    .widthIs(self.btn.width);
    [self.btn updateLayout];
    
    
    [self.sector sd_resetLayout];
    self.sector.sd_layout
    .topEqualToView(self.btn)
    .bottomEqualToView(self.btn)
    .widthIs(self.height)
    
    .rightSpaceToView(self.btn,0);
    [self.sector updateLayout];
    
    self.sector.sd_layout
    .widthIs(self.sector.height);
    [self.sector updateLayout];
    
    [self updateSubUIInfo];
}

/**
 *  更新垂直向屋内的约束
 */
- (void)updateLayoutForVerticalInside
{
    // 设置里外属性
    self.wsubInfo.WSInSides = @(0);
    // 布局子控件
    self.btn.sd_layout
    .topSpaceToView(self,0)
    .bottomSpaceToView(self,0)
    .leftSpaceToView(self,0)
    .widthIs(self.btn.width);
    [self.btn updateLayout];
    
    
    [self.sector sd_resetLayout];
    self.sector.sd_layout
    .topEqualToView(self.btn)
    .bottomEqualToView(self.btn)
    .widthIs(self.height)
    
    .leftSpaceToView(self.btn,0);
    [self.sector updateLayout];
    
    self.sector.sd_layout
    .widthIs(self.sector.height);
    [self.sector updateLayout];
    
    
    [self updateSubUIInfo];
}

/**
 *
 *水平向内左--->右
 */

- (void)sectorViewHorisonInSideWithLeftToRight
{
    self.sector.sectorType = ZESectorViewTypeHorisonForthQuadrant;
    self.wsubInfo.WSSides = @(1);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}
/**
 *
 *水平向内右--->左
 */
- (void)sectorViewHorisonInSideWithRightToLeft
{
    self.sector.sectorType = ZESectorViewTypeHorisonThirdQuadrant;
    self.wsubInfo.WSSides = @(0);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}

/**
 *  垂直向内 左--->右
 */
- (void)sectorViewVerticalInSideWithLeftToRight
{
    self.sector.sectorType = ZESectorViewTypeVerticalForthQuadrant;
    self.wsubInfo.WSSides = @(1);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}

/**
 *  垂直向内 左--->右
 */
- (void)sectorViewVerticalInSideWithRightToLeft
{
    self.sector.sectorType = ZESectorViewTypeVerticalFirstQuadrant;
    self.wsubInfo.WSSides = @(0);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}



/**
 *
 *水平向外左--->右
 */

- (void)sectorViewHorisonOutSideWithLeftToRight
{
    self.sector.sectorType = ZESectorViewTypeHorisonFirstQuadrant;
    self.wsubInfo.WSSides = @(1);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}

- (void)sectorHorisonOutSideWithRightToLeft
{
    
    [self sectorViewHorisonOutSideWithRightToLeft];
}


/**
 *
 *水平向外右--->左
 */
- (void)sectorViewHorisonOutSideWithRightToLeft
{
    NSLog(@"----%ld",(long)self.wsubInfo.WSType.integerValue);
    self.sector.sectorType = ZESectorViewTypeHorisonSecondQuadrant;
    self.wsubInfo.WSSides = @(0);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}



- (void)doubleOpenDoorSectorHorisonWithDownToUp
{
    self.sector.sectorType = ZESectorViewTypeHorisonUpDoubleOpen;
    self.wsubInfo.WSSides = @(1);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}

- (void)doubleOpenDoorSectorViewHorisonWithUpToDown
{
    self.sector.sectorType = ZESectorViewTypeHorisonDownDoubleOpen;
    self.wsubInfo.WSSides = @(0);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}

- (void)doubleOpenDoorSectorViewVerticalLeftToRight
{
    self.sector.sectorType = ZESectorViewTypeVerticalLeftDoubleOpen;
    self.wsubInfo.WSSides = @(1);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}

- (void)doubleOpenDoorSectorViewVerticalInSideWithRightToLeft
{
    self.sector.sectorType = ZESectorViewTypeVerticalRightDoubleOpen;
    self.wsubInfo.WSSides = @(0);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}
/**
 *  垂直向外 左--->右
 */
- (void)sectorViewVerticalOutSideWithLeftToRight
{
    self.sector.sectorType = ZESectorViewTypeVerticalThirdQuadrant;
    self.wsubInfo.WSSides = @(1);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}

/**
 *  垂直向外 左--->右
 */
- (void)sectorViewVerticalOutSideWithRightToLeft
{
    self.sector.sectorType = ZESectorViewTypeVerticalSecondQuadrant;
    self.wsubInfo.WSSides = @(0);
    [self.sector setNeedsLayout];
    
    [self updateSubUIInfo];
}

@end


@implementation ZESectorView

- (CAShapeLayer *)shapeLayer
{
    if (_shapeLayer == nil) {
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.fillColor = nil;
        _shapeLayer.strokeColor = [UIColor darkGrayColor].CGColor;
        _shapeLayer.lineWidth = 2;
    }
    return _shapeLayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.layer addSublayer:self.shapeLayer];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.shapeLayer.frame = self.bounds;
    
    UIBezierPath * path = nil;
    switch (self.sectorType) {
        case ZESectorViewTypeVerticalFirstQuadrant:
        {
            path =  [self drawVerticalFirstQuadrantPath];
            break;
        }
        
        case ZESectorViewTypeVerticalSecondQuadrant:
        {
            path = [self drawVerticalSecondQuadrantPath];
            break;
        }
            case ZESectorViewTypeVerticalThirdQuadrant:
        {
            path = [self drawnVerticalThiirdQuadrantPath];
            break;
        }
            case ZESectorViewTypeVerticalForthQuadrant:
        {
            path = [self drawnVerticalForthQuadrantPath];
            break;
        }
            case ZESectorViewTypeHorisonFirstQuadrant:
        {
            path = [self drawHorisonFirstQuadrantPath];
            break;
        }
            case ZESectorViewTypeHorisonSecondQuadrant:
        {
            path = [self drawHorisonSecondQuadrantPath];
            break;
        }
            case ZESectorViewTypeHorisonThirdQuadrant:
        {
            path = [self drawnHorisonThiirdQuadrantPath];
            break;
        }
            case ZESectorViewTypeHorisonForthQuadrant:
        {
            path = [self drawnHorisonForthQuadrantPath];
            
            break;
        }
            
        case ZESectorViewTypeHorisonDownDoubleOpen:
        {
            path = [self drawnHorisonDownDoubleOpenPath];
            
            break;
        
        }
       case ZESectorViewTypeVerticalRightDoubleOpen:
        {
            path = [self drawnVerticalRightDoubleOpenPath];
            break;
        }
      case ZESectorViewTypeHorisonUpDoubleOpen:
        {
            path = [self drawnHorisonUpDoubleOpenPath];
            break;
        }
            case ZESectorViewTypeVerticalLeftDoubleOpen:
        {
            path = [self drawnVerticalLeftDoubleOpenPath];
            break;
        }
            
            
    }
    
    self.shapeLayer.path = path.CGPath;
}

- (UIBezierPath*)drawnVerticalLeftDoubleOpenPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.width, 0) radius:self.height *0.5 startAngle:M_PI * 0.5 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(self.width, 0)];
    [path addLineToPoint:CGPointMake(self.width, self.height * 0.5)];
    [path closePath];
    
    [path moveToPoint:CGPointMake(self.width, self.height)];
    [path addLineToPoint:CGPointMake(self.width * 0.5, self.height)];
    [path addArcWithCenter:CGPointMake(self.width, self.height) radius:self.height *0.5 startAngle:M_PI  endAngle:M_PI * 1.5 clockwise:YES];
    [path addLineToPoint:CGPointMake(self.width, self.height)];
    [path closePath];
    return path;
}
/**
 *  垂直方向双开门
 */
- (UIBezierPath*)drawnVerticalRightDoubleOpenPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(0, self.height) radius:self.height * 0.5 startAngle:1.5 * M_PI endAngle:0 clockwise:YES];
    [path addLineToPoint:CGPointMake(0 ,self.height)];
    
    [path addLineToPoint:CGPointMake(0, self.height * 0.5)];
    [path closePath];
    
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(self.height * 0.5  , 0)];
    [path addArcWithCenter:CGPointMake(0, 0) radius:self.height * 0.5 startAngle:0 endAngle:M_PI *0.5 clockwise:YES];
    [path addLineToPoint:CGPointMake(0, 0)];
    [path closePath];
    return path;
    
}
/**
 *  垂直方向第一象限
 *
 */
- (UIBezierPath*)drawVerticalFirstQuadrantPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(0, self.height) radius:self.height startAngle:M_PI * 1.5 endAngle:0 clockwise:YES];
    [path addLineToPoint:CGPointMake(0, self.height)];
    [path addLineToPoint:CGPointMake(0, 0)];
    [path closePath];
    return path;
}
/**
 *  垂直方向第二象限
 *
 */
- (UIBezierPath*)drawVerticalSecondQuadrantPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.width, self.height) radius:self.height startAngle:M_PI endAngle:M_PI * 1.5 clockwise:YES];
    [path addLineToPoint:CGPointMake(self.width, 0)];
    [path addLineToPoint:CGPointMake(self.width, self.height)];
    [path closePath];
    return path;
}

/**
 *  垂直方向第三象限
 *
 */
- (UIBezierPath*)drawnVerticalThiirdQuadrantPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.width, self.height)];
    [path addArcWithCenter:CGPointMake(self.width, 0) radius:self.height startAngle:M_PI * 0.5 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(self.width, 0)];
    [path addLineToPoint:CGPointMake(self.width, self.height)];
    [path closePath];
    return path;
}


/**
 *  垂直方向第四象限
 *
 */
- (UIBezierPath*)drawnVerticalForthQuadrantPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(0, 0) radius:self.height startAngle:0 endAngle:M_PI * 0.5 clockwise:YES];
    [path addLineToPoint:CGPointMake(0, 0)];
    [path closePath];
    return path;
}

/**
 *  水平方向双开向下门
 */
- (UIBezierPath*)drawnHorisonDownDoubleOpenPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(0, 0) radius:self.width * 0.5 startAngle:0 endAngle:M_PI * 0.5 clockwise:YES];
    [path addLineToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(self.width * 0.5, 0)];
    [path closePath];
    
    [path moveToPoint:CGPointMake(self.width, 0)];
    
    [path addLineToPoint:CGPointMake(self.width , self.width * 0.5)];
    [path addArcWithCenter:CGPointMake(self.width, 0) radius:self.width * 0.5 startAngle:M_PI * 0.5 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(self.width, 0)];
    [path closePath];
    return path;
}

/**
 *  水平方向双开向上门
 */
- (UIBezierPath*)drawnHorisonUpDoubleOpenPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(0, self.height) radius:self.width * 0.5 startAngle:1.5 * M_PI endAngle:0 clockwise:YES];
    [path addLineToPoint:CGPointMake(0,self.height )];
    [path closePath];
    
    [path moveToPoint:CGPointMake(self.width, self.height)];
    [path addLineToPoint:CGPointMake(self.width*0.5 , self.height)];
    [path addArcWithCenter:CGPointMake(self.width, self.height) radius:self.width * 0.5 startAngle:M_PI  endAngle:M_PI * 1.5 clockwise:YES];
    [path addLineToPoint:CGPointMake(self.width, self.height)];
    [path closePath];
    return path;
}

/**
 *  水平方向第一象限
 *
 */
- (UIBezierPath*)drawHorisonFirstQuadrantPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(0,self.height) radius:self.width startAngle:M_PI * 1.5 endAngle:0 clockwise:YES];
    [path addLineToPoint:CGPointMake(0,self.height)];
    [path closePath];
    return path;
}
/**
 *  水平方向第二象限
 *
 */
- (UIBezierPath*)drawHorisonSecondQuadrantPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.width, self.height) radius:self.width startAngle:M_PI endAngle:M_PI * 1.5 clockwise:YES];
    [path addLineToPoint:CGPointMake(self.width, self.height)];
    [path closePath];
    return path;
}

/**
 *  水平方向第三象限
 *
 */
- (UIBezierPath*)drawnHorisonThiirdQuadrantPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.width, 0) radius:self.width startAngle:M_PI * 0.5 endAngle:M_PI clockwise:YES];
    [path addLineToPoint:CGPointMake(self.width, 0)];
    [path closePath];
    return path;
}


/**
 *  水平方向第四象限
 *
 */
- (UIBezierPath*)drawnHorisonForthQuadrantPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(0, 0) radius:self.width startAngle:0 endAngle:M_PI * 0.5 clockwise:YES];
    [path addLineToPoint:CGPointMake(0, 0)];
    [path closePath];
    return path;
}



@end


@implementation ZEWusbUIBtn

- (CAShapeLayer *)btnShapeLayer
{
    if (_btnShapeLayer == nil) {
        _btnShapeLayer = [CAShapeLayer layer];
        _btnShapeLayer.fillColor = nil;
        _btnShapeLayer.strokeColor = [UIColor darkGrayColor].CGColor;
        
    }
    return _btnShapeLayer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame: frame]) {
        [self.layer addSublayer:self.btnShapeLayer];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews ];
    switch (self.shapeType) {
        case ZEWusbUIBtnHorizonDoor:
            
            break;
        case ZEWusbUIBtnVerticalDoor:
        break;
        case ZEWusbUIBtnHorizonWindow:
        break;
        case ZEWusbUIBtnVerticalWindow:
        break;
        default:
            break;
    }
}
@end