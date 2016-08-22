//
//  ZEFuncBtnCollectionViewCell.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/19.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import SDWebImage

class ZEFuncBtnCollectionViewCell: UICollectionViewCell{
    
    var model:ZEHomeImage?
    {
        didSet{
            imageView.sd_setImageWithURL(NSURL(string: model!.ImagePath!))
            label.text = model!.ImageRemark
        }
    }
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        backgroundColor = UIColor(hexString: "f9f9f9")
        imageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(contentView.snp_centerX)
            make.top.equalTo(contentView.snp_top).inset(16)
            make.width.equalTo(32)
            make.height.equalTo(32)
        }
        label.snp_makeConstraints { (make) in
            make.top.equalTo(imageView.snp_bottom).inset(-8)
            make.centerX.equalTo(imageView.snp_centerX)
            make.bottom.equalTo(contentView.snp_bottom).offset(-8)
        }
    }
    
    
    
    //  MARK:懒加载
    
    private  lazy var  imageView:UIImageView = UIImageView()
    private lazy var label:UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "282828")
        label.font = UIFont.systemFontOfSize(13)
        label.textAlignment = NSTextAlignment.Center
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
