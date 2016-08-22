//
//  ZEHomeDPhotosViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEHomeDPhotosViewController.h"
#import "ZEphotosCollectionView.h"
#import "ApplicationManage.h"

@interface ZEHomeDPhotosViewController ()

@end

@implementation ZEHomeDPhotosViewController{
    ZEphotosCollectionView *_photoView;
}
-(BOOL)shouldAutorotate{
    
    return YES;
    
}//是否支持旋转

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskLandscapeRight;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self loadImageList];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup {
    self.title = @"相册";
    ZEphotosCollectionView *photoView = [[ZEphotosCollectionView alloc]init];
    [self.view addSubview:photoView];
    _photoView = photoView;
    photoView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0,0, 0, 0));
    
}

- (void)loadImageList {
    if (self.mission.ProjectID.isNoEmpty) {
           [[ApplicationManage shareManage] loadProjectImageWith:self.mission.ProjectID Block:^(THNetWorkError *error, NSArray *imageList) {
               if (error) {
                   NSLog(@"%@",error.errorDescription);
               }else {
                   _photoView.dataArray = imageList;
               }
           }];
    }
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
