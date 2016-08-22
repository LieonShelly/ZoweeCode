//
//  AppDelegate.m
//  ZoweeSale
//
//  Created by wanglj on 16/2/16.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "AppDelegate.h"
#import "userManager.h"
#import "THNetWork.h"
#import "YTKNetworkConfig.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import <iflyMSC/iflyMSC.h>
#import "JPUSHService.h"
#import "NSObject+MJProperty.h"
#import "NSNumber+TH.h"
#import "MJExtension.h"
#import "JPushMeessage.h"
#import "MobClick.h"
#import "HZURLNavigation.h"
#import "userManager.h"
#import "THloginMessage.h"
#import "TaskViewController.h"
#import "ZECustomerActivityController.h"
#import "ZEGrabSegmentViewController.h"
#import "ZETHAlertView.h"

#import "ZEPhotoViewController.h"
@interface AppDelegate ()<UIAlertViewDelegate>


@end
BMKMapManager* _mapManager;

@implementation AppDelegate{
    JPushMeessage *_pushMess;
}
#pragma mark - 系统方法

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //设置程序启动时的第一个页面
    [self configRootViewController];
    //皮阿诺测试服务器地址：http://157.122.179.34:8885/
    //开发测试地址：http://120.76.78.11:8885/
    //[THNetWork sharedInstance].urlStr = @"http://120.76.78.11:8885/";
    [THNetWork sharedInstance].urlStr = SERVER_URL;
    [YTKNetworkConfig sharedInstance].baseUrl = SERVER_URL;
    //百度地图
    [self baiduMapInitSet];
    //极光推送
    [self JPUSHInit:launchOptions];
    //友盟统计
    [self umengConfig];
    [self iflySeting];
    [self setupNetType];
   // NSLog(@"%@",customerType);
    return YES;
}


- (void)setupNetType
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"UnknownNetType");
                [THloginMessage sharedInstance].NetType = NetTypeNone;
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"NotReachableNetType");
                [THloginMessage sharedInstance].NetType = NetTypeNone;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"ViaWWAN");
                [THloginMessage sharedInstance].NetType = NetType4G;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi");
                [THloginMessage sharedInstance].NetType = NetTypeWifi;
                break;
            default:
                break;
        }
    }];
    
    [manager startMonitoring];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    [[IFlySpeechUtility getUtility] handleOpenURL:url];
    return YES;
}


#pragma mark - 其他方法
/**
 *  设置RootViewContr
 */
- (void)configRootViewController{
    
    
    if ([[userManager sharedInstance] islogin]) {
        [THNetWork sharedInstance].token = [userManager sharedInstance].token;
    }else{
        self.window.rootViewController = [[UIStoryboard storyboardWithName:@"loginOrBinding" bundle:nil] instantiateInitialViewController];
    }
}
/**
 *  百度地图初始化
 */
- (void)baiduMapInitSet {
    // 要使用百度地图，请先启动BaiduMapManager
    _mapManager = [[BMKMapManager alloc]init];
    BOOL ret = [_mapManager start:BaiduMapAppKey generalDelegate:self];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
}
#pragma  mark - 百度地图返回错误通知Delegate

- (void)onGetNetworkState:(int)iError
{
    if (0 == iError) {
        NSLog(@"百度地图联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
    
}

- (void)onGetPermissionState:(int)iError
{
    if (0 == iError) {
        NSLog(@"百度地图授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
}

#pragma  mark - 极光推送 
/**
 *  初始化推送 设置
 *
 *  @param launchOptions 启动的参数
 */
- (void)JPUSHInit:(NSDictionary *)launchOptions {
    //    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Required
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    }
    // Required
    //如需兼容旧版本的方式，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化和同时使用pushConfig.plist文件声明appKey等配置内容。
    [JPUSHService setupWithOption:launchOptions appKey:JPushAppKey channel:zeAppChannel apsForProduction:YES];
}
#pragma mark - 解析处理推送内的数据
/**
 *  解析推送消息内容
 *
 *  @param message 推送内容
 */
- (void)pushMessage:(NSDictionary *)message {
    if (!message || message.count == 0) {
        return;
    }
    NSString *jsonKey = message[@"key"];
    _pushMess = [JPushMeessage mj_objectWithKeyValues:jsonKey];
    if (!_pushMess) {
        return;
    }
    //[JPUSHService setBadge:-1];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive) {
        [self JPushMessagePushController:_pushMess];
    }else if([UIApplication sharedApplication].applicationState == UIApplicationStateActive){
        for (UIView *view in [[UIApplication sharedApplication].windows firstObject].subviews) {
            if ([view isKindOfClass:[TYShowAlertView class]]) {
                [(TYShowAlertView *)view hide];
            }
        }
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"通知" message:@"您收到新的消息" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:@"查看", nil];
        [alert show];
    }
}
/**
 *  跳转到指定页面
 *
 *  @param message 推送Model
 */
- (void)JPushMessagePushController:(JPushMeessage *)message {
    if ([self.window.rootViewController isKindOfClass:[UITabBarController class]]||[self.window.rootViewController isKindOfClass:[UINavigationController class]]) {
        if (![[userManager sharedInstance] islogin]) {
            return;
        }
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0/*延迟执行时间*/ * NSEC_PER_SEC));
        // 跳转到对应的控制器
        if ([message.TypeID isEqual:@0]) {//0任务通知
             TaskViewController *controller = [[UIStoryboard storyboardWithName:@"Work" bundle:nil] instantiateViewControllerWithIdentifier:@"taskDetail"];
            controller.TaskID = [NSNumber numberWithString:message.Param1];
            controller.TypeID = [NSNumber numberWithString:message.ModuleName];
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
              [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
            });
        }
        else if ([message.TypeID isEqual:@1]) { //1公告通知
            NSLog(@"暂时没有");
        }else if ([message.TypeID isEqual:@2]) {// 2客户动态通知
            ZECustomerActivityController *controller = [[UIStoryboard storyboardWithName:@"CRM" bundle:nil] instantiateViewControllerWithIdentifier:@"customerActivity"];
            customerDetail *detail = [[customerDetail alloc]init];
            detail.CustomerID = [NSNumber numberWithString:message.Param1];
            controller.detail = detail;
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
            });
        }else if ([message.TypeID isEqual:@3]) {
            ZEGrabSegmentViewController *controller = [[ZEGrabSegmentViewController alloc]init];
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [[HZURLNavigation currentNavigationViewController] pushViewController:controller animated:YES];
            });
        }
    }
}
#pragma mark 推送的 AppDelegate代理
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    // Required
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
    [self pushMessage:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // IOS 7 Support Required
    [JPUSHService handleRemoteNotification:userInfo];
    [self pushMessage:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}
#pragma mark - UIAlertView代理
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        return;
    }else {
        [self JPushMessagePushController:_pushMess];
    }
}
#pragma mark - 友盟统计设置

- (void)umengConfig {
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    [MobClick setAppVersion:version];
#ifndef __OPTIMIZE__
    [MobClick setCrashReportEnabled:NO];
#else
    [MobClick setCrashReportEnabled:YES];
#endif
    [MobClick startWithAppkey:UMengAppKey reportPolicy:BATCH   channelId:customerType];
}
#pragma mark - 讯飞语音设置
/**
 *  语音
 */
- (void)iflySeting{
    //设置sdk的log等级，log保存在下面设置的工作路径中
    [IFlySetting setLogFile:LVL_NONE];
    
    //打开输出在console的log开关
    [IFlySetting showLogcat:NO];
    
    //设置sdk的工作路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths objectAtIndex:0];
    [IFlySetting setLogFilePath:cachePath];
    
    //创建语音配置,appid必须要传入，仅执行一次则可
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",@"577634f2"];
    
    //所有服务启动前，需要确保执行createUtility
    [IFlySpeechUtility createUtility:initString];
}

@end
