//
//  ZoweeHeader.swift
//  WelcomeNewHome
//
//  Created by wanglj on 16/7/8.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit
import SVProgressHUD

let urlStr = "http://120.76.78.11:8881/"


let ScreenW = UIScreen.mainScreen().bounds.size.width
let ScreenH = UIScreen.mainScreen().bounds.size.height
let iphone6With:CGFloat = 375.0


let BaiDuAK = "Lh4LPLRe3Ykgulf87LVtcEr7Dhj6i5xs"
let provinceKey = "provinceKey"
let citykey = "citykey"
let locationChanged = "locationChanged"

// 不同手机适配比例
let AdaptationRatioH = UIScreen.mainScreen().bounds.size.height / 667
let AdaptationRatioW = UIScreen.mainScreen().bounds.size.width / 375
/// 可输入字符
let NUMBERS = "0123456789"
let kAlphaNum = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

let UpdateCodePath = "UpdateCode.plist".cacheDir()


        