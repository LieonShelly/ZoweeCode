//
//  ZERightBarButtonItem.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/7.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZERightBarButtonItem: ZEBarButtonItem {

    class func barButtonItem(title:String,imageName:String,hightImageName:String,action:Selector) ->ZERightBarButtonItem
    {
        let item = ZERightBarButtonItem()
        item.title = title;
        item.imageName = imageName
        item.hightImageName = hightImageName
        item.action = action
        return item
    }
}
