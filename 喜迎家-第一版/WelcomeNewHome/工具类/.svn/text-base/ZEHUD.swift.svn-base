//
//  ZEHUD.swift
//  WelcomeNewHome
//
//  Created by wanglj on 16/7/15.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import SVProgressHUD

class ZEHUD: NSObject {
    
    class func showErrorWithStatus(status: String!)  {
        HUDConfig()
        SVProgressHUD.showErrorWithStatus(status)
    }
    class func showSuccessWithStatus(status: String!) {
        HUDConfig()
        SVProgressHUD.showSuccessWithStatus(status)
    }
    class func showWithStatus(status: String!){
        HUDConfig()
        SVProgressHUD.showWithStatus(status)
    }
    class func HUDConfig() {
        SVProgressHUD.setMinimumDismissTimeInterval(2)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Black)
    }

}
