//
//  ZEUserMessage.swift
//  WelcomeNewHome
//
//  Created by wanglj on 16/7/20.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import YYKit

class ZEUserMessage: Reflect {
    var CityName:String?
    static let message:ZEUserMessage = ZEUserMessage.loadingUserMessage()
    class func shareInstance()->ZEUserMessage
    {
        return message
    }
    private class func loadingUserMessage() -> ZEUserMessage {
        var message :ZEUserMessage? = self.Cache().objectForKey("message") as? ZEUserMessage
        if message == nil {
            message = ZEUserMessage()
            //message?.saveUserMessage()
        }
        return message!
    }
    
    func saveUserMessage() {
        ZEUserMessage.Cache().setObject(self, forKey: "message")
    }
    private class func Cache() -> YYCache {
        let cache = YYCache.init(name:"ZEUserMessageCache")
        return cache!
    }
    
     required init () {
        //super.init()
        CityName = "成都市"
    }
//    convenience required init?(coder aDecoder: NSCoder) {
//        self.init()
//        self.CityName = aDecoder.decodeObjectForKey("CityName") as? String
//    }
//
//    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeObject(self.CityName, forKey: "CityName")
//    }
    
}
