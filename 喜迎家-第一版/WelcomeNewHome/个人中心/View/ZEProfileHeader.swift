//
//  ZEProfileHeader.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit

class ZEProfileHeader: UIView {
    let userIcon = UIButton()//头像
    let userName = UILabel()//昵称
    let descWord = UILabel()//描述信息

    init()
    {
        super.init(frame: CGRectMake(0, 0, ScreenW, 194))
        self.backgroundColor = UIColor.hx_colorWithHexRGBAString("5abee6")
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

    func UIinit(){
        userIcon.sd_setImageWithURL(NSURL.init(string: model.imgName), forState: UIControlState.Normal, placeholderImage: UIImage.init(named: "icon_avatar"))
        userName.text = model.nickname
        descWord.text = model.descWord
        
    }
//MARK : 初始化
    func headerViewInit(){
        self.addSubview(userName)
        self.addSubview(userIcon)
        self.addSubview(descWord)
        //描述信息
        descWord.text = "美好的一天从清晨开始"
        descWord.textAlignment = NSTextAlignment.Center
        descWord.textColor = UIColor.hx_colorWithHexRGBAString("ffffff")
        descWord.font = UIFont.systemFontOfSize(16)
        descWord.snp_makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-26/AdaptationRatioH)
            make.centerX.equalTo(self.snp_centerX)
            make.width.equalTo(self.snp_width)
            make.height.equalTo(10)
        }
        //昵称
        userName.text = "昵称"
        userName.textAlignment = NSTextAlignment.Center
        userName.textColor = UIColor.hx_colorWithHexRGBAString("ffffff")
        userName.font = UIFont.systemFontOfSize(20)
        userName.snp_makeConstraints { (make) in
            make.bottom.equalTo(descWord.snp_top).offset(-10)
            make.centerX.equalTo(self.snp_centerX)
            make.width.equalTo(self.snp_width)
            make.height.equalTo(15)
        }
        
        //头像
        userIcon .setImage(UIImage.init(named: "icon_avatar"), forState: UIControlState.Normal)
        userIcon.snp_makeConstraints { (make) in
            make.bottom.equalTo(userName.snp_top).offset(-18/AdaptationRatioH)
            make.centerX.equalTo(self.snp_centerX)
            make.width.equalTo((88/AdaptationRatioW))
            make.height.equalTo((88/AdaptationRatioH))
        }
    }
    

}
