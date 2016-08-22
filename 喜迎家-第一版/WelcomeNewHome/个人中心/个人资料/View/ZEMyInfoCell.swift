//
//  ZEMyInfoCell.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 TH. All rights reserved.
//

typealias userNameBlock = (String)->()
import UIKit

class ZEMyInfoCell: baseTableViewCell,UITextFieldDelegate {
    let titleLab = UILabel()
    let iconImgView = UIImageView()
    var contentTF = UITextField()
    let arrow = UIImageView()
    var isFirstLine: Bool? //是否第一个cell
    var userNameBlk: userNameBlock?
    
    var iconUrl: String?{
        didSet{
            setupIcon()
        }
    }
    
    var iconData: NSData?{
        didSet{
           setupIcon()
        }
    }
    
    var titleText: String?{
        didSet{
            titleLab.text = titleText
        }
    }
    
    var TfText:String?{
        didSet{
            contentTF.text = TfText
        }
    }
    
    override func setup() {
        super.setup()
        setupUI()
    }
    
    func setupUI(){
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        titleLab.textAlignment = NSTextAlignment.Left
        titleLab.textColor = UIColor.init(hexString: "282828")
        titleLab.font = UIFont.systemFontOfSize(15)
        self.contentView.addSubview(titleLab)
        titleLab.snp_makeConstraints { (make) in
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(25)
            make.left.equalTo(self.contentView).offset(27.5)
        }
        
        let line = UIView()
        line.backgroundColor = UIColor.init(hexString: "bfbfbf")
        self.contentView.addSubview(line)
        line.snp_makeConstraints { (make) in
            make.left.equalTo(titleLab)
            make.right.equalTo(self.contentView).offset(-27.5)
            make.height.equalTo(0.5)
            make.bottom.equalTo(self.contentView)
        }
        
        self.contentView.addSubview(arrow)
        arrow.image = UIImage.init(named: "icon_arrow_right")
        arrow.snp_makeConstraints { (make) in
            make.height.equalTo(12)
            make.width.equalTo(6)
            make.right.equalTo(self.contentView).offset(-27.5)
            make.centerY.equalTo(self.contentView)
        }
        
        contentTF.clearButtonMode = UITextFieldViewMode.WhileEditing
        contentTF.clearsOnBeginEditing = true;
        contentTF.textColor = UIColor.init(hexString: "282828")
        contentTF.textAlignment = NSTextAlignment.Right
        contentTF.font = UIFont.systemFontOfSize(14)
        contentTF.delegate = self
        self.contentView.addSubview(contentTF)
        contentTF.snp_makeConstraints { (make) in
            make.right.equalTo(arrow).offset(-10)
            make.centerY.equalTo(self.contentView)
            make.height.equalTo(30)
            make.width.equalTo(150*AdaptationRatioW)
        }
        contentTF.enabled = false
        self.contentView.addSubview(iconImgView)
        iconImgView.layer.masksToBounds = true
        iconImgView.layer.cornerRadius = 28
    }
    
    func setupIcon(){
        if isFirstLine == true {
            
            contentTF.hidden = true
            iconImgView.snp_makeConstraints(closure: { (make) in
                make.height.equalTo(56)
                make.width.equalTo(56)
                make.right.equalTo(self.contentView).offset(-27.5)
                make.centerY.equalTo(self.contentView)
            })
            if iconUrl != nil{
                iconImgView.sd_setImageWithURL(NSURL.init(string: iconUrl!), placeholderImage: UIImage.init(named: "icon_avatar"))
            }else{
                iconImgView.image = UIImage(named: "icon_avatar")
            }
            if iconData != nil{
                iconImgView.image = UIImage(data: iconData!)
            }
        }
    }
    
    //MARK: textFiled代理
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.borderStyle = UITextBorderStyle.RoundedRect;
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        contentTF.borderStyle = UITextBorderStyle.None;
        self.userNameBlk!(textField.text!)
    }
}
