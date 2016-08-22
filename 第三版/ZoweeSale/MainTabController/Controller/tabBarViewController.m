//
//  tabBarViewController.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/17.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "tabBarViewController.h"
#import "MenuLabel.h"
#import "HyPopMenuView.h"
#import "ZEQXViewController.h"
#import "ZENavigationController.h"
#import "ZEOrderAppointmentViewController.h"
#import "ZEQXTool.h"
#import "CrmCustomerInterface.h"
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import <BaiduMapAPI_Search/BMKSearchComponent.h>

#import "NSDate+string.h"

////按钮宽
//#define normalButtonWidth      (SCREEN_WIDTH > SCREEN_HEIGHT ? SCREEN_HEIGHT/5 : SCREEN_WIDTH/5)
////高
//#define tabBarHeight          CGRectGetHeight(self.THTabBar.frame)
////THTabBarItemRisel 按钮宽
//#define publishItemWidth      (SCREEN_WIDTH > SCREEN_HEIGHT ? SCREEN_HEIGHT/5 : SCREEN_WIDTH/5)


@interface tabBarViewController ()<BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate>
@property (nonatomic, strong)BMKLocationService *locService;
@property (nonatomic, strong)BMKGeoCodeSearch *geocodesearch;

@end

@implementation tabBarViewController

-(BOOL)shouldAutorotate{
    
    return YES;
    
}//是否支持旋转

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskPortrait ;
    
}//支持的方向
//-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    return UIInterfaceOrientationPortrait;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewControllers];
    [self loadingWeather];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)setupViewControllers {
    UIViewController *QXViewController = [[ZEQXViewController alloc]init];
    ZENavigationController * QXNavi = [[ZENavigationController alloc]initWithRootViewController:QXViewController];
    
    //添加工作
    UIViewController *workViewController = [[UIStoryboard storyboardWithName:@"Work" bundle:nil] instantiateInitialViewController];
    
    //添加CRM
    UIViewController *CRMViewController = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateInitialViewController];
    
    //添加应用
    UIViewController *APPViewController = [[UIStoryboard storyboardWithName:@"Application" bundle:nil] instantiateInitialViewController];    //CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
    [self customizeTabBarForController];
    
    [self setViewControllers:@[
                               QXNavi,
                               workViewController,
                               CRMViewController,
                               APPViewController
                               ]];
    [self setSelectedIndex:1];
    //self.tabBarController = tabBarController;
}

/*
 *
 在`-setViewControllers:`之前设置TabBar的属性，
 *
 */
- (void)customizeTabBarForController{
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"企信",
                            CYLTabBarItemImage : @"Nav_Button_QiXin_Nor",
                            CYLTabBarItemSelectedImage : @"Nav_Button_QiXin_HighLight",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"工作",
                            CYLTabBarItemImage : @"工作",
                            CYLTabBarItemSelectedImage : @"工作selected",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"CRM",
                            CYLTabBarItemImage : @"CRM",
                            CYLTabBarItemSelectedImage : @"CRMSelected",
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"应用",
                            CYLTabBarItemImage : @"应用",
                            CYLTabBarItemSelectedImage : @"应用selected"
                            };
    NSArray *tabBarItemsAttributes = @[ dict1, dict2, dict3, dict4 ];
    self.tabBarItemsAttributes = tabBarItemsAttributes;
    [self customizeTabBarAppearance];
}

- (void)customizeTabBarAppearance {
//#warning CUSTOMIZE YOUR TABBAR APPEARANCE
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    //CYLTabBarItemWidth = SCREEN_WIDTH/5;
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
     //   [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight， remove the comment '//'
    //如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    //    [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBackgroundImage:nil];
    
    //remove the bar system shadow image
    //去除 TabBar 自带的顶部阴影
    //    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}
- (void)customizeTabBarSelectionIndicatorImage {
    ///Get initialized TabBar Height if exists, otherwise get Default TabBar Height.
    UITabBarController *tabBarController = [self cyl_tabBarController] ?: [[UITabBarController alloc] init];
    CGFloat tabBarHeight = tabBarController.tabBar.frame.size.height;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    //Get initialized TabBar if exists.
    UITabBar *tabBar = [self cyl_tabBarController].tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor redColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadingWeather{
    _locService = [[BMKLocationService alloc]init];
    _geocodesearch = [[BMKGeoCodeSearch alloc]init];
    _locService.delegate = self;
    _geocodesearch.delegate = self;
    [_locService startUserLocationService];
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [self baiduReverseGeoCode:userLocation.location.coordinate];
}
/**
 *  使用百度地图的反编码功能
 *
 *  @param pt 反编码地址
 */
- (void) baiduReverseGeoCode:(CLLocationCoordinate2D)pt {
    BMKReverseGeoCodeOption *reverseGeoCodeOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeoCodeOption.reverseGeoPoint = pt;
    BOOL flag = [_geocodesearch reverseGeoCode:reverseGeoCodeOption];
    if(flag){
        NSLog(@"天气反geo检索发送成功");
    }
    else{
        NSLog(@"天气反geo检索发送失败");
    }
    
}

#pragma mark - 百度地图 地理信息编码

- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    if (!result) {
        return;
    }
   // NSString *str = [NSString stringWithFormat:@"%@%@",@"weatherDay",[NSDate stringtodayYandMandD]];
    [crmCustomerShare GetWeatherWithcityName:result.addressDetail.city Block:^(THNetWorkError *error, NSString *weather) {
        if (error) {
            NSLog(@"%@",error.errorDescription);
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:weather forKey:weatherString];
        }
    }];
     [_locService stopUserLocationService];
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
