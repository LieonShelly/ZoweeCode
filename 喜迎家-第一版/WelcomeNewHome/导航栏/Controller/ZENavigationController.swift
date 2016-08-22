//
//  ZENavigationController.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/7.
//  Copyright © 2016年 Zowee. All rights reserved.
//

import UIKit
//import FDFullscreenPopGesture

class ZENavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.navigationItem.leftBarButtonItem = creatBarBttonItem()
            viewController.hidesBottomBarWhenPushed = true
            
        }
        super.pushViewController(viewController, animated: animated)
    }
    func leftBtnClick()
    {
        self.popViewControllerAnimated(true)
    }
    
    //MARK:懒加载
    
    private func creatBarBttonItem() -> UIBarButtonItem
    {
        let leftBtn:UIButton = UIButton()
        leftBtn.setImage(UIImage(named:"icon_back_蓝"), forState: UIControlState.Normal)
        leftBtn.sizeToFit()
        leftBtn.addTarget(self, action:#selector(ZENavigationController.leftBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        return UIBarButtonItem(customView: leftBtn)
    }
    

}
