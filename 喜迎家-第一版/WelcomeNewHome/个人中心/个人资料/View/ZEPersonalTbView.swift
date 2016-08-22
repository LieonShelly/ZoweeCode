//
//  ZEPersonalTbView.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEPersonalInfoTbView: THTableView,STPickerDateDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    let alphaView = UIView()
    var userName = String()
    var mobile: String?
    var imgURL:String?
    var sexText = String()
    var birthdayStr: String?
    
    var commitBirthStr = String()
    var headerImgData: NSData?
    
    private lazy var rightBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("完成", forState: UIControlState.Normal)
        btn.addTarget(self, action: #selector(ZEPersonalInfoTbView.commitChange), forControlEvents: UIControlEvents.TouchUpInside)
        btn.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.sizeToFit()
        return btn
    }()
    
    private lazy var sexView: ZEChooseSexView = {
        let sexView = ZEChooseSexView.init(frame: CGRectMake(10, ScreenH, ScreenW - 20, 179))
        return sexView
    }()
    
    private lazy var pickPhotoView: ZEChooseSexView = {
        let pickPhotoView = ZEChooseSexView.init(frame: CGRectMake(10, ScreenH, ScreenW - 20, 179))
        return pickPhotoView
    }()
    
    var model: ZEPersonalInfoModel!{
        didSet{
            if model.UserName == "" {
                userName = "请设置昵称"
            }else{
                userName = model.UserName!
            }
            
            if model.Sex == 0{
                sexText = "女"
            }else if model.Sex == 1{
                sexText = "男"
            }else{
                sexText = "请设置性别"
            }
            
            if model.BirthDay == "" {
                self.birthdayStr = "请设置生日"
            }else{
                let array = model.BirthDay!.componentsSeparatedByString("-")
                self.birthdayStr = "\(array[0])年\(array[1])月\(array[2])日"
            }
            
            imgURL = model.Url
            mobile = model.Mobile
            self.reloadData()
        }
    }
    
    override func setupAfter() {
        super.setupAfter()
        
        THURLNavigation.currentViewController()!.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        self.separatorStyle = UITableViewCellSeparatorStyle.None
        self.registerClass(ZEMyInfoCell.self, forCellReuseIdentifier: ZEMyInfoCell.CellIdentifier())
        
        self.viewModel.sectionModelArray.removeAllObjects()
        let sectionModel = YZSTableViewSectionModel.init()
        self.viewModel.sectionModelArray.addObject(sectionModel)
        
        let cellModel1 = YZSTableViewCellModel.init()
        cellModel1.height = 80
        sectionModel.cellModelArray.addObject(cellModel1)
        cellModel1.renderBlock = {(indexPath, tableView) -> UITableViewCell in
            var cell1 = tableView.dequeueReusableCellWithIdentifier(ZEMyInfoCell.CellIdentifier()) as? ZEMyInfoCell
            if cell1 == nil {
                cell1 = ZEMyInfoCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ZEMyInfoCell.CellIdentifier())
            }
            cell1?.titleText = "头像"
            cell1?.isFirstLine = true
            cell1?.iconUrl = self.imgURL
            cell1?.iconData = self.headerImgData
            return cell1!
        }
        
        cellModel1.selectionBlock = { (indexPath,tableView) in
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            self.pickPhoto()
        }
        
        let cellModel2 = YZSTableViewCellModel.init()
        cellModel2.height = 45
        sectionModel.cellModelArray.addObject(cellModel2)
        cellModel2.renderBlock = {(indexPath, tableView) -> UITableViewCell in
            var cell2 = tableView.dequeueReusableCellWithIdentifier(ZEMyInfoCell.CellIdentifier()) as? ZEMyInfoCell
            if cell2 == nil {
                cell2 = ZEMyInfoCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ZEMyInfoCell.CellIdentifier())
            }
            cell2?.titleText = "昵称"
            cell2?.TfText = self.userName
            cell2?.contentTF.enabled = true
            cell2?.userNameBlk = { str in
                self.userName = str
            }
            return cell2!
        }
        
        let cellModel3 = YZSTableViewCellModel.init()
        cellModel3.height = 45
        sectionModel.cellModelArray.addObject(cellModel3)
        cellModel3.renderBlock = {(indexPath, tableView) -> UITableViewCell in
            var cell3 = tableView.dequeueReusableCellWithIdentifier(ZEMyInfoCell.CellIdentifier()) as? ZEMyInfoCell
            if cell3 == nil {
                cell3 = ZEMyInfoCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ZEMyInfoCell.CellIdentifier())
            }
            cell3?.titleText = "性别"
            cell3?.TfText = self.sexText
            return cell3!
        }
        
        cellModel3.selectionBlock = { (indexPath, tableView) in
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            self.chooseSex()
        }
        
        let cellModel4 = YZSTableViewCellModel.init()
        cellModel4.height = 45
        sectionModel.cellModelArray.addObject(cellModel4)
        cellModel4.renderBlock = {(indexPath, tableView) -> UITableViewCell in
            var cell4 = tableView.dequeueReusableCellWithIdentifier(ZEMyInfoCell.CellIdentifier()) as? ZEMyInfoCell
            if cell4 == nil {
                cell4 = ZEMyInfoCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ZEMyInfoCell.CellIdentifier())
            }
            cell4?.titleText = "生日"
            cell4?.TfText = self.birthdayStr
            return cell4!
        }
        
        cellModel4.selectionBlock = {(indexPath, tableView) in
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            let datePicker = STPickerDate.init()
            UIApplication.sharedApplication().keyWindow?.endEditing(true)
            datePicker.delegate = self
            datePicker.show()
        }
        
        let cellModel5 = YZSTableViewCellModel.init()
        cellModel5.height = 45
        sectionModel.cellModelArray.addObject(cellModel5)
        cellModel5.renderBlock = {(indexPath, tableView) -> UITableViewCell in
            var cell5 = tableView.dequeueReusableCellWithIdentifier(ZEMyInfoCell.CellIdentifier()) as? ZEMyInfoCell
            if cell5 == nil {
                cell5 = ZEMyInfoCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: ZEMyInfoCell.CellIdentifier())
            }
            cell5?.titleText = "手机号"
            cell5?.TfText = self.mobile
            return cell5!
        }
    }
    
    //MARK: 更改性别
    func chooseSex(){
        
        alphaView.frame = CGRectMake(0, 0, ScreenW, ScreenH)
        alphaView.backgroundColor = UIColor.init(white: 0.2, alpha: 0.5)
        UIApplication.sharedApplication().keyWindow?.addSubview(alphaView)
        
        //let sexView = ZEChooseSexView.init(frame: CGRectMake(10, ScreenH - 189, ScreenW - 20, 179))
        
        alphaView.addSubview(sexView)
        
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { 
            self.sexView.frame =  CGRectMake(10, ScreenH - 189, ScreenW - 20, 179)
            }, completion: nil)
        
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(ZEPersonalInfoTbView.tapGesOnWindow))
        
        alphaView.addGestureRecognizer(tapGes)
        
        sexView.maleBtn.addTarget(self, action: #selector(ZEPersonalInfoTbView.sexBtnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        sexView.maleBtn.setTitle("男", forState: UIControlState.Normal)
        sexView.maleBtn.tag = 100
        sexView.femaleBtn.addTarget(self, action: #selector(ZEPersonalInfoTbView.sexBtnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        sexView.femaleBtn.setTitle("女", forState: UIControlState.Normal)
        sexView.femaleBtn.tag = 200
        sexView.cancelBtn.addTarget(self, action: #selector(ZEPersonalInfoTbView.sexBtnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func sexBtnClick(sender: UIButton){
        if sender.tag == 100 {
            self.removePopView(sexView)
            sexText = (sender.titleLabel?.text)!
            self.reloadData()
        }else if sender.tag == 200{
            self.removePopView(sexView)
            sexText = (sender.titleLabel?.text)!
            self.reloadData()
        }else{
            self.removePopView(sexView)
        }
    }
    
    func tapGesOnWindow(){
        self.removePopView(sexView)
    }
    
    func tapGesOnWindow2(){
        self.removePopView(pickPhotoView)
    }
    
    //MARK: 设置生日
    
    func pickerDate(pickerDate: STPickerDate, year: Int, month: Int, day: Int) {
        
        self.birthdayStr = "\(year)年\(month)月\(day)日"
        self.reloadData()
        self.commitBirthStr = "\(year)-\(month)-\(day)"
    }
    
    //MARK: 修改头像
    func pickPhoto(){
        
        alphaView.frame = CGRectMake(0, 0, ScreenW, ScreenH)
        alphaView.backgroundColor = UIColor.init(white: 0.2, alpha: 0.5)
        UIApplication.sharedApplication().keyWindow?.addSubview(alphaView)
        
        alphaView.addSubview(pickPhotoView)
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.pickPhotoView.frame =  CGRectMake(10, ScreenH - 189, ScreenW - 20, 179)
            }, completion: nil)
        
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(ZEPersonalInfoTbView.tapGesOnWindow2))
        alphaView.addGestureRecognizer(tapGes)
        
        pickPhotoView.maleBtn.addTarget(self, action: #selector(ZEPersonalInfoTbView.choosePhoto(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        pickPhotoView.maleBtn.setTitle("拍照", forState: UIControlState.Normal)
        pickPhotoView.maleBtn.tag = 100
        pickPhotoView.femaleBtn.addTarget(self, action: #selector(ZEPersonalInfoTbView.choosePhoto(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        pickPhotoView.femaleBtn.setTitle("从手机相册选择", forState: UIControlState.Normal)
        pickPhotoView.femaleBtn.tag = 200
        pickPhotoView.cancelBtn.addTarget(self, action: #selector(ZEPersonalInfoTbView.choosePhoto(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func choosePhoto(sender: UIButton){
        if sender.tag == 100 {
            self.removePopView(pickPhotoView)
            self.openCamera()
        }else if sender.tag == 200{
            self.removePopView(pickPhotoView)
            self.openAlbum()
        }else{
            self.removePopView(pickPhotoView)
        }
    }
    
    func removePopView(popView: UIView){
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            popView.frame =  CGRectMake(10, ScreenH, ScreenW - 20, 179)
        }) { (Bool) in
            self.alphaView.removeFromSuperview()
        }
    }
    
    func openCamera(){
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            return
        }else{
            let imgPic = UIImagePickerController.init()
            imgPic.sourceType = UIImagePickerControllerSourceType.Camera
            imgPic.delegate = self
            THURLNavigation.currentViewController()?.presentViewController(imgPic, animated: true, completion: nil)
        }
    }
    
    func openAlbum(){
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            return
        }else{
            let imgPic = UIImagePickerController.init()
            imgPic.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imgPic.delegate = self
            THURLNavigation.currentViewController()?.presentViewController(imgPic, animated: true, completion: nil)
        }
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        headerImgData = UIImageJPEGRepresentation(image, 0.3)!
        
        self.reloadRowAtIndexPath(NSIndexPath.init(forRow: 0, inSection: 0), withRowAnimation: UITableViewRowAnimation.None)
    }
    
    //MARK: 保存更改
    func commitChange(){
        if headerImgData != nil{
            let file = upLoadFile()
            file.name = "header"
            file.fileName = "header.png"
            file.type = "png"
            file.fileData = self.headerImgData
            THNetWorking.sharedInstance.createUploadTaskWith("SaveHeaderUrl", requestPar: [:], loadFile: file, success: { (response) in
                
                ZEHUD.showSuccessWithStatus("提交完成")
            }) { (error) in
                print(error)
                ZEHUD.showErrorWithStatus("提交失败")
            }
        }
        
        var sex = "1"
        if sexText == "女" {
            sex = "0"
        }
        THNetWorking.sharedInstance.THNetWorkingPost("UpdatePersonalData", paramerers: ["UserName":self.userName,"Sex":sex,"BirthDay":commitBirthStr], success: { (JSON) in
            ZEHUD.showSuccessWithStatus("提交完成")
            THURLNavigation.currentNavigationViewController()?.popViewControllerAnimated(true)
            }) { (error) in
                print(error)
        }
    }
        
}
