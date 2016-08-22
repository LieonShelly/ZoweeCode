//
//  APPIndexViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/3/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#define itemInset 0

#import "APPIndexViewController.h"
#import "ZEMeViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "searchViewController.h"
#import "ZEQXTool.h"
#import "ZEHomeDesigeViewController.h"
#import "ZEAppCollectionViewCell.h"
#import "ZEAPPModel.h"
#import "ZEAssignDetailViewController.h"
#import "THloginMessage.h"
#import "userManager.h"
#import "ZEDesigePickMissionViewController.h"
#import "THloginMessage.h"
#import "ZEFranchiseeViewController.h"

#import "homeDesigeNavigationController.h"

#import "ZEGrabSegmentViewController.h"

#import "ZERushOrderMessageViewController.h"
#import "ZEPhotoMarkViewController.h"
#import "CYLTabBarController.h"
#import "ZEAnalyzeViewController.h"
@interface APPIndexViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property (weak, nonatomic)  UICollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray * appArray;
@property (nonatomic,strong) NSNumber * countItemsPerRow;
@property (nonatomic ,strong) UIAlertView  * alterView;

@end

@implementation APPIndexViewController
-(BOOL)shouldAutorotate{
    
    return YES;
    
}//是否支持旋转

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait ;
    
}//支持的方向
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBaseView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[ZEQXTool sharedZEQXTool] loadUserInfoInController:self showFailure:^(THNetWorkError *error) {
        [MBProgressHUD showError:@"加载用户信息失败" toView:self.navigationController.view];
    }];
}
#pragma mark - getter

- (NSMutableArray *)appArray
{
    if (_appArray == nil) {
        _appArray = [NSMutableArray array];
        ZEAPPModel * model0 =nil;
        ZEAPPModel * model1 = nil;
        ZEAPPModel * model2 = nil;
        ZEAPPModel * model3 = nil;
        UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Application" bundle:nil];
        
        APPIndexModel * item00 = [[APPIndexModel alloc]initWithIconName:@"icon_measure" Title:@"派尺助手"];
        item00.option = ^{
            [userManagershare checkUserPermission:permissionApplicationMeasureHelper WithBlock:^{
            UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"ZEAssignDetailViewController"];
                    [self.navigationController pushViewController:vc animated:YES];
            }];
        };
        
        APPIndexModel * item01 =  nil;
       item01 = [[APPIndexModel alloc]initWithIconName:@"" Title:@""];
     
        APPIndexModel * item02 = [[APPIndexModel alloc]initWithIconName:@"" Title:@""];
         APPIndexModel * item03= [[APPIndexModel alloc]initWithIconName:@"" Title:@""];
        model0 =[[ZEAPPModel alloc]initWithItems:@[item00,item01,item02,item03] sectionHeaderTitle:@"店长套装" sectionFooterTitle:@""];
        //上门营销
        APPIndexModel * item10= [[APPIndexModel alloc]initWithIconName:@"icon_sales" Title:@"上门营销"];//icon_sales  上门营销
        item10.option = ^{
            [self showMeasage:@"上门营销"];
        };
        APPIndexModel * item11= [[APPIndexModel alloc]initWithIconName:@"icon_sales_advanced" Title:@"上门营销"];
        if ([[THloginMessage sharedInstance].DeviceCode hasPrefix:@"iPad"])
        {
            item11.option = ^{
                homeDesigeNavigationController * navi =  [storyboard instantiateViewControllerWithIdentifier:@"homeDesignNavigation"];
                [self presentViewController:navi animated:YES completion:nil];
            };
        }else
        {
            item11.option = ^{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"请用iPad使用该功能!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                
                [alert show];
            };
        }
        //照相标注
        APPIndexModel * item12= [[APPIndexModel alloc]initWithIconName:@"icon_photo" Title:@"照相标注"];//icon_photo  照相标注
        item12.option = ^{
            [self showMeasage:@"照相标注"];
//            ZEPhotoMarkViewController * photoVC = [[ZEPhotoMarkViewController alloc]init];
//            [self.navigationController pushViewController:photoVC animated:YES];
        };
        
        APPIndexModel * item13= [[APPIndexModel alloc]initWithIconName:@"icon_order" Title:@"电商抢单"];
        item13.option = ^{
            ZEGrabSegmentViewController * grabVC = [[ZEGrabSegmentViewController alloc]init];
            [self.navigationController pushViewController:grabVC animated:YES];
        };
        
         model1 = [[ZEAPPModel alloc]initWithItems:@[item11,item13,item10,item12] sectionHeaderTitle:@"营销套装" sectionFooterTitle:@""];
        
        APPIndexModel * item20= [[APPIndexModel alloc]initWithIconName:@"icon_data" Title:@"数据分析"];
        item20.option = ^{
            ZEAnalyzeViewController * analyzeVC = [[ZEAnalyzeViewController alloc]init];
            [self.navigationController pushViewController:analyzeVC animated:YES];
        };
        APPIndexModel * item21= [[APPIndexModel alloc]initWithIconName:@"" Title:@""];
        APPIndexModel * item22= [[APPIndexModel alloc]initWithIconName:@"" Title:@""];
        APPIndexModel * item23= [[APPIndexModel alloc]initWithIconName:@"" Title:@""];
        model2 = [[ZEAPPModel alloc]initWithItems:@[item20,item21,item22,item23] sectionHeaderTitle:@"报表套装" sectionFooterTitle:@""];
        //客户收款
        APPIndexModel * item30= [[APPIndexModel alloc]initWithIconName:@"icon_$" Title:@" 客户收款"];//icon_$  客户收款
        item30.option = ^{
            [userManagershare checkUserPermission:permissionApplicationCustomerCollection WithBlock:^{
                [self showMeasage:@"客户收款"];
            }];
        };
        APPIndexModel * item31= [[APPIndexModel alloc]initWithIconName:@"icon_table" Title:@"工厂充扣"];
        item31.option = ^{
            [userManagershare checkUserPermission:permissionApplicationRechargeDetails WithBlock:^{
                UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Application" bundle:nil];
                UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:@"ZEFranchiseeViewController"];
                [self.navigationController pushViewController:vc animated:YES];
            }];
        };
        APPIndexModel * item32= [[APPIndexModel alloc]initWithIconName:@"" Title:@""];
        APPIndexModel * item33= [[APPIndexModel alloc]initWithIconName:@"" Title:@""];
        model3 = [[ZEAPPModel alloc]initWithItems:@[item31,item32,item32,item33] sectionHeaderTitle:@"财务套装" sectionFooterTitle:@""];
        //暂时屏蔽部分功能
        if ([customerType isEqualToString:@"皮阿诺"]) {
            if ([[THloginMessage sharedInstance].DeviceCode hasPrefix:@"iPhone"]) {
                [_appArray addObjectsFromArray:@[model0,model1,model2, model3]];
                
            }else {
//                APPIndexModel * item13= [[APPIndexModel alloc]initWithIconName:@"" Title:@""];
//                model1 = [[ZEAPPModel alloc]initWithItems:@[item11,item13,item10,item12] sectionHeaderTitle:@"营销套装" sectionFooterTitle:@""];
                [_appArray addObjectsFromArray:@[model0,model1,model2, model3]];
            }
        }else{
            //APPIndexModel * item11= [[APPIndexModel alloc]initWithIconName:@"" Title:@""];
            //model1 = [[ZEAPPModel alloc]initWithItems:@[item13,item11,item11,item11] sectionHeaderTitle:@"营销套装" sectionFooterTitle:@""];
            [_appArray addObjectsFromArray:@[model0,model1,model2,model3]];
        }
        
       //[_appArray addObjectsFromArray:@[model0,model1,model2,model3]];
    }
    return _appArray;
}

- (NSNumber *)countItemsPerRow
{
    if (_countItemsPerRow == nil) {
        
        _countItemsPerRow = [NSNumber numberWithInteger:4];
//           if ([userManagershare.DeviceCode hasPrefix:@"iPad"]) {
//              
//               _countItemsPerRow = [NSNumber numberWithInteger:4];
//            }else{
//                
//                _countItemsPerRow = [NSNumber numberWithInteger:3];
//            }
    }
    return _countItemsPerRow;
}
#pragma mark - selfMethod

- (void)showMeasage:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message message:@"正在开发中,敬请期待!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    
    [alert show];
}

- (void)setupBaseView
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat width = (SCREEN_WIDTH - 5 * itemInset)/ (self.countItemsPerRow.integerValue);
    CGFloat height = 85;
    layout.itemSize = CGSizeMake(width,height);


    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 10,SCREEN_WIDTH, self.view.height) collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
  
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.backgroundColor = hexColorString(@"f5f3f3");
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ZEAppCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"AppCollectionViewCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Footer"];
}

#pragma mark - collectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.appArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    ZEAPPModel * model = self.appArray[section];
    return model.items.count ;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZEAppCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AppCollectionViewCell" forIndexPath:indexPath];
     ZEAPPModel * model = self.appArray[indexPath.section];
    APPIndexModel * indexModel =model.items[indexPath.item];
    cell.appIndexModel = indexModel;
    return cell;
}

#pragma mark - UICollectionViewDelegate

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
//    top, left, bottom, right
   return UIEdgeInsetsMake(0, itemInset, 10, itemInset);
    
}



//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return itemInset;
}



//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return itemInset;
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WIDTH, 20);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZEAPPModel * model = self.appArray[indexPath.section];
    APPIndexModel * indexModel = model.items[indexPath.item];
    if ( indexModel.option) {
        indexModel.option();
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
       ZEAPPModel * model = self.appArray[indexPath.section];
    //创建/获取头尾视图的时候也要用复用队列
    //判断kind 来区分头尾
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //头视图
        //(如果满足不了需要那么就定制)
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
        
        UILabel * titleLabel = [[UILabel alloc]init];
        titleLabel.font = [UIFont systemFontOfSize:10];
        titleLabel.textColor = hexColorString(@"808080");
        titleLabel.backgroundColor = [UIColor whiteColor];
        titleLabel.size = header.size;
        titleLabel.left = 10;
        titleLabel.top = header.height - titleLabel.height;
        titleLabel.text = model.sectionHeaderTitle;
        [header addSubview:titleLabel];
        header.backgroundColor = [UIColor whiteColor];
        return header;
    }else {
        //尾视图
        //复用队列获取
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor yellowColor];
        return footer;
    }
}



@end
