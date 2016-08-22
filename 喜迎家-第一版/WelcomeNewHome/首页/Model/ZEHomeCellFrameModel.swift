//
//  ZEHomeCellFrameModel.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/15.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEHomeCellFrameModel: NSObject {

    var homeImage:ZEHomeImage?
    {
        didSet{
            switch homeImage!.Type! {
  
            case 2:
                cellSize = CGSizeMake(ScreenW/5.0, (146 * 0.5) / (iphone6With / 5.0) * ScreenW/5.0)
                minimumLineSpacing = 0
                minimumInteritemSpacing = 0
                
            case 3:
                cellSize = CGSizeMake((ScreenW - 1) * 0.5, (130 / 376.0 )*((ScreenW - 1) * 0.5))
                minimumLineSpacing = 1
                minimumInteritemSpacing = 1
                
            case 4:
                cellSize = CGSizeMake((ScreenW - 1) * 0.5, 268 / 376.0 * ((ScreenW - 1) * 0.5))
                minimumLineSpacing = 1
                minimumInteritemSpacing = 1
            default:
                print(homeImage!.Type!)
            }
            
        }
    }
    var cellSize:CGSize?
    var minimumLineSpacing:CGFloat?
    var minimumInteritemSpacing:CGFloat?
    var sectionInset:UIEdgeInsets?
    
    
    
    class   func  loadHomeCellFrame(param:Dictionary<String,String>, success:((homeCellFrame:ZEHomeCellFrameModel)->(Void)),failure:((error:NSError)->(Void)))
    {
        
        THNetWorking.sharedInstance.THNetWorkingPost("LoadIndexImg", paramerers: param, success: { (JSON) in
            
            let homeImage = ZEHomeImage.mj_objectWithKeyValues(JSON)
            let homeCellFrame = ZEHomeCellFrameModel()
            
            homeCellFrame.homeImage = homeImage
            success(homeCellFrame: homeCellFrame)
            // 存储更新码
            let code:NSString = homeImage.UpdateCode! as NSString
            do{
                try code.writeToFile(UpdateCodePath, atomically: true, encoding: NSUTF8StringEncoding)
            }
            catch{
                print(error)
            }
        }) { (error) in
            failure(error: error)
        }
    }
    
}
