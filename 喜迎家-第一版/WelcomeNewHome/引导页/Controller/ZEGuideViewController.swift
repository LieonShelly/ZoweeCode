//
//  ZEGuideViewController.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/7.
//  Copyright © 2016年 TH. All rights reserved.
//
//屏幕尺寸

import UIKit

let imgNameArray = ["1","2","3","4"];//启动页图片数组

class ZEGuideViewController: UIViewController,UIScrollViewDelegate {
    let guideView = UIScrollView()
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//MARK: - 初始化方法
    //初始化引导页imgView
    func setupUI(){
        guideView.frame = UIScreen.mainScreen().bounds
        self.view.addSubview(guideView)
        guideView.contentSize = CGSizeMake(ScreenW * 4, ScreenH)
        guideView.pagingEnabled = true
        guideView.bounces = false
        guideView.showsVerticalScrollIndicator = false
        guideView.showsHorizontalScrollIndicator = false
        guideView.delegate = self
        
        var index: CGFloat = 0
        for imgName in imgNameArray{
            //创建pageControl

            pageControl.frame = CGRectMake(0, 0, 0, 4)
            pageControl.center = CGPointMake(ScreenW / 2, ScreenH - 50)
            pageControl.numberOfPages = imgNameArray.count
            self.view.addSubview(pageControl)
            //KVC修改默认图片
            pageControl.setValue(UIImage.init(named: "sw_gray"),forKeyPath:"pageImage")
            pageControl.setValue(UIImage.init(named: "sw_white"), forKeyPath: "currentPageImage")
            
            //创建ImageView
            let imgView = UIImageView.init(frame: CGRectMake(ScreenW * index, 0, ScreenW, ScreenH))
            
            imgView.image = UIImage.init(named: imgName)
            guideView.addSubview(imgView)
            //最后那张图
            if index == CGFloat(imgNameArray.count - 1){
                //pageControl.hidden = true
                
                imgView.userInteractionEnabled = true
                let joinBtn = UIButton.init()
                joinBtn.frame = CGRectMake(ScreenW / 2 - 76.5, ScreenH - 86, 153, 38)
                joinBtn.setTitle("立即体验", forState: UIControlState.Normal)
                joinBtn.titleLabel?.font = UIFont.systemFontOfSize(16)
                joinBtn.setTitleColor(UIColor.init(hexString: "ffffff"), forState: UIControlState.Normal)
                joinBtn.layer.borderColor = UIColor.whiteColor().CGColor
                joinBtn.layer.cornerRadius = 18
                joinBtn.clipsToBounds = true
                joinBtn.layer.borderWidth = 2
                imgView.addSubview(joinBtn)
                self.view.bringSubviewToFront(joinBtn)
                joinBtn.addTarget(self, action: #selector(ZEGuideViewController.goToHomePage(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            }
            index += 1
        }
    }
    
    //进入主程序界面
    func goToHomePage(sender: UIButton){
        sender.hidden = true
        let snapView = self.view.snapshotViewAfterScreenUpdates(true)
        //获取SB中的视图控制器
        let SB = UIStoryboard.init(name: "Home", bundle: nil)
        let homePage = SB.instantiateViewControllerWithIdentifier("NAV")
        homePage.view.addSubview(snapView)
        self.view.window?.rootViewController = homePage
        
        UIView.animateWithDuration(0.5, animations: {
            snapView.transform = CGAffineTransformMakeScale(2.0, 2.0)
        }) { (Bool) in
            snapView.removeFromSuperview()
        }
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset;
        
        let x = offset.x;
        let page = Int(x / ScreenW);
        pageControl.currentPage = page;
        
        if page == 3 {
            pageControl.hidden = true
        }else{
            pageControl.hidden = false
        }
    }
    
}
