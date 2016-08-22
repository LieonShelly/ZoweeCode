//
//  ZEProfileCell.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/8.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEProfileCell: UITableViewCell {

    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var iconRight: UIImageView!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var lineHeight: NSLayoutConstraint!
    
    var model: ZENormalCellModel!{
        didSet{
            UIInit()
        }
    }
    func UIInit(){
        iconImgView.image = UIImage(named: model.imgName)
        titleLab.text = model.titleStr
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        line.backgroundColor = UIColor.hx_colorWithHexRGBAString("bfbfbf")
        lineHeight.constant = 0.5;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
