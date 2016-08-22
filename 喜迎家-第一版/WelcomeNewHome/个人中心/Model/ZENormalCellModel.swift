//
//  ZENormalCell.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZENormalCellModel: NSObject {
    var imgName: String!
    var titleStr: String!
    init(imgName: String!,titleStr: String!) {
        super.init()
        self.imgName = imgName
        self.titleStr = titleStr
    }
}
