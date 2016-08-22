//
//  ZELoginUserInfo.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/14.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit


class ZELoginUserInfo:Reflect{

///     	Integer	 用户id
    var UserID :NSNumber?
    
    /// 	String
    var UserToken:String?
    
    /// 	String	用户昵称
    var UserName:String?
    
    /// String	头像路径
     var Url:String?
    
      /// String	电话号码
     var Mobile:String?
   
 
    /**
     保存用户信息
     */
    class func saveLoginUserInfo(userInfo:ZELoginUserInfo)
    {
        
        NSKeyedArchiver.archiveRootObject(userInfo, toFile: "userInfo.data".cacheDir())
    }
    
    /**
     获取用户信息
     */
    class func loginUserInfo() -> ZELoginUserInfo
    {
    let userLogInfo = NSKeyedUnarchiver.unarchiveObjectWithFile("userInfo.data".cacheDir()) as? ZELoginUserInfo
        return userLogInfo != nil ? userLogInfo!:ZELoginUserInfo()
    }
    
    /**
     *  清除用户登录信息
     */
    class func cleaarUserLoginfo()
    {
        let manager = NSFileManager.defaultManager()
        
        let path:String = "userInfo.data".cacheDir()
        
        let have = manager.fileExistsAtPath(path as String)
        if have {
            do {
               try manager.removeItemAtPath(path)
                
            }catch{
                print(error)
            }
            
            
        }else{
            print("filePath do not exist")
            return
        }
    }
}


