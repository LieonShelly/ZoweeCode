//
//  ZEMessageCell.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEMessageCell: baseTableViewCell {
    @IBOutlet weak var iconImgView: UIImageView!
    @IBOutlet weak var msgTypeLab: UILabel!
    @IBOutlet weak var msgContentLab: UILabel!
    @IBOutlet weak var dateLab: UILabel!
    @IBOutlet weak var lineHeight: NSLayoutConstraint!
    
    lazy var msgCountLab: ZEMsgCountLabel = {
        let msgCountLab = ZEMsgCountLabel.init(frame: CGRectMake(ScreenW - 13 - 20, self.contentView.frame.size.height - 13 - 23, 13, 13))
        return msgCountLab
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.None
        lineHeight.constant = 0.5
        
        self.contentView.addSubview(msgCountLab)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setup() {
        super.setup()
        
        
        
    }
}
