//
//  ZESuggestionViewController.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/11.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZESuggestionViewController: ZEBaseViewController,UITableViewDelegate,UITableViewDataSource {
    var contentStr = String()
    var nameStr = String()
    var phoneStr = String()
    
    private lazy var suggestTbView: UITableView = {
        let suggestTbView = UITableView.init(frame: CGRectMake(0, 0, ScreenW, ScreenH))
        
        return suggestTbView
    }()
    
    private lazy var rightBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("提交", forState: UIControlState.Normal)
        btn.addTarget(self, action: #selector(ZESuggestionViewController.commitBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        btn.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.sizeToFit()
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI(){
        
        title = "投诉建议"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        self.view.addSubview(suggestTbView)
        suggestTbView.separatorStyle = UITableViewCellSeparatorStyle.None
        suggestTbView.delegate = self
        suggestTbView.dataSource = self
        
        suggestTbView.registerNib(UINib.init(nibName: "ZESuggestionCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    //MARK:UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let suggestionCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as! ZESuggestionCell
        suggestionCell.block1 = { str in
            self.contentStr = str
        }
        suggestionCell.block2 = { str in
            self.nameStr = str
        }
        suggestionCell.block3 = { str in
            self.phoneStr = str
        }
        
        return suggestionCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 410
    }
    
    //提交
    func commitBtnClick(){
        
        THNetWorking.sharedInstance.THNetWorkingPost("Complaint", paramerers: ["Content":contentStr,"Name":nameStr,"Mobile":phoneStr], success: { (respond) in
            
            ZEHUD.showSuccessWithStatus("提交成功")
            dispatch_after(
                dispatch_time(
                    DISPATCH_TIME_NOW,
                    Int64(2 * Double(NSEC_PER_SEC))),
                dispatch_get_main_queue(),
                {
                    self.navigationController?.popViewControllerAnimated(true)
            })
            
                print(respond)
            }) { (error) in
                
                print(error)
                ZEHUD.showErrorWithStatus("提交失败,请重试")
        }
    }
}
