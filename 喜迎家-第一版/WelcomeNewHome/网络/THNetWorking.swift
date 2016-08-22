//
//  THNetWorking.swift
//  WelcomeNewHome
//
//  Created by wanglj on 16/7/7.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import AFNetworking
import MJExtension
import YYKit

let noneCache:NSTimeInterval = -1
let oneMinute:NSTimeInterval = 60
let threeMinute:NSTimeInterval = 60*3
let oneHour:NSTimeInterval = 60*oneMinute
let oneDay:NSTimeInterval = 24*oneHour

class THNetWorking: NSObject {
    
    private let sessionManage = AFHTTPSessionManager.init(baseURL:NSURL.init(string:urlStr))
    private let cacheManager = YYCache.init(name: "NetWorkingCache")
    private let dateFormatStr = "yyyy-MM-dd HH:mm:ss"
    static let sharedInstance = THNetWorking()
    private override init() {
        sessionManage.responseSerializer = AFHTTPResponseSerializer.init()
    }
    
    //MARK: 请求方法
    /**
     默认的请求方法没有缓存
     
     - parameter Action:     请求动作
     - parameter paramerers: 请求参数
     - parameter success:    请求成功操作
     - parameter failure:    失败操作
     */
    func THNetWorkingPost(Action: String, paramerers:Dictionary<String,String>, success:((AnyObject) -> Void), failure: ((NSError) -> Void)) -> Void {
        self.THNetWorkingPost(Action, paramerers: paramerers, cacheTime: noneCache, success: success, failure: failure)
    }
    /**
     缓存的请求
     
     - parameter Action:     请求动作
     - parameter paramerers: 参数
     - parameter cacheTime:  缓存有效时间 :oneMinute/oneHour
     - parameter success:    成功
     - parameter failure:    失败
     */
    func THNetWorkingPost(Action: String, paramerers:Dictionary<String,String>,cacheTime:NSTimeInterval, success:((AnyObject) -> Void), failure: ((NSError) -> Void)) -> Void {
        let cacheObject = loadCacheWith(Action, RequestPar: paramerers)
        if cacheObject != nil {
            success(cacheObject!)
            return
        }
        let params = THNetworkPrivate.requestCryptographyWithAction(Action, parameter: paramerers)
        sessionManage.POST("", parameters: params, progress:nil, success: { (DataTask, Respone) in
            let netWorkModel:THNetWorkBaseModel = THNetworkPrivate.decipheringWithResponeData(Respone) as! THNetWorkBaseModel
            if netWorkModel.r == resultType.Invalid{
                print("错误:返回的数据%@",netWorkModel)
                failure(NSError.init(domain: "返回结构中的\"r\"失效,"+netWorkModel.ErrMsg, code: 0, userInfo: nil))
                self.checkedResponseErrorCode(netWorkModel.Err)
                return
            }else{
                success(self.getResponeClass(netWorkModel))
                self.saveCacheWith(Action, RequestPar: paramerers, cacheTime:cacheTime, respone:netWorkModel)
                return
            }
        }) { (DataTask, Error) in
            print("\nFuck!!!!!!!!!!!!!!!!!!!!\n")
            ZEHUD.showErrorWithStatus("网络错误")
            failure(Error)
        }
    }
    //MARK: 数据处理
    /**
     接口返回数据
     
     - parameter Model: 返回的结果
     
     - returns: 返回数据
     */
    private func getResponeClass(Model: THNetWorkBaseModel) -> AnyObject {
        return Model.d
    }
    
    private func checkedResponseErrorCode(error: NetworkResponeError) -> Void {
        switch error {
        case NetworkResponeError.NCODE_DATA_IS_NULL,NetworkResponeError.NCODE_RESPONSE_CODE_ZERO,
            NetworkResponeError.NCODE_PARSE_UNSUPPORTED_ENCODING,NetworkResponeError.NCODE_TIME_OUT,
             NetworkResponeError.NCODE_SERVER_DISCONNECT,NetworkResponeError.NCODE_PARSE_ERROR:
            ZEHUD.showErrorWithStatus("错误码:\(error)")
        case NetworkResponeError.NCODE_LOGIN_OUT,NetworkResponeError.NCODE_TOKEN_ERROR:
            print("")
        case NetworkResponeError.NCODE_LOGINUSER_ERROR:
            ZEHUD.showErrorWithStatus("错误的用户名或密码")
        case NetworkResponeError.NCODE_NULLOBJECT_ERROR:
            ZEHUD.showErrorWithStatus("无效的空对象")
        case NetworkResponeError.NCODE_VERSIONLOW_ERROR:
            ZEHUD.showErrorWithStatus("数据验证失败")
        case NetworkResponeError.NCODE_NULLPOWER_ERROR:
            ZEHUD.showErrorWithStatus("无操作权限")
        case NetworkResponeError.NCODE_XYJ_ERROR:
            ZEHUD.showErrorWithStatus("验证码错误")
        case NetworkResponeError.NCODE_ACCOUNT_ERROR:
            ZEHUD.showErrorWithStatus("账号已注册")
        default:
            print("")
        }
    }
    //MARK: 网络缓存
    /**
     根据请求的Action和parameter生成缓存文件名
     
     - parameter NetWorkingAction: 请求动作名
     - parameter RequestParameter: 请求参数
     
     - returns: 文件名
     */
    private func cacheFileName(NetWorkingAction:String, RequestParameter: Dictionary<String,String>) -> String {
        let RequestDic = NSDictionary.init(dictionary: RequestParameter)
        let parameterStr = String.init(RequestDic.mj_JSONString())
        let versionCode = String.init(THNetworkPrivate.appVersionString)
        let fileName  = NetWorkingAction + parameterStr + versionCode
        return  String.init(NSString.init(string: fileName).md5String())
    }
    /**
     根据缓存文件名生成缓存时间文件名
     
     - returns: 缓存时间文件名
     */
    private func cacheTimeFileName(cacheFileName: String) ->String {
        return cacheFileName + "Time"
    }
    /**
     加载缓存
     
     - parameter Action:     请求动作
     - parameter RequestPar: 请求参数
     
     - returns: 缓存结果
     */
    private func loadCacheWith(Action: String, RequestPar: Dictionary<String,String>) ->AnyObject? {
        let FileName = cacheFileName(Action, RequestParameter: RequestPar)
        let cacheTimeName = cacheTimeFileName(FileName)
        let time = cacheManager?.objectForKey(cacheTimeName)
        if let Time = time {
            let date = NSDate.init(string: Time as! String, format: dateFormatStr)
            let seconds = (date?.timeIntervalSinceNow)!
            if seconds > 0 {
                let cacheObject = cacheManager?.objectForKey(FileName)
                if let object = cacheObject {
                    return (object as! THNetWorkBaseModel).d
                }
            }
            
        }
        return nil
    }
    /**
     保存缓存
     
     - parameter Action:     请求动作
     - parameter RequestPar: 请求参数
     */
    private func saveCacheWith(Action: String, RequestPar: Dictionary<String,String>,cacheTime: NSTimeInterval, respone: THNetWorkBaseModel) {
        let FileName = cacheFileName(Action, RequestParameter: RequestPar)
        let cacheTimeName = cacheTimeFileName(FileName)
        let cacheDate = NSDate.init(timeIntervalSinceNow: cacheTime)
        let cacheDateStr = cacheDate.stringWithFormat(dateFormatStr)
        
        cacheManager?.setObject(cacheDateStr, forKey: cacheTimeName)
        cacheManager?.setObject(respone, forKey: FileName)
        
        
    }
    /**
     上传头像
     
     */
    
    func createUploadTaskWith(Action: String, requestPar:Dictionary<String,String>,loadFile:upLoadFile,success:((AnyObject) -> Void), failure: ((NSError) -> Void)) ->Void{
        var param = THNetworkPrivate.requestCryptographyWithAction(Action, parameter: requestPar)
        param = "\(urlStr)UploadFile.aspx?s=\(param)"
        print(param)
        
        let request = AFHTTPRequestSerializer().multipartFormRequestWithMethod("POST", URLString: param, parameters: nil, constructingBodyWithBlock: { (formData: AFMultipartFormData) in
            formData.appendPartWithFileData(loadFile.fileData, name: loadFile.name, fileName: loadFile.fileName, mimeType: loadFile.type)
            }, error: nil)
        let manager = AFURLSessionManager(sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration())
        manager.responseSerializer = AFHTTPResponseSerializer()
        let uploadTask:NSURLSessionUploadTask = manager.uploadTaskWithStreamedRequest(request, progress: nil) { (response, responseObject, error) in
            if (error != nil){
                print(error)
                failure(error!)
            }else{
                print(response,responseObject)
                let responseDict = THNetworkPrivate.decipheringWithResponeData(responseObject)
                success(responseDict)
            }
        }
        uploadTask.resume()
    }
}
