//
//  loginOrBindingViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "loginOrBindingViewController.h"

@interface loginOrBindingViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation loginOrBindingViewController
-(BOOL)shouldAutorotate{
    
    return YES;
    
}//是否支持旋转

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait;
    
}//支持的方向
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUIInit];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)setUIInit {
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame) * 4, 0);
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1"]];
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
    UIImageView *imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3"]];
    UIImageView *imageView4 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4"]];
    self.scrollView.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:imageView1];
    [self.scrollView addSubview:imageView2];
    [self.scrollView addSubview:imageView3];
    [self.scrollView addSubview:imageView4];
    
    imageView1.sd_layout
    .leftSpaceToView(self.scrollView,0)
    .topSpaceToView(self.scrollView,0)
    .widthIs(SCREEN_WIDTH)
    .heightRatioToView(self.scrollView,1);
    
    imageView2.sd_layout
    .leftSpaceToView(imageView1,0)
    .topSpaceToView(self.scrollView,0)
    .widthIs(SCREEN_WIDTH)
    .heightRatioToView(self.scrollView,1);
    
    imageView3.sd_layout
    .leftSpaceToView(imageView2,0)
    .topSpaceToView(self.scrollView,0)
    .widthIs(SCREEN_WIDTH)
    .heightRatioToView(self.scrollView,1);
    
    imageView4.sd_layout
    .leftSpaceToView(imageView3,0)
    .topSpaceToView(self.scrollView,0)
    .widthIs(SCREEN_WIDTH)
    .heightRatioToView(self.scrollView,1);
    
}

#pragma  mark - UIScrollerView 代理


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    //NSLog(@"%@",NSStringFromCGPoint(offset));
    CGFloat x = offset.x;
    NSInteger a = x / SCREEN_WIDTH;
    self.pageControl.currentPage = a;
}


@end
