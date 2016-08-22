//
//  UIResponder+Router.swift
//  testUIResponder
//
//  Created by wanglj on 16/7/14.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

extension UIResponder {
    func routerEvent(eventName: String, userInfo: Dictionary<String,String>) -> Void{
        print("++++++++++++responer:\(self.classForCoder),userInfo:\(userInfo)")
        self.nextResponder()?.routerEvent(eventName, userInfo: userInfo)

    }
}