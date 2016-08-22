//
//  ZEMessageModel.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEMessageModel: NSObject {
    //Type   消息类型  1.系统消息 2福利消息 3订单消息
    var Type: NSNumber?
    //MessageTime   消息时间    如：2015-09-17
    var MessageTime: String?
    //Content   消息内容
    var Content: String?
    //Num   未读消息数量
    var Num: NSNumber?
    
}
