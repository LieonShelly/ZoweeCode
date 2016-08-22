//
//  UIColor+Category.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/7.
//  Copyright © 2016年 Zowee. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func randomColor() -> UIColor
    {
        let r = arc4random_uniform(256)
        let g = arc4random_uniform(256)
        let b = arc4random_uniform(256)
       return  UIColor(red: CGFloat(r)/256.0, green: CGFloat(g)/256.0, blue: CGFloat(b)/256.0, alpha: 1.0)
    }
}
