//
//  AppDelegate.swift
//  WelcomeNewHome
//
//  Created by wanglj on 16/7/6.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import AFNetworking

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mapManager = BMKMapManager()
    //后台任务
    var backgroundTask:UIBackgroundTaskIdentifier! = nil

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setupNetType()
        setupBaiduMap()
        shouldInGuideView()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        //如果已存在后台任务，先将其设为完成
        if self.backgroundTask != nil {
            application.endBackgroundTask(self.backgroundTask)
            self.backgroundTask = UIBackgroundTaskInvalid
        }
        //注册后台任务
        self.backgroundTask = application.beginBackgroundTaskWithExpirationHandler({
            () -> Void in
            //如果没有调用endBackgroundTask，时间耗尽时应用程序将被终止
            application.endBackgroundTask(self.backgroundTask)
            self.backgroundTask = UIBackgroundTaskInvalid
        })
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

  private func setupBaiduMap()
    {
    
        
    // 如果要关注网络及授权验证事件，请设定generalDelegate参数
    let ret = mapManager.start(BaiDuAK, generalDelegate: nil)
    if ret == false {
    NSLog("manager start failed!")
        }
    ZELocateTool.shareLocateTool().startLocation()
    }
    
    private func setupNetType()
    {
        let  manger = AFNetworkReachabilityManager.sharedManager()
        manger.setReachabilityStatusChangeBlock { (status) in
            
            print(status)
            switch (status)
            {
            case AFNetworkReachabilityStatus.Unknown:
                THloginMessage.sharedInstance().NetType = NetTypeNone
                print("Unknown")
                break
            case AFNetworkReachabilityStatus.ReachableViaWiFi:
                THloginMessage.sharedInstance().NetType = NetTypeWifi
                print("wifi")
                
            case AFNetworkReachabilityStatus.NotReachable:
                  THloginMessage.sharedInstance().NetType = NetTypeNone
                   print("Unknown")
            
            case AFNetworkReachabilityStatus.ReachableViaWWAN:
                  THloginMessage.sharedInstance().NetType = NetType4G
                   print("WWAN")
              
                
               
            }
        }
        
        manger.startMonitoring()
    }
    //判断是否加载引导页
    private func shouldInGuideView(){
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        
        let isFirstIn = NSUserDefaults.standardUserDefaults().objectForKey("isFirstIn")
        if isFirstIn != nil {
            //从storyboard中加载
            let sb  = UIStoryboard(name: "Home", bundle: nil)
            self.window!.rootViewController = sb.instantiateInitialViewController()
            
        }else{
            
            //创建一个视图控制器
            let rootVC=ZEGuideViewController()
            // 设置 self.window根视图控制器
            self.window!.rootViewController = rootVC;
            NSUserDefaults.standardUserDefaults().setObject("YES", forKey: "isFirstIn")
        }
        self.window!.makeKeyAndVisible()
    }
    
}

