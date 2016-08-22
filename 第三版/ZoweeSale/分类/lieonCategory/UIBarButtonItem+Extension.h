//
//  UIBarButtonItem+Extension.h
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(UIBarButtonItem*)ItemWithBackGroundImage:(NSString*)image hilghtedBackGroundImage:(NSString*)hightImage target:(id)target action:(SEL)action;
+(UIBarButtonItem*)ItemWithBackGroundImage:(NSString*)image target:(id)target action:(SEL)action;

+(UIBarButtonItem*)ItemWithImage:(NSString*)image hilghtedImage:(NSString*)hightImage target:(id)target action:(SEL)action;

+(UIBarButtonItem *)ItemWithBtn:(UIButton *)btn;

+(UIBarButtonItem*)ItemWithImage:(NSString*)image selectedImage:(NSString*)selectedImage target:(id)target action:(SEL)action;

+(UIBarButtonItem *)ItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
@end
