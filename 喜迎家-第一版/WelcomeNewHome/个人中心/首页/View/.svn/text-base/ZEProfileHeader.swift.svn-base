//
//  ZEProfileHeader.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEProfileHeader: UIView {
    let userIcon = UIButton()//头像
    let userName = UILabel()//昵称
    let descWord = UILabel()//描述信息

    var iconData: NSData?
    
    init()
    {
        super.init(frame: CGRectMake(0, 0, ScreenW, 194*AdaptationRatioH))
        self.backgroundColor = UIColor.init(hexString:"5abee6")
        headerViewInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK : 模型数据赋值
    var model : ZEPersonalHeader!{
        didSet{
            UIinit()
        }
    }

    private lazy var bgView: UIView = {
        let bgView = UIView()
        self.addSubview(bgView)
        return bgView
    }()
    
    func UIinit(){
        userIcon.sd_setImageWithURL(NSURL.init(string: model.imgName), forState: UIControlState.Normal, placeholderImage: UIImage.init(named: "icon_avatar"))
        userName.text = model.nickname
        descWord.text = model.descWord
        
        self.layoutSubviews()
    }
    //MARK : 初始化
    func headerViewInit(){
        
        self.addSubview(userIcon)
        self.addSubview(descWord)
        
        //描述信息
       // descWord.text = model.descWord
        descWord.textAlignment = NSTextAlignment.Center
        descWord.textColor = UIColor.init(hexString:"ffffff")
        descWord.font = UIFont.systemFontOfSize(16)
        descWord.snp_makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-26*AdaptationRatioH)
            make.centerX.equalTo(self.snp_centerX)
            make.width.equalTo(self.snp_width)
            make.height.equalTo(18)
        }
        
        bgView.snp_makeConstraints { (make) in
            make.bottom.equalTo(descWord.snp_top).offset(-5)
            make.centerX.equalTo(self.snp_centerX)
            make.width.equalTo(self.snp_width)
            make.height.equalTo(20)
        }
        
        //头像
        userIcon.layer.masksToBounds = true
        userIcon.layer.cornerRadius = 88*AdaptationRatioH/2
        userIcon.setImage(UIImage.init(named: "icon_avatar"), forState: UIControlState.Normal)
        userIcon.addTarget(self, action: #selector(ZEProfileHeader.userIconClick), forControlEvents: UIControlEvents.TouchUpInside)
        userIcon.snp_makeConstraints { (make) in
            make.bottom.equalTo(bgView.snp_top).offset(-18*AdaptationRatioH)
            make.centerX.equalTo(self.snp_centerX)
            make.width.equalTo((88*AdaptationRatioW))
            make.height.equalTo((88*AdaptationRatioH))
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.removeAllSubviews()
        //print(iconData)
        if iconData != nil{
            
            userIcon.setImage(UIImage(data: iconData!), forState: UIControlState.Normal)
        }
        if ZELoginUserInfo.loginUserInfo().UserToken != nil{
            bgView.addSubview(userName)
            userName.textAlignment = NSTextAlignment.Center
            userName.textColor = UIColor.init(hexString: "ffffff")
            userName.font = UIFont.systemFontOfSize(20)
            userName.snp_makeConstraints { (make) in
                make.bottom.equalTo(bgView)
                make.centerX.equalTo(bgView)
                make.width.equalTo(bgView)
                make.height.equalTo(15)
            }
        }else{
            //login && register
            let line = UIView()
            bgView.addSubview(line)
            line.backgroundColor = UIColor.whiteColor()
            line.snp_makeConstraints { (make) in
                make.centerX.equalTo(bgView)
                make.bottom.equalTo(bgView)
                make.height.equalTo(bgView)
                make.width.equalTo(2)
            }
            
            let loginBtn = UIButton()
            loginBtn.titleLabel?.font = UIFont.systemFontOfSize(20)
            bgView.addSubview(loginBtn)
            loginBtn.setTitle("登录", forState: UIControlState.Normal)
            loginBtn.addTarget(self, action: #selector(ZEProfileHeader.loginBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
            loginBtn.snp_makeConstraints { (make) in
                make.right.equalTo(line).offset(-5)
                make.height.equalTo(bgView)
                make.centerY.equalTo(bgView)
            }
            
            let registerBtn = UIButton()
            registerBtn.titleLabel?.font = UIFont.systemFontOfSize(20)
            bgView.addSubview(registerBtn)
            registerBtn.setTitle("注册", forState: UIControlState.Normal)
            registerBtn.addTarget(self, action: #selector(ZEProfileHeader.registerBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
            registerBtn.snp_makeConstraints { (make) in
                make.left.equalTo(line).offset(5)
                make.height.equalTo(bgView)
                make.centerY.equalTo(bgView)
            }
        }
    }
    
    func loginBtnClick(){
        let SB = UIStoryboard.init(name: "ZPersonalCenter", bundle: nil)
        let loginVC = SB.instantiateViewControllerWithIdentifier("ZELoginViewController")
        THURLNavigation.pushViewController(loginVC, animated: true)
    }
    
    func registerBtnClick(){
        THURLNavigation.pushViewController(ZERegisterViewController.init(), animated: true)
    }
    
    func userIconClick(){
        if ZELoginUserInfo.loginUserInfo().UserToken != nil{
            let VC = ZEPersonalInfoViewController.init()
            VC.iconDataBlock = { iconData in
                self.iconData = iconData //接收修改后的头像data 
            }
            THURLNavigation.pushViewController(VC, animated: true)
        }else{
            let SB = UIStoryboard.init(name: "ZPersonalCenter", bundle: nil)
            let loginVC = SB.instantiateViewControllerWithIdentifier("ZELoginViewController")
            THURLNavigation.pushViewController(loginVC, animated: true)
        }
        
    }
    
}
