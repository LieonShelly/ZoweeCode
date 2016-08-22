//
//  ZESettingViewController.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import SDWebImage.SDImageCache
class ZESettingViewController: ZEBaseViewController {

    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var totalCache: UILabel!
    @IBOutlet weak var lineOneHeight: NSLayoutConstraint!
    @IBOutlet weak var lineTwoHeight: NSLayoutConstraint!
    @IBOutlet weak var lineThreeHeight: NSLayoutConstraint!
    let cache = SDImageCache.sharedImageCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "设置"
        lineOneHeight.constant = 0.5
        lineTwoHeight.constant = 0.5
        lineThreeHeight.constant = 0.5
        
        let cacheSize = cache.getSize()/1024/1024
        if cacheSize < 1{
            totalCache.text = "\(cache.getSize()/1024)K"
        }else{
            totalCache.text = "\(cacheSize)M"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushNotifBtnClick(sender: UIButton) {
        switchBtn.selected = !switchBtn.selected
    }

    @IBAction func switchBtnClick(sender: UIButton) {
        switchBtn.selected = !switchBtn.selected
    }
    
    @IBAction func changePassword(sender: UIButton) {
        
    }
    
    @IBAction func cleanCache(sender: UIButton) {
        self.cleanCache()
    }
    
    @IBAction func logOut(sender: UIButton) {
        
        ZELoginUserInfo.cleaarUserLoginfo()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func cleanCache(){
        let cacheSize = cache.getSize()/1024/1024
        var msg = "程序缓存\(cacheSize)M,确认清除吗?"
        if cacheSize < 1{
            msg = "程序缓存\(cache.getSize()/1024)K,确认清除吗?"
        }
        
        let alertVC = UIAlertController(title: "清除缓存", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alertVC.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil))
        alertVC.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Destructive) { (action) in
            self.cache.clearMemory()
            self.cache.clearDisk()
            ZEHUD.showSuccessWithStatus("清理成功")
            let cacheSize = self.cache.getSize()/1024
            self.totalCache.text = "\(cacheSize)k"
            })
        self.presentViewController(alertVC, animated: true, completion: nil)
    }
}
