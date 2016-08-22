//
//  ZELocateTool.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/8.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit


class ZELocateTool: NSObject,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate {
    var provinceName :String?{
        let defaults = NSUserDefaults()
        if  (defaults.objectForKey(provinceKey) != nil) {
            return defaults.objectForKey(provinceKey) as? String
        }else{
            return "四川省"
        }
        
    }
    var cityName:String?{
        let defaults = NSUserDefaults()
        if  (defaults.objectForKey(citykey) != nil) {
            return defaults.objectForKey(citykey) as? String
        }else{
            return "成都市"
        }
    }
    
    
    private lazy var group = dispatch_group_create()
    private lazy var locateService:BMKLocationService = {
        let locate = BMKLocationService()
        locate.delegate = self
        return locate
    }()
    private lazy var geocodesearch:BMKGeoCodeSearch = BMKGeoCodeSearch()
    
    static let tool:ZELocateTool = {
        let  tool = ZELocateTool()
        return tool
        
    }()
    class func shareLocateTool()->ZELocateTool
    {
        return tool
    }
    func startLocation()
    {
      
        geocodesearch.delegate = self
        locateService.startUserLocationService()

    }
    
    
    func didUpdateBMKUserLocation(userLocation: BMKUserLocation!) {
        print(userLocation.location)
        baiduReverseGeoCode(userLocation.location.coordinate)
    }
    
    func onGetReverseGeoCodeResult(searcher: BMKGeoCodeSearch!, result: BMKReverseGeoCodeResult!, errorCode error: BMKSearchErrorCode) {
        print(result.addressDetail.city ,result.addressDetail.province)
        // 判断是否改变了城市
       let province =  (ZEUserInfo.shareUserInfo().location?.province)! as NSString
        let city = (ZEUserInfo.shareUserInfo().location?.city)! as NSString
       
        if province.isEqualToString(result.addressDetail.province) != true || city.isEqualToString(result.addressDetail.city) != true {
            ZEUserInfo.shareUserInfo().islocationChanged = true
            ZEUserInfo.shareUserInfo().saveLocation(result.addressDetail.province, cityName: result.addressDetail.city)
            NSNotificationCenter.defaultCenter().postNotificationName(locationChanged, object: self)
        }
        self.locateService .stopUserLocationService()
    }
    
    private func baiduReverseGeoCode(location:CLLocationCoordinate2D){
        
        let  reverseGeoCodeOption = BMKReverseGeoCodeOption()
        reverseGeoCodeOption.reverseGeoPoint = location
        let flag = self.geocodesearch .reverseGeoCode(reverseGeoCodeOption)
        if flag == true {
            print("反geo检索发送成功")
        }else
        {
            print("反geo检索发送失败")
        }
    }

}
