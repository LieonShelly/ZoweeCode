//
//  ZEMessageTbView.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/13.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEMessageTbView: THTableView {
    
    var modelArray: Array<ZEMessageModel>!{
        didSet{
            setupUI()
            reloadData()
        }
    }
    
    override func setupAfter() {
        self.backgroundColor = UIColor.whiteColor()
        self.separatorStyle = UITableViewCellSeparatorStyle.None
        self.registerNib(UINib.init(nibName: "ZEMessageCell", bundle: nil), forCellReuseIdentifier: ZEMessageCell.CellIdentifier())
    }
    
    func setupUI(){
        
        self.viewModel.sectionModelArray.removeAllObjects()
        let sectionModel = YZSTableViewSectionModel.init()
        self.viewModel.sectionModelArray.addObject(sectionModel)
        
        for model in modelArray {
            let cellModel1 = YZSTableViewCellModel.init()
            cellModel1.height = 95
            sectionModel.cellModelArray.addObject(cellModel1)
            cellModel1.renderBlock = {(indexPath, tableView) -> UITableViewCell in
                let cell1 = tableView.dequeueReusableCellWithIdentifier(ZEMessageCell.CellIdentifier(), forIndexPath: indexPath) as? ZEMessageCell
                cell1?.msgContentLab.text = model.Content
                cell1?.msgTypeLab.text = "系统消息"
                if model.Num != "" {
                    cell1?.msgCountLab.text = "\(model.Num!)"
                }
                
                switch model.Type as! Int {
                case 1:
                    cell1?.msgTypeLab.text = "系统消息"
                    cell1?.iconImgView.image = UIImage(named: "icon_system-msg")
                case 2:
                    cell1?.msgTypeLab.text = "福利消息"
                    cell1?.iconImgView.image = UIImage(named: "icon_weal-msg")
                case 3:
                    cell1?.msgTypeLab.text = "订单消息"
                    cell1?.iconImgView.image = UIImage(named: "icon_order-msg")
                default:
                    break
                }
                let dateArray = model.MessageTime?.componentsSeparatedByString(" ")
                cell1?.dateLab.text = dateArray![0]
                return cell1!
            }
        }
    }
}
