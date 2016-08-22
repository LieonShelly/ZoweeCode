//
//  ZEMyOderViewController.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEMyOderViewController: ZEBaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var lineHeight: NSLayoutConstraint!
    @IBOutlet weak var oderNo: UILabel!
    @IBOutlet weak var OrderTime: UILabel!
    @IBOutlet weak var priceLab: UILabel!
    @IBOutlet weak var stateLab: UILabel!
    

    var model:ZEOderItem! {
        didSet{
            setupUI()
            
        }
    }
    //MARK: 懒加载
    lazy var oderTbView: UITableView = {
        let oderTbView = UITableView(frame:  CGRectMake(1, 20, ScreenW - 54, 0), style: UITableViewStyle.Plain)
        oderTbView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0)
        oderTbView.dataSource = self
        oderTbView.delegate = self
        oderTbView.separatorStyle = UITableViewCellSeparatorStyle.None
        oderTbView.registerNib(UINib.init(nibName: "ZEOderDetailCell", bundle: nil), forCellReuseIdentifier: ZEOderDetailCell.CellIdentifier())
        return oderTbView
    }()
    
    private lazy var imgView: UIImageView = {
        let imgView = UIImageView(frame: CGRectMake(27, 156, ScreenW - 52, 0))
        imgView.userInteractionEnabled = true
        imgView.image = UIImage(named: "frame")
        return imgView
    }()
    
    private lazy var bgView: UIButton = {
        let bgView = UIButton(frame: CGRectMake(0, 0 , ScreenW, ScreenH))
        bgView.addTarget(self, action: #selector(ZEMyOderViewController.bgViewClick), forControlEvents: UIControlEvents.TouchUpInside)
        return bgView
    }()
    
    private lazy var titleItem:ZETitileBarButtonItem = {
        let titleItem = ZETitileBarButtonItem()
        titleItem.title = "我的订单"
        return titleItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的订单"
        self.view.backgroundColor = UIColor.whiteColor()
        let deviceCode:String = THloginMessage.init().DeviceCode
        if deviceCode.hasPrefix("iPhone 5") == true{
            oderNo.font = UIFont.systemFontOfSize(12)
            OrderTime.font = UIFont.systemFontOfSize(12)
            priceLab.font = UIFont.systemFontOfSize(12)
            stateLab.font = UIFont.systemFontOfSize(12)
        }
        lineHeight.constant = 0.5
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        oderNo.text = model.OrderNo
        let dateArray = model.OrderTime?.componentsSeparatedByString(" ")
        OrderTime.text = dateArray![0]
        priceLab.text = "\(model.Price!)万"
        stateLab.text = model.State
    }
    
    //MARK: 加载数据
    func loadData(){
        THNetWorking.sharedInstance.THNetWorkingPost("LoadOrderList", paramerers: [:], success: { (Json) in
            print(Json)
            let model = ZEOderItem.mj_objectWithKeyValues(Json)
            self.model = model
            
            }) { (error) in
                print(error)
        }
    }
    
    //MARK: 点击事件
    @IBAction func moreBtnClick(sender: UIButton) {
        imgView.addSubview(oderTbView)
        bgView.addSubview(imgView)
        //oderTbView.reloadData()
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.oderTbView.frame = CGRectMake(1, 22, ScreenW - 54, 340*AdaptationRatioH)
            self.imgView.frame = CGRectMake(27, 156, ScreenW - 52, 340*AdaptationRatioH + 24)
            }, completion: nil)
        self.view.addSubview(bgView)
    }
    
    func bgViewClick(){
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.oderTbView.frame = CGRectMake(1, 22, ScreenW - 54, 0)
            self.imgView.frame = CGRectMake(27, 156, ScreenW - 52, 0)
            }, completion: {(Bool) in
                self.bgView.removeFromSuperview()
        })
    }
    
    //MARK:DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       
//        if model.ProjectList != nil {
//            return (model.ProjectList?.count)! + 1
//        }else{
//            return 1
//        }
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ZEOderDetailCell = tableView.dequeueReusableCellWithIdentifier(ZEOderDetailCell.CellIdentifier(), forIndexPath: indexPath)as! ZEOderDetailCell
//        if indexPath.row != 0{
//            let model = ZEOderPrice.init()
//            cell.projectLab.text = model.ProjectName
//            cell.priceLab.text = "\(model.ProjectPrice)"
//            cell.countLab.text = model.Num
//            cell.totalAmountLab.text = "\(model.Sum)"
//        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 40
    }
    
}
