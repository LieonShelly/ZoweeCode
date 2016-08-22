//
//  UIBarButtonItem+Extension.m
//


#import "UIBarButtonItem+Extension.h"


/**
 *  创建 UIBarButtonItem的一个分类，在分类中增加一个方法
 */
@implementation UIBarButtonItem (Extension)

+(UIBarButtonItem*)ItemWithBackGroundImage:(NSString*)image hilghtedBackGroundImage:(NSString*)hightImage target:(id)target action:(SEL)action
{
    UIButton * btn= [UIButton new];
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState: UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:hightImage]forState:UIControlStateHighlighted];

    //    btn.bounds= CGRectMake(0, 0, btn.currentBackgroundImage.size.width, btn.currentBackgroundImage.size.height);

    [btn sizeToFit];
    //    监听按钮的点击

    [btn addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+(UIBarButtonItem*)ItemWithBackGroundImage:(NSString*)image target:(id)target action:(SEL)action
{
    UIButton * btn= [UIButton new];
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState: UIControlStateNormal];

    //    btn.bounds= CGRectMake(0, 0, btn.currentBackgroundImage.size.width,
    [btn sizeToFit];
    //    监听按钮的点击

    [btn addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+(UIBarButtonItem*)ItemWithImage:(NSString*)image hilghtedImage:(NSString*)hightImage target:(id)target action:(SEL)action
{
    UIButton * btn= [UIButton new];
    
    [btn setImage:[UIImage imageNamed:image] forState: UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hightImage]forState:UIControlStateHighlighted];
    
    // 保持图片不被拉伸
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
   
    [btn sizeToFit];
    //    监听按钮的点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+ (UIBarButtonItem *)ItemWithBtn:(UIButton *)btn {
    // 保持图片不被拉伸
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [btn sizeToFit];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}


+(UIBarButtonItem*)ItemWithImage:(NSString*)image selectedImage:(NSString*)selectedImage target:(id)target action:(SEL)action
{
    UIButton * btn= [UIButton new];
    
    [btn setImage:[UIImage imageNamed:image] forState: UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImage]forState:UIControlStateSelected];
    
    // 保持图片不被拉伸
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [btn sizeToFit];
    //    监听按钮的点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+ (UIBarButtonItem *)ItemWithTitle:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton new];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithHexString:@"999999"] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [self ItemWithBtn:btn];
}

@end
