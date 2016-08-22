//
//  ZECostViewController.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import SVProgressHUD

class ZECostViewController: ZEBaseViewController {
    
    //为适配iphone5更改字体大小,视图约束等
    @IBOutlet weak var lessLab: UILabel!
    @IBOutlet weak var middleLab: UILabel!
    @IBOutlet weak var mostLab: UILabel!
    @IBOutlet weak var bgViewTop: NSLayoutConstraint!
    @IBOutlet weak var lineOneHeight: NSLayoutConstraint!
    @IBOutlet weak var lineTwoHeight: NSLayoutConstraint!
    
    @IBOutlet weak var areaTF: UITextField!
    @IBOutlet weak var priceLab: UILabel!
    
    @IBOutlet weak var lessBtn: UIButton!
    @IBOutlet weak var middleBtn: UIButton!
    @IBOutlet weak var mostBtn: UIButton!
    
    var priceType = String() //1，2，3（1对应688   2对应888  3对应988）

    private lazy var leftItem: ZELeftBarButonItem = {
        let leftItem = ZELeftBarButonItem()
        leftItem.imageName = "icon_back_灰"
        return leftItem
    }()
    
    private lazy var titleItem: ZETitileBarButtonItem = {
        let titleItem = ZETitileBarButtonItem()
        titleItem.title = "费用计算"
        return titleItem
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        let deviceCode:String = THloginMessage.init().DeviceCode
        if deviceCode.hasPrefix("iPhone 5") == true {
            
            lessLab.font = UIFont.systemFontOfSize(10)
            middleLab.font = UIFont.systemFontOfSize(10)
            mostLab.font = UIFont.systemFontOfSize(10)
            bgViewTop.constant = 56
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        lineOneHeight.constant = 0.5
        lineTwoHeight.constant = 0.5
        
        lessBtn.selected = true
        priceType = "1"
    }
    
    var model:ZECalcuExpense!{
        didSet{
            priceLab.text = "￥ \(model.MinMoney!)—\(model.MaxMoney!)"
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for subView in self.view.subviews{
            if subView.isKindOfClass(UITextField) {
                subView.resignFirstResponder()
            }
        }
    }
    
    @IBAction func lessBtnClick(sender: UIButton) {
        middleBtn.selected = false
        mostBtn.selected = false
        sender.selected = true
        priceType = "1"
    }
    
    @IBAction func middleBtnClick(sender: UIButton) {
        sender.selected = true
        lessBtn.selected = false
        mostBtn.selected = false
        priceType = "2"
    }
    
    @IBAction func mostBtnClick(sender: UIButton) {
        sender.selected = true
        lessBtn.selected = false
        middleBtn.selected = false
        priceType = "3"
    }
    
    @IBAction func getPriceClick(sender: UIButton) {
        if areaTF.text!.isEmpty == false {
            self.priceLab.hidden = false
            THNetWorking.sharedInstance.THNetWorkingPost("CalculationExpense", paramerers: ["Area":areaTF.text!,"Type":priceType], success: { (respond) in
                let costModel = ZECalcuExpense.mj_objectWithKeyValues(respond)
                self.model = costModel
                }, failure: { (error) in
                   print(error)
            })
            
        }else{
            self.priceLab.hidden = true
            SVProgressHUD.setMinimumDismissTimeInterval(1)
            SVProgressHUD.showErrorWithStatus("请输入建筑面积")
        }
    }
    
}
