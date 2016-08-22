//
//  UILabel+Category.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/22.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

extension UILabel{
    
    func labelWidth() -> CGFloat{
        let contentText: NSString = self.text!
        let size = contentText.sizeWithAttributes([NSFontAttributeName : self.font])
        return size.width
    }
}