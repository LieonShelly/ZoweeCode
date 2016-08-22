//
//  ZEHomeImage.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/14.
//  Copyright © 2016年 TH. All rights reserved.
// model

import UIKit
import ObjectMapper

class ZEHomeImage: Reflect {

    /// 	String	 图片路径
    var ImagePath:String?
    
    ///  	String	图片说明
    var ImageRemark:String?
    
    /// UpdateCode	Int	更新码
    var UpdateCode:String?
    var ImageType:String?
    ///  图片跳转路径
    var Url:String?
    
    
     class func getUpdateCode() -> String
    {
        do {
            let updateCode = try NSString(contentsOfFile: UpdateCodePath, encoding: NSUTF8StringEncoding)
            return updateCode as String
        }catch{
            return "0"
        }
        
    }
    
}
