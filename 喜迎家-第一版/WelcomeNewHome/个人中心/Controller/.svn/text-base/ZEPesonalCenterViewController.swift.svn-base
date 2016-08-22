//
//  ZEPesonalCenterViewController.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/7.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEPesonalCenterViewController: ZEBaseViewController,UITableViewDelegate{
    private let cellIdentifier = "Cell"
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Default;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        GUIInit()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        self.view.backgroundColor = UIColor.whiteColor()
        self.naviBar.backgroundColor = UIColor.hx_colorWithHexRGBAString("5abee6")
        let titleItem = ZETitileBarButtonItem()
        titleItem.titleColor = UIColor.whiteColor()
        titleItem.title = "个人中心"
        self.titlBarButtonItem = titleItem
        
        let leftBtn = ZELeftBarButonItem()
        leftBtn.imageName = "icon_back_灰"
        self.leftBarButtonItem = leftBtn
        
        let rightBtn = ZERightBarButtonItem()
        rightBtn.imageName = "icon_setting"
        self.rightBarButtonItem = rightBtn
    }
    
    func GUIInit(){
        //头部视图 && tableView
        let profileHeader = ZEProfileHeader()
        let profileTbView = UITableView()
        profileTbView.tableHeaderView = profileHeader
        profileTbView.delegate = self
       // profileTbView.dataSource = self
        self.view.addSubview(profileTbView)
        profileTbView.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.top.equalTo(self.view.snp_top).offset(64)
        }
        //注册cell
        profileTbView.registerNib(UINib.init(nibName: "ZENormalCellModel", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    //MARK:DataSource
    func tableview(tableview: UITableView,numberOfRowsInSection section: Int) ->Int{
        return 7
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableview(tableview: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let profileCell = tableview.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)as! ZEProfileCell
        profileCell.model = ZENormalCellModel(imgName: "icon_order", titleStr: "我的订单")
        return profileCell
    }
    
    
    //MARK:Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 46
    }
    
    
    
}
