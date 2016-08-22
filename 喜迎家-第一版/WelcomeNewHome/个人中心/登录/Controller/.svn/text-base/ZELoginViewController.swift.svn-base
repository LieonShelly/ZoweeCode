//
//  ZELoginViewController.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/11.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import SVProgressHUD


class ZELoginViewController: ZEBaseViewController {

    @IBOutlet weak var phoneNumTextField: UITextField!
    
    @IBOutlet weak var pwdTextField: UITextField!
    
    
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        pwdTextField.textColor = UIColor(hexString: "666666")
        phoneNumTextField.textColor =  UIColor(hexString: "666666")
        phoneNumTextField.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ZELoginViewController.isInput), name: UITextFieldTextDidChangeNotification, object: nil)
    
    }
  
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)

    }
    
    @IBAction func loginBtnClick(sender: AnyObject)
    {//e10adc3949ba59abbe56e057f20f883e
        let dict = [
            "LoginName":self.phoneNumTextField.text!,
            "PassWord":THNetworkPrivate.md5StringFromString(self.pwdTextField.text) as String,
            "UuID":THloginMessage.sharedInstance().uuid!,
            "AppCode":"4",
            "DeviceCode":THloginMessage.sharedInstance().DeviceCode!,
                  ]

    ZEHUD.showWithStatus("登录中...")
        weak var weakSelf = self
    THNetWorking.sharedInstance.THNetWorkingPost("LoginUser", paramerers: dict, success: { (JSON) in
        ZEHUD.showSuccessWithStatus("登录成功")

            print(JSON)
        let userLogInfo = ZELoginUserInfo.mj_objectWithKeyValues(JSON)
        ZELoginUserInfo.saveLoginUserInfo(userLogInfo)
        weakSelf!.navigationController?.popViewControllerAnimated(true)
            }) { (error) in
        ZEHUD.showErrorWithStatus("登录失败，请重试!!!")

          print(error)
        }
    }
   
   
    @IBAction func forgetBtnClick(sender: AnyObject)
    {
    }
    
    @IBAction func registerBtnClick(sender: AnyObject)
    {
        navigationController?.pushViewController(ZERegisterViewController(), animated: true)
    }
    
    func isInput()
    {
        print("isInput")
        let  phoneNumText : NSString  = phoneNumTextField.text!
        let pwdText:NSString = pwdTextField.text!
        
        self.loginBtn.enabled = (phoneNumText.length == 11 && pwdText.length > 5)
    
    }
    // MARK:懒加载
    
}

extension ZELoginViewController:UITextFieldDelegate
{
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
       
        let str:NSString = string
        
         let  phoneNumText : NSString  = phoneNumTextField.text!
        if  phoneNumText.length < 11  {
            return true
        }
        let cs: NSCharacterSet = NSCharacterSet(charactersInString: "0123456789")
        let strArray:NSArray = str.componentsSeparatedByCharactersInSet(cs)
        let filtered:NSString = strArray.componentsJoinedByString("")
        let basic:Bool = str.isEqualToString(filtered as String)
        
        return basic;

    }
}
