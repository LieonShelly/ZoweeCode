//
//  UIImage+Image.h
// 
//

#import <UIKit/UIKit.h>

#import "ZEWSubInfo.h"

@interface UIImage (Image)
/**
 * 加载最原始的图片，使其没有渲染
 */
+(instancetype)imageWithRenderOriginalName:(NSString*)name;

+(UIImage *)resizedImageWithName:(NSString*)name;

+ (UIImage*)imageWithColor:(UIColor*)color size:(CGSize)size;
/**
 *  根据传入的墙体附加物模型，返回对应的图片
 门:水平00，垂直是10
 窗：水平01，垂直10
 图片的命名规则：墙的位置方向 + 附加物类型
 */
+ (UIImage*)imageWithWSuInfo:(ZEWSubInfo*)wsubInfo;

@end
