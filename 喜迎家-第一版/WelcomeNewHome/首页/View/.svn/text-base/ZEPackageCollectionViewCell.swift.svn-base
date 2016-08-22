//
//  ZEPackageCollectionViewCell.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/19.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEPackageCollectionViewCell:UICollectionViewCell {
  
    var model:ZEHomeImage?
        {
        didSet{
            imageView.sd_setImageWithURL(NSURL(string: model!.ImagePath!))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(hexString: "f9f9f9")
        contentView.addSubview(imageView)
        imageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(contentView.snp_centerX)
            make.centerY.equalTo(contentView.snp_centerY).inset(0)
            make.left.equalTo(contentView.snp_left).offset(20)
            make.right.equalTo(contentView.snp_right).offset(-20)
            make.top.equalTo(contentView.snp_top).offset(25)
            make.bottom.equalTo(contentView.snp_bottom).offset(-25)
        }
    }
    
      private  lazy var  imageView:UIImageView = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
