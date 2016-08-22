//
//  ZEPersonalInfoViewController.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 TH. All rights reserved.
//

typealias iconData = (NSData) -> Void
import UIKit

class ZEPersonalInfoViewController: ZEBaseViewController {
    
    var iconDataBlock: iconData? //用于传修改后的头像data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if personalTbView.headerImgData != nil {
            self.iconDataBlock!(personalTbView.headerImgData!)
        }
    }
    
    private lazy var personalTbView: ZEPersonalInfoTbView = {
        let personalTbView = ZEPersonalInfoTbView(frame: CGRectMake(0, 0, ScreenW, ScreenH))
        return personalTbView
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "个人资料"

        self.view.addSubview(personalTbView)
    }
    
    func loadData(){
        let userID = "\(ZELoginUserInfo.loginUserInfo().UserID!)"
        THNetWorking.sharedInstance.THNetWorkingPost("LoadPersonalData", paramerers: ["UserID":userID], success: { (respond) in
            let model = ZEPersonalInfoModel.mj_objectWithKeyValues(respond)
            print(respond)
            self.personalTbView.model = model
            }) { (error) in
                print(error)
        }
    }
}
