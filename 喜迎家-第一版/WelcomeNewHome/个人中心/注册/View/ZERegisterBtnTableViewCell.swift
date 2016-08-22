//
//  ZERegisterBtnTableViewCell.swift
//  WelcomeNewHome
//
//  Created by wanglj on 16/7/12.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZERegisterBtnTableViewCell: baseTableViewCell {

    var registerModel:ZERegister?
    var registerEnable = false {
        didSet{
           registerBtn?.enabled = registerEnable
        }
    }
    private var registerBtn:UIButton?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setup() {
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.separatorInset = UIEdgeInsetsMake(0, ScreenW, 0, 0)
        let CheckBtn = UIButton.init()
        CheckBtn.setImage(UIImage.init(named: "register_protocal_selected"), forState: UIControlState.Selected)
        CheckBtn.setImage(UIImage.init(named: "register_protocal_nonmal"), forState: UIControlState.Normal)
        CheckBtn.addTarget(self, action: #selector(aggrenBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        contentView.addSubview(CheckBtn)
        CheckBtn.snp_makeConstraints { (make) in
            make.top.equalTo(contentView.top).offset(15)
            make.left.equalTo(contentView.snp_left).offset(32)
            make.size.equalTo(CGSize(width: 26,height: 26))
        }
        let lab = UILabel.init()
        lab.text = "已阅读《用户协议》";
        contentView.addSubview(lab)
        lab.snp_makeConstraints { (make) in
            make.centerY.equalTo(CheckBtn)
            make.left.equalTo(CheckBtn.snp_right).offset(7)
            make.right.equalTo(contentView.snp_right).offset(32)
            make.height.equalTo(17)
        }
        
        let registerBtn = UIButton.init()
        self.registerBtn = registerBtn
        registerBtn.setTitle("立即注册", forState: UIControlState.Normal)
        registerBtn.addTarget(self, action: #selector(registBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        registerBtn.setBackgroundImage(UIImage.init(color: UIColor.init(hexString: "5abee6")!), forState: UIControlState.Normal)
        registerBtn.setBackgroundImage(UIImage.init(color: UIColor.init(hexString: "addff3")!), forState: UIControlState.Disabled)
        registerBtn.layer.masksToBounds = true
        registerBtn.layer.cornerRadius = 5
        contentView.addSubview(registerBtn)
        registerBtn.snp_makeConstraints { (make) in
            make.top.equalTo(lab.snp_bottom).offset(15)
            make.left.equalTo(contentView.snp_left).offset(32)
            make.right.equalTo(contentView.snp_right).offset(-32)
            make.height.equalTo(40)
        }
    }
    func aggrenBtnClick(btn:UIButton) -> Void {
        registerModel?.agrent = !(registerModel?.agrent)!
        btn.selected = (registerModel?.agrent)!
        registerBtnEnable()
    }
    func registerBtnEnable() -> Void {
        if registerModel?.StrMobile.characters.count != 11 {
            registerEnable = false
            return
        }
        if registerModel?.PassWord != registerModel?.PassWordEN {
            registerEnable =  false
            return
        }
        if registerModel?.Code.characters.count != 6 {
            registerEnable =  false
            return
        }
        registerEnable = (registerModel?.agrent)!
    }
    func registBtnClick(Btn:UIButton) -> Void {
        let dic = [
            "StrMobile":(registerModel?.StrMobile)!,
            "PassWord": THNetworkPrivate.md5StringFromString((registerModel?.PassWord)!)!,
            "Code":(registerModel?.Code)!
        ]
        print(registerModel?.toDict())
        self.routerEvent("userRegister", userInfo: dic)
    }
}
