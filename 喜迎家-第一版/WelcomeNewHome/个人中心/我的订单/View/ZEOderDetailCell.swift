//
//  ZEOderDetailCell.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/26.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEOderDetailCell: baseTableViewCell {

    @IBOutlet weak var projectLab: UILabel!
    @IBOutlet weak var priceLab: UILabel!
    @IBOutlet weak var countLab: UILabel!
    @IBOutlet weak var totalAmountLab: UILabel!
    @IBOutlet weak var projectWidth: NSLayoutConstraint!
    @IBOutlet weak var priceWidth: NSLayoutConstraint!
    @IBOutlet weak var countWidth: NSLayoutConstraint!
    @IBOutlet weak var lineHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let deviceCode:String = THloginMessage.init().DeviceCode
        if deviceCode.hasPrefix("iPhone 5") == true{
            projectLab.font = UIFont.systemFontOfSize(12)
            priceLab.font = UIFont.systemFontOfSize(12)
            countLab.font = UIFont.systemFontOfSize(12)
            totalAmountLab.font = UIFont.systemFontOfSize(12)
            projectWidth.constant = 95 * AdaptationRatioW
        }else{
            projectWidth.constant = 116 * AdaptationRatioW
        }
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        priceWidth.constant = 73 * AdaptationRatioW
        countWidth.constant = 40 * AdaptationRatioW
        lineHeight.constant = 0.5
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
