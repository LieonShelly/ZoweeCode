//
//  ZEHomeViewController.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/7.
//  Copyright © 2016年 Zowee. All rights reserved.
//

import UIKit
import PromiseKit

class ZEHomeViewController: ZEBaseViewController,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate {
    
    let msgLab = UILabel()
    var imgPathArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
        addNotification()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if ZELoginUserInfo.loginUserInfo().UserToken != nil {
            loadNewMessage()
        }else{
            msgLab.removeFromSuperview()
        }
        mapView.delegate = nil
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        leftBtn.enabled = true
        rightBtn.enabled = true
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        mapView.delegate = nil
    }
    // MARK:Events
    
     func leftBtnClick1() {
        print("home")
        self.navigationController!.pushViewController(ZEPesonalCenterViewController(), animated: true)
        leftBtn.enabled = false
    }
    
    func right() {
        if ZELoginUserInfo.loginUserInfo().UserToken != nil{
            self.navigationController!.pushViewController(ZEMessageViewController(), animated: true)
            rightBtn.enabled = false
        }else{
            let SB = UIStoryboard.init(name: "ZPersonalCenter", bundle: nil)
            let loginVC = SB.instantiateViewControllerWithIdentifier("ZELoginViewController")
            THURLNavigation.pushViewController(loginVC, animated: true)
        }
    }
  
    // MARK:懒加载
    
    
    private lazy var leftBtn:UIButton = {
        let leftBtn:UIButton = UIButton.createButton(self, action: #selector(ZEHomeViewController.leftBtnClick1), imageName:"icon_personal")
            return leftBtn
    }()
    
    private lazy var rightBtn:UIButton = {
        let rightBtn:UIButton = UIButton.createButton(self, action:#selector(ZEHomeViewController.right), imageName: "icon_talk")
        return rightBtn
    }()
  
    
    private lazy var mapView:BMKMapView = {
      let mapView = BMKMapView()
        return mapView
    }()
    
    private lazy var collectionView:ZEHomeCollectionView = {
        let collectionView = ZEHomeCollectionView(frame: CGRectZero, collectionViewLayout: ZEHomeCollectionViewFlowLayout())
        return collectionView
    }()
    
    // MARK:内部控制方法
   private func setupUI()
    {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        self.title = "喜迎家"
        view .addSubview(collectionView)
        collectionView.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.top.equalTo(0)
        }
    }
    
    func addNotification()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(ZEHomeViewController.locationChange), name: locationChanged, object: nil)
    }
    
    func locationChange()
    {
       weak var weakSelf = self
        let alter = UIAlertController(title: nil, message: "是否切换城市", preferredStyle: UIAlertControllerStyle.Alert)
        let action0 = UIAlertAction(title: "是", style: UIAlertActionStyle.Default) { (_) in
            weakSelf!.loadData()
        }
        let action1 = UIAlertAction(title: "否", style: UIAlertActionStyle.Cancel, handler: nil)
        alter.addAction(action0)
        alter.addAction(action1)
        presentViewController(alter, animated: true, completion: nil)
        
       
    }
    func loadData()
    {
        let param = [
            "Type":"5",
            "ProvinceName":ZEUserInfo.shareUserInfo().location!.province,
            "CityName":ZEUserInfo.shareUserInfo().location!.city,
            "Length":String(ScreenH),
            "Width":String(ScreenW),
            "NetType":String(THloginMessage.sharedInstance().NetType.rawValue),
            "UpdateCode":ZEHomeImage.getUpdateCode(),
            ]
        ZEHomeSectionFrameModel.loadHomeSectionFrame(param, success: { (frameArray) -> (Void) in
         
            self.collectionView.dataArray = frameArray
                }, failure: { (error) -> (Void) in
                self.shouAlterView()
            })
        
    }
    
   
    private func shouAlterView()
    {
      weak var weakSelf = self
        
        let alter = UIAlertController(title: nil, message: "数据加载失败,是否重新加载", preferredStyle: UIAlertControllerStyle.Alert)
        let action0 = UIAlertAction(title: "是", style: UIAlertActionStyle.Default) { (_) in
            weakSelf!.loadData()
        }
        let action1 = UIAlertAction(title: "否", style: UIAlertActionStyle.Cancel, handler: nil)
        alter.addAction(action0)
        alter.addAction(action1)
        presentViewController(alter, animated: true, completion: nil)
    }
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func loadNewMessage(){
        //新消息提示
        THNetWorking.sharedInstance.THNetWorkingPost("LoadNewMessage", paramerers: Dictionary<String, String>(), success: { (JSON) in
            
            let array = NSArray.init(array: ZEMessageModel.mj_objectArrayWithKeyValuesArray(JSON)) as! Array<ZEMessageModel>
            for model:ZEMessageModel in array{
                if model.Num != nil{
                    
                    self.msgLab.frame = CGRectMake(40-23, 2, 8, 8)
                    self.msgLab.layer.masksToBounds = true
                    self.msgLab.layer.cornerRadius = 4
                    self.msgLab.backgroundColor = UIColor(hexString: "fc4d59")
                    self.rightBtn.addSubview(self.msgLab)
                }
            }
        }) { (error) in
            print(error)
        }
    }
    
}

