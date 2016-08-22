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
   
    let numberLab = UILabel()
    var isLastLine: Bool? //是否最后一个cell
    
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
        self.selectionStyle = UITableViewCellSelectionStyle.None
        line.backgroundColor = UIColor.init(hexString:"bfbfbf")
        lineHeight.constant = 0.5;
        
        self.contentView.addSubview(numberLab)
        numberLab.text = "40088889999"
        numberLab.font = UIFont.systemFontOfSize(14)
    }
    
    override func layoutSubviews() {
        if isLastLine == true {
            iconRight.hidden = true
            numberLab.snp_makeConstraints(closure: { (make) in
                make.right.equalTo(self.contentView).offset(-27)
                make.bottom.equalTo(self.contentView).offset(8)
                make.top.equalTo(self.contentView)
                
            })
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
