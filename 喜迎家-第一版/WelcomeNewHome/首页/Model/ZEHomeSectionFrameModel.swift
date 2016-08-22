//
//  ZEHomeSectionFrameModel.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/19.
//  Copyright © 2016年 TH. All rights reserved.
// viewmodel

import UIKit
import YYKit

class ZEHomeSectionFrameModel: Reflect {

    var minimumLineSpacing:CGFloat = 0
    var minimumInteritemSpacing:CGFloat = 0
    var sectionHeaderDataArray:[ZEHomeImage] = [ZEHomeImage]()
    var sectionHeaderSize = CGSizeZero
    var sectionInset:UIEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    var cellDataArray:[ZEHomeImage] = [ZEHomeImage]()
    var cellSize:CGSize = CGSizeZero
    var cellID:String?
    var specialCellSizeArray:[CGSize] = [CGSize]()
    
    class   func  loadHomeSectionFrame(param:Dictionary<String,String>, success:((frameArray:[ZEHomeSectionFrameModel])->(Void)),failure:((error:NSError)->(Void)))
    {
        THNetWorking.sharedInstance.THNetWorkingPost("LoadIndexImg", paramerers: param, success: { (JSON) in
            
            //  数据模型数组
            var homeImageArray = ZEHomeImage.mj_objectArrayWithKeyValuesArray(JSON)
            if homeImageArray == nil || homeImageArray.count == 0  {
               homeImageArray = NSMutableArray.init(array: self.loadingCache())
            } else {
                self.saveCache(homeImageArray)
            }
            // 遍历数组
            var frameArray:[ZEHomeSectionFrameModel] = [ZEHomeSectionFrameModel]()
         
//            let bannerFrameModel = creatBannerFrameModel()
            
            let funcBtnFrameModel = creatFunctionBntFrameModel()
            let fullSenceFrameModel = creatFunctionFullSenceModel()
            let packageFrameModel = creatPackagePicFrameModel()
            for image in homeImageArray
            {
                let homeImage = image as! ZEHomeImage
                // 存储更新码
                saveUpdateCode(homeImage)
                switch homeImage.ImageType!
                {
                    
                    case "1":
        
                        funcBtnFrameModel.sectionHeaderDataArray.append(homeImage)
                    
                    case "2":
                         funcBtnFrameModel.cellDataArray.append(homeImage)
                    
                    case "3":
                      
                        fullSenceFrameModel.cellDataArray.append(homeImage)
                    
                    case "4":
                       
                        packageFrameModel.cellDataArray.append(homeImage)
                    
                    default:
                        break
                }
            }
            
            frameArray.append(funcBtnFrameModel)
            frameArray.append(fullSenceFrameModel)
            frameArray.append(packageFrameModel)
            ZEHomeSectionFrameModel.save(obj: frameArray, name: "frameArray", duration: 60.0 * 60.0)
            success(frameArray: frameArray)
            
        }) { (error) in
            failure(error: error)
        }
    }


    private  class func saveUpdateCode(homeImage:ZEHomeImage)
    {
        let code:NSString = homeImage.UpdateCode! as NSString
        do{
            try code.writeToFile(UpdateCodePath, atomically: true, encoding: NSUTF8StringEncoding)
        }
        catch{
            print(error)
        }
    }
   private class func creatBannerFrameModel() -> ZEHomeSectionFrameModel
    {
        
        let frameModel = ZEHomeSectionFrameModel()
        frameModel.sectionHeaderSize = CGSizeMake(ScreenW, ((392*0.5)/iphone6With)*ScreenW)
        frameModel.minimumLineSpacing = 0
        frameModel.minimumInteritemSpacing = 0
        frameModel.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        return frameModel
    }
    
   private class func creatFunctionBntFrameModel() -> ZEHomeSectionFrameModel
    {
        let frameModel = ZEHomeSectionFrameModel()
        frameModel.sectionHeaderSize = CGSizeMake(ScreenW, ((392*0.5)/iphone6With)*ScreenW)
        let width : Int = Int(ScreenW/5);
        frameModel.cellSize = CGSizeMake(ScreenW/5, (170 * 0.5) / (iphone6With / 5.0) * ScreenW/5.0)
        frameModel.minimumLineSpacing = 0
        frameModel.minimumInteritemSpacing = 0
        let widthinset = Int(ScreenW - CGFloat(width*5))
        for index in 1 ... 5 {
            let specwidth = CGFloat(width + 1)
            if index <= widthinset {
                frameModel.specialCellSizeArray.append(CGSizeMake(specwidth, (170 * 0.5) / (iphone6With / 5.0) * ScreenW/5.0))
            }else {
                frameModel.specialCellSizeArray.append(CGSizeMake(CGFloat(width), (170 * 0.5) / (iphone6With / 5.0) * ScreenW/5.0))
            }
        }
        frameModel.sectionInset = UIEdgeInsetsMake(0, 0, 1, 0)
       // frameModel.specialCellSizeArray = [CGSizeZero,CGSizeZero,CGSizeZero,CGSizeZero,CGSizeZero]
        frameModel.cellID = "ZEFuncBtnCollectionViewCell"
        return frameModel
    }
   private class func creatFunctionFullSenceModel() -> ZEHomeSectionFrameModel
    {
        let frameModel = ZEHomeSectionFrameModel()
        frameModel.cellSize = CGSizeMake((ScreenW - 1) * 0.5, (130 / 376.0 )*((ScreenW - 1) * 0.5))
        frameModel.minimumLineSpacing = 1
        frameModel.minimumInteritemSpacing = 1
        frameModel.sectionInset = UIEdgeInsetsMake(0, 0, 1, 0)
        frameModel.cellID = "ZEFullSenceCollectionViewCell"
        return frameModel
    }
    
    
   private class func creatPackagePicFrameModel() -> ZEHomeSectionFrameModel
    {
        let frameModel = ZEHomeSectionFrameModel()
        frameModel.cellSize = CGSizeMake((ScreenW - 1) * 0.5, (ScreenH - 64 - 2 - ((392*0.5)/iphone6With)*ScreenW - (170 * 0.5) / (iphone6With / 5.0) * ScreenW/5.0 - (130 / 376.0 )*((ScreenW - 1) * 0.5)) * 0.5)
        frameModel.minimumLineSpacing = 1
        frameModel.minimumInteritemSpacing = 1
        frameModel.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        frameModel.cellID = "ZEPackageCollectionViewCell"
        
        return frameModel
    }
    //MARK: cache
    private class func Getcache() -> YYCache {
        return YYCache.init(name: "loadingIndexImageCache")!
    }
    private class func saveCache(homeImageArray:NSArray) {
        self.Getcache().setObject(homeImageArray, forKey: "homeImageArray")
    }
    private class func loadingCache() -> NSArray {
        return self.Getcache().objectForKey("homeImageArray") as! NSArray
    }
    
    
}
