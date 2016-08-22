//
//  ZEChooseSexView.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEChooseSexView: UIView {

    
    let maleBtn = UIButton()
    let femaleBtn = UIButton()
    let cancelBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var bgView: UIView = {
        let bgView = UIView(frame: CGRectMake(0, 0, self.frame.width, 114))
        return bgView
    }()
    
    func setupUI(){
        
        self.addSubview(bgView)
        bgView.backgroundColor = UIColor.init(hexString: "ffffff")
        bgView.layer.cornerRadius = 12.5
        bgView.layer.masksToBounds = true
        
        bgView.addSubview(maleBtn)
        maleBtn.backgroundColor = UIColor.clearColor()
        
        maleBtn.setTitleColor(UIColor.init(hexString: "238ac4"), forState: UIControlState.Normal)
        maleBtn.snp_makeConstraints { (make) in
            make.top.equalTo(bgView)
            make.width.equalTo(bgView)
            make.height.equalTo(57)
        }
        
        let line = UIView()
        line.backgroundColor = UIColor.init(hexString: "bfbfbf")
        bgView.addSubview(line)
        line.snp_makeConstraints { (make) in
            make.top.equalTo(maleBtn.snp_bottom)
            make.width.equalTo(bgView)
            make.height.equalTo(0.5)
        }
        
        bgView.addSubview(femaleBtn)
        femaleBtn.backgroundColor = UIColor.clearColor()
        
        femaleBtn.setTitleColor(UIColor.init(hexString: "282828"), forState: UIControlState.Normal)
        femaleBtn.snp_makeConstraints { (make) in
            make.top.equalTo(line.snp_bottom)
            make.width.equalTo(bgView)
            make.height.equalTo(57)
        }
        
        cancelBtn.layer.cornerRadius = 12.5
        self.addSubview(cancelBtn)
        cancelBtn.backgroundColor = UIColor.whiteColor()
        cancelBtn.setTitle("取消", forState: UIControlState.Normal)
        cancelBtn.setTitleColor(UIColor.init(hexString: "238ac4"), forState: UIControlState.Normal)
        cancelBtn.snp_makeConstraints { (make) in
            make.top.equalTo(bgView.snp_bottom).offset(8)
            make.width.equalTo(bgView)
            make.left.equalTo(bgView)
            make.height.equalTo(57)
        }
    }
}
