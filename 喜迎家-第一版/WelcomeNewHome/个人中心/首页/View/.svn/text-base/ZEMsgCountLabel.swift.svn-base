//
//  ZEMsgCountLabel.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/14.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEMsgCountLabel: UILabel {

    var labX: CGFloat!
    var labY: CGFloat!
    var labWidth: CGFloat!
    var labHeight: CGFloat!
    
    
    override var text: String?{
        didSet{
            resetUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //CGRectMake(x, y, labWidth, labHeight)
        self.backgroundColor = UIColor.init(hexString: "fc4d59")
        self.textAlignment = NSTextAlignment.Center
        self.textColor = UIColor.whiteColor()
        self.font = UIFont.systemFontOfSize(12)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func resetUI(){
        
        if  self.labelWidth() + 6 > 13 {
            labWidth = self.labelWidth() + 6
        }else{
            labWidth = self.frame.size.width
        }
        labX = self.frame.origin.x
        labY = self.frame.origin.y
        labHeight = self.frame.size.height
        self.frame = CGRectMake(labX, labY, labWidth, labHeight)
    }
}
