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

#import "MBProgressHUD+NJ.h"

@interface ZEHomeDPhotosViewController ()
@property (nonatomic,weak)   ZEphotosCollectionView *photoView;

@end

@implementation ZEHomeDPhotosViewController{
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
    self.photoView = photoView;
    photoView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0,0, 0, 0));
    
}

- (void)loadImageList {
    
    [MBProgressHUD showMessage:@"拼命加载中..." toView:self.view];
    if (self.mission.ProjectID.isNoEmpty) {
           [[ApplicationManage shareManage] loadProjectImageWith:self.mission.ProjectID Block:^(THNetWorkError *error, NSArray *imageList) {
               [MBProgressHUD hideHUDForView:self.view];
               if (error) {
                   [MBProgressHUD showError:@"加载失败了" toView:self.view];
                   NSLog(@"%@",error.errorDescription);
               }else {
                   
                   self.photoView.dataArray = imageList;
                   [MBProgressHUD showSuccess:@"成功加载" toView:self.view];
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
