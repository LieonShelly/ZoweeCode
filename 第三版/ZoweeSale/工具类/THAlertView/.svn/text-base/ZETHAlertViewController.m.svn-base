//
//  ZETHAlertViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/6/30.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZETHAlertViewController.h"
#import <GPUImage/GPUImage.h>

@interface ZETHAlertViewController ()

@end

@implementation ZETHAlertViewController
{
    UIImageView * bg;
    GPUImageiOSBlurFilter *_blurFilter;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    [self performScreenshotAndBlur];
}

-(void) performScreenshotAndBlur
{
    
    _blurFilter = [[GPUImageiOSBlurFilter alloc] init];
    _blurFilter.blurRadiusInPixels = 2.0;
    
    bg = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];

    UIImage * image = [self convertViewToImage];
    UIImage *blurredSnapshotImage = [_blurFilter imageByFilteringImage:image];
    
    [bg setImage:blurredSnapshotImage];
    bg.alpha = 0.0;
    
    [self.view addSubview:bg];
}

-(UIImage *)convertViewToImage
{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    CGRect rect = [keyWindow bounds];
    UIGraphicsBeginImageContextWithOptions(rect.size,YES,0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [keyWindow.layer renderInContext:context];
    UIImage *capturedScreen = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return capturedScreen;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
