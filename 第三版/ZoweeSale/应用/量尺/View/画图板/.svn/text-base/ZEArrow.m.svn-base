//
//  ZEArrow.m
//  ZoweeSale
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEArrow.h"

@interface ZEArrow ()
@property(nonatomic,strong) UIImageView * imageView;


@end

@implementation ZEArrow


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    
////    CALayer *imageLayer = [CALayer layer];
//// 
////    imageLayer.contents = (id)[self resizedImageWithName:@"rule"].CGImage;
////    imageLayer.frame = self.bounds;
////
////    [self.layer addSublayer:imageLayer];
//  
//    
//}


- (UIImage *)resizedImageWithName:(NSString*)name
{
    UIImage * image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width   topCapHeight:image.size.height *0.5];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
     
         self.imageView.frame = self.bounds;
        [self addSubview:self.imageView];
    }
    return self;
}

#pragma mark - 懒加载

- (UIImageView *)imageView
{
    if (_imageView == nil) {
//        _imageView.contentMode = UIViewContentModeScaleToFill;
        CGFloat top = 25; // 顶端盖高度
        CGFloat bottom = 25 ; // 底端盖高度
        CGFloat left = 10; // 左端盖宽度
        CGFloat right = 10; // 右端盖宽度
        UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
        UIImage *  image = [UIImage imageNamed:@"rule"];
        
//         UIImage*newImage = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        UIImage *newImage = [self resizedImageWithName:@"rule"];
        
        _imageView = [[UIImageView alloc]initWithImage:newImage];
        
    }
    return _imageView;
}
@end
