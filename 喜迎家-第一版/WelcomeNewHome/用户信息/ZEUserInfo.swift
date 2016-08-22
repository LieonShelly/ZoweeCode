//
//  ZEUserInfo.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/20.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEUserInfo: NSObject{
    
    var location:(province:String ,city:String)?{
        let defaults = NSUserDefaults()
        if  (defaults.objectForKey(provinceKey) != nil && defaults.objectForKey(citykey) != nil)
        {
            return(defaults.objectForKey(provinceKey) as! String,defaults.objectForKey(citykey) as! String)
        }else
        {
            return("四川","成都市")
        }
    }
    
    var islocationChanged:Bool  = false
    
    static let tool:ZEUserInfo = {
        let  tool = ZEUserInfo()
        return tool
        
    }()
    
    class func shareUserInfo()->ZEUserInfo
    {
        return tool
    }
    
    func saveLocation(province:String,cityName:String)
    {
        let defaults = NSUserDefaults()
        defaults.setValue(cityName, forKey: citykey)
        defaults.setValue(province, forKey: provinceKey)
        defaults.synchronize()
    }
}
