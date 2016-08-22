//
//  ZEMeViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEMeViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "ZEPesonalNameViewCell.h"
#import "ZESettingViewCell.h"
#import "ZEPersonalInfoViewController.h"
#import "ZESettingViewController.h"
#import "ZEPersonalInfo.h"
#import "ZEQXTool.h"

typedef enum {
    ZEMeTableViewCellTypePersonal = 0,
    ZEMeTableViewCellTypeSetting
}ZEMeTableViewCellType;

@interface ZEMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView * tableView;
@property(nonatomic,strong) NSMutableArray * personalModels;
@property(nonatomic,strong) ZEPersonalInfo * userInfo;

@end

@implementation ZEMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    [[ZEQXTool sharedZEQXTool] loadUserInfoInController:self showFailure:^(THNetWorkError *error) {
//        [MBProgressHUD showError:@"加载用户信息失败" toView:self.navigationController.view];
//    }];
    
    [MBProgressHUD showMessage:@"用户信息加载中..." toView:self.view];
    [ZEQXTool userDetailWithController:self param:[NSDictionary dictionary] success:^(ZEPersonalInfo *result) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        self.userInfo =result;
        [ZEQXTool saveUseInfo:self.userInfo];
        [self.tableView reloadData];
    } failure:^(THNetWorkError *error) {
        
        [MBProgressHUD showError:@"加载用户信息失败" toView:self.navigationController.view];
    }];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}


#pragma mark - 私有方法


- (void)initUI
{
    self.title = @"个人中心";
    
    UITableView * tableView = [[UITableView alloc]init];
    tableView.delegate =self;
    tableView.dataSource = self;
    tableView.backgroundColor = ZECustomerGlobalBackgroudColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.scrollEnabled = NO;
    
    [tableView registerNib:[UINib nibWithNibName:@"ZEPesonalNameViewCell" bundle:nil] forCellReuseIdentifier:@"personal"];
    [tableView registerNib:[UINib nibWithNibName:@"ZESettingViewCell" bundle:nil] forCellReuseIdentifier:@"setting"];
    self.tableView = tableView;
    
    [self.view addSubview:tableView];
    tableView.sd_layout
    .topSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    return self.personalModels.count ;
     return 2 ;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        ZESettingViewCell * settingCell = [ZESettingViewCell cellWithTableView:tableView dequeueReusableCellWithIdentifier:@"setting"];
        
        return settingCell;
    }else {
        ZEPesonalNameViewCell * personalCell = [ZEPesonalNameViewCell cellWithTableView:tableView dequeueReusableCellWithIdentifier:@"personal"];
        personalCell.userInfos =  self.userInfo;
        lieonLog(@"url:%@",self.userInfo.HeadUrl);
        return personalCell;
    }
}

#pragma mark - 代理方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 70;
    }else
    {
        return 50;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    UIView * header = [[UIView alloc]init];
    
    header.backgroundColor = [UIColor clearColor];
    header.frame = CGRectMake(0, 0, self.tableView.width, 15);
    
    return header;
 
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
   if(indexPath.section == ZEMeTableViewCellTypePersonal)
   {
       UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"ZEPersonalInfoViewController" bundle:nil];
       ZEPersonalInfoViewController * personalVC = [storyboard instantiateViewControllerWithIdentifier:@"PersonalInfoViewController"];
       personalVC.title = @"个人资料";
       
       [self.navigationController pushViewController:personalVC animated:YES];
   }else if(indexPath.section == ZEMeTableViewCellTypeSetting)
   {
    
       ZESettingViewController * setlVC = [[ZESettingViewController alloc]init];
       setlVC.title = @"设置";
       [self.navigationController pushViewController:setlVC animated:YES];
   }
}



@end
