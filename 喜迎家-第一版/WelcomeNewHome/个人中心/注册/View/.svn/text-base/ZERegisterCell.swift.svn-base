//
//  ZEUIColor.swift
//  WelcomeNewHome
//
//  Created by wanglj on 16/7/11.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import SVProgressHUD

class ZERegisterCell: baseTableViewCell {

    var registerModel:ZERegister?
    let iconView = UIImageView.init()
    let textInput = UITextField.init()
    let timeLabel = UILabel.init()
    private var timer:NSTimer?
    var plachText:String?{
        didSet{
            textInput.placeholder = plachText
        }
    }
    var showBtn:Bool = false{
        didSet{
            CodeBtn.hidden = !showBtn
            timeLabel.hidden = !showBtn
        }
    }
    let CodeBtn = UIButton.init()
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func setup() {
        self.selectionStyle = UITableViewCellSelectionStyle.None
        contentView.addSubview(iconView)
        iconView.snp_makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp_centerY)
            make.left.equalTo(contentView.snp_left).offset(32)
            make.size.equalTo(CGSize(width: 16,height: 20))
        }
        let label = UILabel.init()
        label.backgroundColor = UIColor.init(hexString: "bfbfbf")
        contentView.addSubview(label)
        label.snp_makeConstraints { (make) in
            make.left.equalTo(iconView.snp_right).offset(14)
            make.width.equalTo(0.5)
            make.top.equalTo(iconView.snp_top)
            make.bottom.equalTo(iconView.snp_bottom)
        }
        contentView.addSubview(textInput)
        textInput.clearButtonMode = UITextFieldViewMode.Always
        textInput.snp_makeConstraints { (make) in
            make.left.equalTo(label.snp_right).offset(14)
            make.top.equalTo(contentView.snp_top)
            make.bottom.equalTo(contentView.snp_bottom)
            make.right.equalTo(contentView.snp_right).offset(-32)
        }
        contentView.addSubview(CodeBtn)
        CodeBtn.snp_makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp_centerY)
            make.right.equalTo(contentView.snp_right).offset(-32)
            make.size.equalTo(CGSize(width: 90,height: 30))
        }
        CodeBtn.addTarget(self, action: #selector(startTime), forControlEvents: UIControlEvents.TouchUpInside)
        CodeBtn.setBackgroundImage(UIImage.init(color: UIColor.init(hexString: "5abee6")!), forState: UIControlState.Normal)
        CodeBtn.setBackgroundImage(UIImage.init(color: UIColor.init(hexString: "addff3")!), forState: UIControlState.Disabled)
        CodeBtn.layer.masksToBounds = true
        CodeBtn.layer.cornerRadius = 3
        //CodeBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        CodeBtn.hidden = true
        timeLabel.textColor = UIColor.whiteColor()
        timeLabel.font = UIFont.systemFontOfSize(14)
        timeLabel.textAlignment = NSTextAlignment.Center
        contentView.addSubview(timeLabel)
        timeLabel.snp_makeConstraints { (make) in
            make.top.equalTo(CodeBtn.snp_top)
            make.bottom.equalTo(CodeBtn.snp_bottom)
            make.left.equalTo(CodeBtn.snp_left)
            make.right.equalTo(CodeBtn.snp_right)
        }
        timeLabel.text = "获取验证码"
    }
    func startTime(btn:UIButton) -> Void {
        if self.registerModel?.StrMobile.characters.count != 11 {
            SVProgressHUD.showErrorWithStatus("请先输入正确的手机号")
            SVProgressHUD.setMinimumDismissTimeInterval(2)
            SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.Clear)
            return;
        }
        requestCode()
        btn.enabled = false
        if let timers = self.timer {
            timers.invalidate()
        }
        var time = 59
        let timer = NSTimer.init(timeInterval: 1, block: { (timer) in
            self.timeLabel.text = "\(time)秒后重试"
            time = time - 1
            print(time)
            if time == -2 {
                timer.invalidate()
                btn.enabled = true
                self.timeLabel.text = "获取验证码"
            }

            }, repeats: true)
        self.timer = timer
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    }
    
    
    func requestCode() -> Void {
        self.routerEvent("VerificationCode", userInfo: ["StrMobile":(registerModel?.StrMobile)!])
    }
}
