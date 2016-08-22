//
//  ZEMessageViewController.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEMessageViewController: ZEBaseViewController {

    private lazy var titleItem:ZETitileBarButtonItem = {
        let titleItem = ZETitileBarButtonItem()
        titleItem.title = "消息中心"
        return titleItem
    }()
    
    private lazy var msgTbView: ZEMessageTbView = {
        let msgTbView = ZEMessageTbView(frame: CGRectMake(0, 0, ScreenW, ScreenH))
        return msgTbView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        self.title = "消息中心"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(msgTbView)
    }
    
    func loadData(){
        THNetWorking.sharedInstance.THNetWorkingPost("LoadNewMessage", paramerers: Dictionary<String, String>(), success: { (JSON) in
            print(JSON)
            let modelArray = ZEMessageModel.mj_objectArrayWithKeyValuesArray(JSON)
            
            self.msgTbView.modelArray = NSArray.init(array: modelArray) as! Array<ZEMessageModel>
            }) { (error) in
                print(error)
        }
    }
    
}
