//
//  ZEFullSenceCollectionViewCell.swift
//  WelcomeNewHome
//
//  Created by lieon on 16/7/19.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEFullSenceCollectionViewCell: UICollectionViewCell {
    
    var model:ZEHomeImage?
        {
        didSet{
            imageView.sd_setImageWithURL(NSURL(string: model!.ImagePath!))
            label.text = model!.ImageRemark
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(hexString: "f9f9f9")
        contentView.addSubview(containerView)
        containerView.snp_makeConstraints { (make) in
            make.center.equalTo(contentView.snp_center)
            make.width.equalTo(100)
            make.height.equalTo(contentView.snp_height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var  imageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = UIViewContentMode.ScaleAspectFit
        return iv
    }()
   private lazy var label:UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "282828")
        label.font = UIFont.systemFontOfSize(15)
        label.textAlignment = NSTextAlignment.Center
        return label
    }()
    
    private lazy var containerView:UIView = {
        let containerView = UIView()
        containerView.addSubview(self.imageView)
        containerView.addSubview(self.label)
        
        
       self.imageView.snp_makeConstraints { (make) in
            make.centerY.equalTo(containerView.snp_centerY)
            make.left.equalTo(containerView.snp_left)
            make.width.equalTo(44)
            make.height.equalTo(44)
        
        }
        self.label.snp_makeConstraints { (make) in
            make.left.equalTo(self.imageView.snp_right).inset(-7)
            make.centerY.equalTo(containerView.snp_centerY)
        }
        return containerView
    }()

    
   
}
