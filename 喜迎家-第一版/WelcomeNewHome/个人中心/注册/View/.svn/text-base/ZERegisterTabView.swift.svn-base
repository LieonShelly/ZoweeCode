//
//  ZERegisterTabView.swift
//  WelcomeNewHome
//
//  Created by wanglj on 16/7/11.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZERegisterTabView: THTableView,UITextFieldDelegate {
    
    var registerModel = ZERegister.init()
    
    
    private var passWordEn:NSString = ""
    
    override func setupAfter() {
        //self.scrollEnabled = false
        self.contentInset = UIEdgeInsetsMake(70*AdaptationRatioH, 0, 0, 0)
        self.backgroundColor = UIColor.whiteColor()
        self.separatorInset = UIEdgeInsetsMake(0, 30, 0, 30)
        self.registerClass(ZERegisterCell.self, forCellReuseIdentifier: ZERegisterCell.CellIdentifier())
        self.registerClass(ZERegisterBtnTableViewCell.self, forCellReuseIdentifier: ZERegisterBtnTableViewCell.CellIdentifier())
        self.viewModel.sectionModelArray .removeAllObjects()
        let sectionModel = YZSTableViewSectionModel.init()
        self.viewModel.sectionModelArray.addObject(sectionModel)
        
        let cellModel1 = YZSTableViewCellModel.init()
        sectionModel.cellModelArray.addObject(cellModel1)
        cellModel1.renderBlock = {(indexPath, tableView) -> UITableViewCell in
            var cell = tableView.dequeueReusableCellWithIdentifier(ZERegisterCell.CellIdentifier()) as? ZERegisterCell
            if cell == nil {
                cell = ZERegisterCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ZERegisterCell.CellIdentifier())
            }
            cell?.iconView.image = UIImage.init(named:"register_phone")
            cell?.plachText = "请输入手机号"
            cell?.textInput.keyboardType = UIKeyboardType.NumberPad
            cell?.textInput.delegate = self
            cell?.textInput.tag = 1000+indexPath.row
            cell?.registerModel = self.registerModel
            cell?.timeLabel.text = ""
            return cell!;
        }
        let cellModel2 = YZSTableViewCellModel.init()
        sectionModel.cellModelArray.addObject(cellModel2)
        cellModel2.renderBlock = {(indexPath, tableView) -> UITableViewCell in
            var cell = tableView.dequeueReusableCellWithIdentifier(ZERegisterCell.CellIdentifier()) as? ZERegisterCell
            if cell == nil {
                cell = ZERegisterCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ZERegisterCell.CellIdentifier())
            }
            cell?.iconView.image = UIImage.init(named:"register_password")
            cell?.plachText = "请输入密码"
            cell?.textInput.keyboardType = UIKeyboardType.ASCIICapable
            cell?.textInput.delegate = self
            cell?.textInput.secureTextEntry = true
            cell?.textInput.tag = 1000+indexPath.row
            cell?.registerModel = self.registerModel
            cell?.timeLabel.text = ""
            return cell!;
        }
        let cellModel3 = YZSTableViewCellModel.init()
        sectionModel.cellModelArray.addObject(cellModel3)
        cellModel3.renderBlock = {(indexPath, tableView) -> UITableViewCell in
            var cell = tableView.dequeueReusableCellWithIdentifier(ZERegisterCell.CellIdentifier()) as? ZERegisterCell
            if cell == nil {
                cell = ZERegisterCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ZERegisterCell.CellIdentifier())
            }
            cell?.iconView.image = UIImage.init(named:"register_password")
            cell?.plachText = "确认密码"
            cell?.textInput.keyboardType = UIKeyboardType.ASCIICapable
            cell?.textInput.delegate = self
            cell?.textInput.secureTextEntry = true
            cell?.textInput.tag = 1000+indexPath.row
            cell?.registerModel = self.registerModel
            cell?.timeLabel.text = ""
            return cell!;
        }
        let cellModel4 = YZSTableViewCellModel.init()
        sectionModel.cellModelArray.addObject(cellModel4)
        cellModel4.renderBlock = {(indexPath, tableView) -> UITableViewCell in
            var cell = tableView.dequeueReusableCellWithIdentifier(ZERegisterCell.CellIdentifier()) as? ZERegisterCell
            if cell == nil {
                cell = ZERegisterCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ZERegisterCell.CellIdentifier())
            }
            cell?.iconView.image = UIImage.init(named:"register_code")
            cell?.plachText = "请输入验证码"
            cell?.textInput.keyboardType = UIKeyboardType.NumberPad
            cell?.textInput.delegate = self
            cell?.textInput.tag = 1000+indexPath.row
            cell?.showBtn = true
            cell?.registerModel = self.registerModel
            return cell!;
        }
        let cellModel5 = YZSTableViewCellModel.init()
        cellModel5.height = 95;
        sectionModel.cellModelArray.addObject(cellModel5)
        cellModel5.renderBlock = {(indexPath, tableView) -> UITableViewCell in
            var cell = tableView.dequeueReusableCellWithIdentifier(ZERegisterBtnTableViewCell.CellIdentifier()) as? ZERegisterBtnTableViewCell
            if cell == nil {
                cell = ZERegisterBtnTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ZERegisterBtnTableViewCell.CellIdentifier())
            }
            cell?.registerModel = self.registerModel
            cell?.registerBtnEnable()
            return cell!;
        }
        
    }
    
    // MARK: UITextFieldDelegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 1000 {
            let length = (textField.text?.characters.count)! - range.length + string.characters.count
            if length > 11 {
                self.reloadRow(4, inSection: 0, withRowAnimation: UITableViewRowAnimation.None)
               // self.reloadRow(3, inSection: 0, withRowAnimation: UITableViewRowAnimation.None)
                return false
            }
            let cs = NSCharacterSet.init(charactersInString: NUMBERS).invertedSet
            let filtered = (string.componentsSeparatedByCharactersInSet(cs)as NSArray).componentsJoinedByString("")
            let basic = filtered == string
            if basic {
                let mobileStr = NSMutableString.init(string: textField.text!)
                mobileStr.replaceCharactersInRange(range, withString: string)
                registerModel.StrMobile = mobileStr as String
            }
            self.reloadRow(4, inSection: 0, withRowAnimation: UITableViewRowAnimation.None)
           // self.reloadRow(3, inSection: 0, withRowAnimation: UITableViewRowAnimation.None)
            return basic
        }else if textField.tag == 1001 {
            let PassStr = NSMutableString.init(string: textField.text!)
            PassStr.replaceCharactersInRange(range, withString: string)
            registerModel.PassWord = PassStr as String
        }else if textField.tag == 1002 {
            let PassStr = NSMutableString.init(string: textField.text!)
            PassStr.replaceCharactersInRange(range, withString: string)
            registerModel.PassWordEN = PassStr as String
        }
        else if textField.tag == 1003 {
            let length = (textField.text?.characters.count)! - range.length + string.characters.count
            if length > 6 {
                self.reloadRow(4, inSection: 0, withRowAnimation: UITableViewRowAnimation.None)
                return false
            }
            let cs = NSCharacterSet.init(charactersInString: NUMBERS).invertedSet
            let filtered = (string.componentsSeparatedByCharactersInSet(cs)as NSArray).componentsJoinedByString("")
            let basic = filtered == string
            if basic {
                let CodeStr = NSMutableString.init(string: textField.text!)
                CodeStr.replaceCharactersInRange(range, withString: string)
                registerModel.Code = CodeStr as String
            }
            self.reloadRow(4, inSection: 0, withRowAnimation: UITableViewRowAnimation.None)
            return basic
        }
        self.reloadRow(4, inSection: 0, withRowAnimation: UITableViewRowAnimation.None)
        return true
    }
}
