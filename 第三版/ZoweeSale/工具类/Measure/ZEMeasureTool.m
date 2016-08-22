//
//  ZEMeasureTool.m
//  ZoweeSale
//
//  Created by apple on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#define  MarkArrowModelFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"markArrowModel.data"]

#import "ZEMeasureTool.h"
#import "MJExtension.h"
#import "ZEFurnitureModel.h"

@implementation ZEMeasureTool
singleton_implementation(ZEMeasureTool)

- (NSArray *)doorEditOptions
{

    ZEDoorEditOption * optoion = [[ZEDoorEditOption alloc]initWithIconName:@"icon_draw" function:^{
        NSLog(@"便捷尺寸");
    } title:@"编辑尺寸"];
    
    ZEDoorEditOption * optoion1 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_bluetooth" function:^{
        NSLog(@"设备测距");
    } title:@"设备测距"];
    
    ZEDoorEditOption * optoion2 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_left_right" function:^{
        NSLog(@"左右对调");
    } title:@"左右对调"];
    
    ZEDoorEditOption * optoion3 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_inside_outside" function:^{
        NSLog(@"里外对调");
    } title:@"里外对调"];
    
    ZEDoorEditOption * optoion4 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_camera" function:^{
        NSLog(@"拍照批注");
    } title:@"拍照批注"];
    
    ZEDoorEditOption * optoion5 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_delete" function:^{
        NSLog(@"删除");
    } title:@"删除"];

    return @[optoion,optoion1,optoion2,optoion3,optoion4,optoion5];
}

- (NSArray*)wallEditOptions
{
    ZEWallEditOption * option1 = [[ZEWallEditOption alloc]initWithIconName:@"icon_ depth" function:^{
        NSLog(@"默认尺寸");
    } title:@"默认尺寸"];
    
    ZEWallEditOption * option2 = [[ZEWallEditOption alloc]initWithIconName:@"icon_camera" function:^{
        NSLog(@"拍照批注");
    } title:@"拍照批注"];
    // 返回的数组中多添加了一个元素,仅仅是为了使tableview的cell多一个
    return @[@0,option1,option2];
}

- (NSArray *)appendingObjects
{
    ZEDoorEditOption * optoion0 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_draw" function:^{
        NSLog(@"编辑尺寸");
    } title:@"编辑尺寸"];
    
    ZEDoorEditOption * optoion1 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_bluetooth" function:^{
        NSLog(@"蓝牙测距");
    } title:@"蓝牙测距"];
    
    ZEDoorEditOption * optoion2 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_ depth" function:^{
        NSLog(@"默认尺寸");
    } title:@"默认尺寸"];
    
    ZEDoorEditOption * optoion3 = [[ZEDoorEditOption alloc]initWithIconName:@"icon_camera" function:^{
        NSLog(@"拍照批注");
    } title:@"拍照批注"];
    
    return @[optoion0,optoion1,optoion2,optoion3];
}


- (CGFloat)distanceBetweenTwoPointsFirstPoint:(CGPoint)firstPoint secondPoint:(CGPoint)secondPoint
{
   // 在C语言中，可以使用库函数pow(x, y)来表示x^y（当y=2时，即表示x的平方）。

    CGFloat x1 = firstPoint.x;
    CGFloat y1 = firstPoint.y;
    CGFloat x2 = secondPoint.x;
    CGFloat y2 = secondPoint.y;
    
    CGFloat A = pow(x1 - x2, 2);
    CGFloat B = pow(y1 - y2, 2);
    
    return sqrt(A + B);
}


- (NSArray*)furnitureModelWithDoors
{
    ZEFurnitureModel * door = [[ZEFurnitureModel alloc]init];
    door.furnitureName = @"单开门";
    door.furnitureIcon = @"单开门";
    door.furnitureSzie = @"0.82X0.54X0.40m";
    door.furnitureType = ZEFurnitureTypeSingleOpenDoor;
    door.furnitureGroupType = ZEFurnitureGroupTypeDoor;
    
    ZEFurnitureModel * door1 = [[ZEFurnitureModel alloc]init];
    door1.furnitureName = @"双开门";
    door1.furnitureIcon = @"双开门";
    door1.furnitureSzie = @"0.82X0.54X0.40m";
    door1.furnitureGroupType = ZEFurnitureGroupTypeDoor;
    door1.furnitureType = ZEFurnitureTypeDoubleOpenDoor;
    
     ZEFurnitureModel * door2 = [[ZEFurnitureModel alloc]init];
    door2.furnitureName = @"推拉门";
    door2.furnitureIcon = @"推拉门";
    door2.furnitureSzie = @"0.82X0.54X0.40m";
    door2.furnitureGroupType = ZEFurnitureGroupTypeDoor;
    door2.furnitureType = ZEFurnitureTypePushAndPullDoor;
    
    return @[door,door1,door2];
}

- (NSArray*)furnitureModelWithWindows
{
    
    
    ZEFurnitureModel * window = [[ZEFurnitureModel alloc]init];
    window.furnitureName = @"单扇窗";
    window.furnitureIcon = @"单扇窗";
    window.furnitureSzie = @"0.82X0.54X0.40m";
    window.furnitureGroupType = ZEFurnitureGroupTypeWindow;
    window.furnitureType =ZEFurnitureTypeSingleWindow;
    
    ZEFurnitureModel * window1 = [[ZEFurnitureModel alloc]init];
    window1.furnitureName = @"落地窗";
    window1.furnitureIcon = @"落地窗";
    window1.furnitureSzie = @"0.82X0.54X0.40m";
    window1.furnitureGroupType = ZEFurnitureGroupTypeWindow;
    window1.furnitureType = ZEFurnitureTypeFrenchWindow;
    
    ZEFurnitureModel * window2 = [[ZEFurnitureModel alloc]init];
    window2.furnitureName = @"飘窗";
    window2.furnitureIcon = @"飘窗";
    window2.furnitureSzie = @"0.82X0.54X0.40m";
     window2.furnitureGroupType = ZEFurnitureGroupTypeWindow;
    window2.furnitureType = ZEFurnitureTypeBayWindow;
    return @[window,window1,window2];
}

- (CGFloat)rotateAngleWithFirstPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    // 1 .算出两点所在直线的斜率
    CGFloat x1 = startPoint.x;
    CGFloat y1 = startPoint.y;
    CGFloat x2 = endPoint.x;
    CGFloat y2 = endPoint.y;
    CGFloat k = 0;
    // 2.与水平线的夹角
    CGFloat a = 0;
     k = (y2 - y1) / (x2 - x1);
    a = atan(k);
    return a;

   
 
    
}

- (CGPoint)centerBetweenTwoPionts:(CGPoint)startPoint AndEndPoint:(CGPoint)endPoint
{
    CGFloat x1 = startPoint.x;
    CGFloat y1 = startPoint.y;
    CGFloat x2 = endPoint.x;
    CGFloat y2 = endPoint.y;
    CGFloat centeX = fabs(x1 + x2)/2;
    CGFloat centerY = fabs(y1 + y2)/2;
    return  CGPointMake(centeX, centerY);
    
}

- (CGPoint)minimunPointBetweenStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    
    CGFloat x1 = startPoint.x;
    CGFloat y1 = startPoint.y;
    CGFloat x2 = endPoint.x;
    CGFloat y2 = endPoint.y;
    CGFloat x = x1 < x2 ? x1 : x2;
    CGFloat y = y1 < y2 ? y1 :y2;
    
    return CGPointMake(x, y);
}

- (CGSize)rectSizePointBetweenStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    
    CGFloat x1 = startPoint.x;
    CGFloat y1 = startPoint.y;
    CGFloat x2 = endPoint.x;
    CGFloat y2 = endPoint.y;
    CGFloat width = fabs((x1 - x2)) ;
    CGFloat height = fabs((y1 - y2)) ;
    return CGSizeMake(width, height);
}

+ (void)saveMarkArrowModel:(ZEMarkArrowModel *)model
{
    
    [NSKeyedArchiver archiveRootObject:model toFile:MarkArrowModelFilePath];
    
}

+ (ZEMarkArrowModel *)markArrowModel
{
   return  [NSKeyedUnarchiver unarchiveObjectWithFile:MarkArrowModelFilePath];
}

+ (void)clearMarkArrowModel
{
    [NSKeyedArchiver archiveRootObject:@" " toFile:MarkArrowModelFilePath];
}
@end
