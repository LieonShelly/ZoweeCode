//
//  ZERegisterViewController.swift
//  WelcomeNewHome
//
//  Created by wanglj on 16/7/11.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZERegisterViewController: ZEBaseViewController {
    
    var tableView:ZERegisterTabView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func setup() {
        
        title = "注册"
        let tableView = ZERegisterTabView.init()
        self.tableView = tableView
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(view.snp_top)
            make.bottom.equalTo(view.snp_bottom)
            make.left.equalTo(view.snp_left)
            make.right.equalTo(view.snp_right)
        }
        
    }
    
    override func routerEvent(eventName: String, userInfo: Dictionary<String, String>) {
        if eventName == "userRegister" {
            THNetWorking.sharedInstance.THNetWorkingPost("Register", paramerers: userInfo, success: { (responed) in
                print("success")
                }, failure: { (error) in
                    
            })
        }
        else if eventName == "VerificationCode" {
            THNetWorking.sharedInstance.THNetWorkingPost("VerificationCode", paramerers: userInfo, success: { (responed) in
                print("success")
                }, failure: { (error) in
                    
            })
        }
        else{
            super.routerEvent(eventName, userInfo: userInfo)
        }
    }
}
