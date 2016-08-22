//
//  UIImage+Image.m
//

#import "UIImage+Image.h"

// 创建的UIImage的子类，在这里面写一个类方法。使图片不被渲染
@implementation UIImage (Image)
+(instancetype)imageWithRenderOriginalName:(NSString*)name
{
    UIImage * selImage = [UIImage imageNamed:name];
//不让图片被渲染
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return selImage;
}

/**
 *  拉伸图片，宽高的一半不被拉伸，相当于9切片技术
 */

+(UIImage *)resizedImageWithName:(NSString*)name
{
    UIImage * image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

+ (UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size
{
    //开启基于图形的上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //画一个color颜色的矩形框
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    //拿到图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}

/**
 *   
 ZEFurnitureTypeSingleOpenDoor = 0,//  单开门
 ZEFurnitureTypeDoubleOpenDoor = 1,// 双开门
 ZEFurnitureTypePushAndPullDoor = 2,// 推拉门
 ZEFurnitureTypeSingleWindow = 3,//单扇窗
 ZEFurnitureTypeBayWindow = 4, // 飘窗
 ZEFurnitureTypeFrenchWindow = 5,// 落地窗
 */

+ (UIImage *)imageWithWSuInfo:(ZEWSubInfo *)wsubInfo
{
   
    NSDictionary * imageNameDict = @{
           //单开门
          @"00":@"singleOpen_door_horison",
          @"20":@"singleOpen_door_horison",
          @"10":@"singleOpen_door_vertical",
          @"30":@"singleOpen_door_vertical",
          // 双开门
          @"01":@"singleOpen_door_horison",
          @"11":@"singleOpen_door_vertical",
          @"21":@"singleOpen_door_horison",
          @"31":@"singleOpen_door_vertical",
          // 推拉门
          @"02":@"PushAndPull_Horision_door",
          @"12":@"PushAndPull_Vertical_door",
          @"22":@"PushAndPull_Horision_door",
          @"32":@"PushAndPull_Vertical_door",
          // 单扇窗
          @"03":@"singleOpen_door_horison",
          @"13":@"singleOpen_door_vertical",
          @"23":@"singleOpen_door_horison",
          @"33":@"singleOpen_door_vertical",
          // 飘窗
          @"04":@"BayWindow_Horison",
          @"14":@"BayWindow_Vertical",
          @"24":@"BayWindow_Horison",
          @"34":@"BayWindow_Vertical",
          // 落地窗
          @"05":@"FrenchWindow_Horison",
          @"15":@"FrenchWindow_Vertical",
          @"25":@"FrenchWindow_Horison",
          @"35":@"FrenchWindow_Vertical",
          
                                     
                                     };
/** String墙体编号 */
    NSString * WNum = wsubInfo.WSWallNo;
/* 0 代表门  1代表窗  2 代表 墙柱*/
    NSInteger WSType = wsubInfo.WSType.integerValue;
    NSString * wstypeStr = [NSString stringWithFormat:@"%ld",(long)WSType];
    NSString * key = [WNum stringByAppendingString:wstypeStr];
    NSString * imageName = imageNameDict[key];
    UIImage * image = [UIImage imageNamed:imageName];
    return image;
}
@end
