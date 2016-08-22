//
//  ZEPhotoMarkViewController.m
//  ZoweeSale
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEPhotoMarkViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "ZEPhotoMarkTableView.h"
@interface ZEPhotoMarkViewController ()

@end

@implementation ZEPhotoMarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"照相标注";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem =
    [UIBarButtonItem ItemWithImage:@"icon_+" hilghtedImage:@"icon_+" target:self action:@selector(addBtnClick)];
    ZEPhotoMarkTableView * photo = [[ZEPhotoMarkTableView alloc]init];
    photo.frame = self.view.bounds;
    
    [self.view addSubview:photo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addBtnClick{
    
}

@end
