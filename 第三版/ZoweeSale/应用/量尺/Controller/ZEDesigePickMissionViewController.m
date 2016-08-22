//
//  ZEDesigePickMissionViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/4/11.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEDesigePickMissionViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "pickMissionCollectionView.h"
#import "ZEDesigeMissionFlowLayout.h"
#import "ZEDesigeMission.h"
#import "ZENewConnectionView.h"
#import "ApplicationManage.h"
@interface ZEDesigePickMissionViewController ()<pickProjcetDelegate>

@property (nonatomic) UILabel *nameLab;

@property (nonatomic) UILabel *phoneNumLab;

@property (nonatomic) UILabel *addressLab;

@property (nonatomic) ZENewConnectionView *connectionView;

@end

@implementation ZEDesigePickMissionViewController{
    pickMissionCollectionView *_collectionView;
}
-(BOOL)shouldAutorotate{
    return YES;
}//是否支持旋转
-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscapeRight ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self UIsetup];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self netWorkingGetProjectList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)UIsetup {
    UIButton *upLoadBtn = [[UIButton alloc]init];
    [self.view addSubview:upLoadBtn];
    [upLoadBtn setImage:ImageWithName(@"icon_upload") forState:UIControlStateNormal];
    //upLoadBtn.frame = CGRectMake(100, 100, 100, 100);
    upLoadBtn.sd_layout
    .bottomSpaceToView(self.view,10)
    .centerXEqualToView(self.view)
    .heightIs(30)
    .widthIs(30);
    
    _addressLab = [UILabel new];
    _addressLab.text = @"";
    _addressLab.font = [UIFont systemFontOfSize:17];
    _addressLab.textColor = hexColorString(@"808080");
    _addressLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_addressLab];
    _addressLab.sd_layout
    .bottomSpaceToView(upLoadBtn,10)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(17);
    
    _phoneNumLab = [UILabel new];
    _phoneNumLab.text = @"";
    _phoneNumLab.font = [UIFont systemFontOfSize:17];
    _phoneNumLab.textColor = hexColorString(@"808080");
    _phoneNumLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_phoneNumLab];
    _phoneNumLab.sd_layout
    .bottomSpaceToView(_addressLab,11)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(17);
    
    _nameLab = [UILabel new];
    _nameLab.text = @"";
    _nameLab.font = [UIFont systemFontOfSize:24];
    _nameLab.textColor = hexColorString(@"2e2e2e");
    _nameLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_nameLab];
    _nameLab.sd_layout
    .bottomSpaceToView(_phoneNumLab,10)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .heightIs(24);
    
    ZEDesigeMissionFlowLayout *flowLayout = [[ZEDesigeMissionFlowLayout alloc] init];
    pickMissionCollectionView *collectionView = [[pickMissionCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collectionView = collectionView;
    _collectionView.Pdelegate = self;
    [self.view addSubview:collectionView];
    collectionView.sd_layout
    .topSpaceToView(self.view,64)
    .bottomSpaceToView(_nameLab,0)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view);
    //   设置将要推出vc的左右Item
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithBackGroundImage:@"icon_+"hilghtedBackGroundImage:@"icon_+" target:self action:@selector(new)];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem ItemWithBackGroundImage:@"icon_back"hilghtedBackGroundImage:@"icon_back" target:self action:@selector(back)];
}

- (void)back{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)new{
    _connectionView = [[ZENewConnectionView alloc]init];
    [_connectionView show];

}

- (void)netWorkingGetProjectList{
    [[ApplicationManage shareManage] GetProjectListBlock:^(THNetWorkError *error, NSArray *list) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
        }else {
            _collectionView.Source = [list copy];
            if ([list count]==0) {
                return ;
            }
            [self setShowMessage:list.firstObject];
        }
    }];
    
}
- (void)setShowMessage:(ZEDesigeMission *)model {
    _nameLab.text = model.CustomerName;
    _phoneNumLab.text = model.Mobile;
    _addressLab.text = model.Address;
}

- (void)pickProject:(ZEDesigeMission *)mission {
    [self setShowMessage:mission];
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
