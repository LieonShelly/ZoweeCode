//
//  UIButton+Category.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/7.
//  Copyright © 2016年 Zowee. All rights reserved.
//

import UIKit

extension UIButton{

    class func createButton(target:AnyObject?,action: Selector,imageName:String?) -> UIButton
    {
        let rightBtn:UIButton = UIButton()
        rightBtn.setImage(UIImage(named:imageName!), forState: UIControlState.Normal)
        rightBtn.sizeToFit()
        rightBtn.addTarget(target, action:action, forControlEvents: UIControlEvents.TouchUpInside)
        return rightBtn
    }
}
