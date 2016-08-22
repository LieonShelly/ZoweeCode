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
    
    var pageControl: UIPageControl?
    
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
        let guideView = UIScrollView.init(frame: UIScreen.mainScreen().bounds)
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
            pageControl = UIPageControl.init()
            pageControl!.pageIndicatorTintColor = UIColor.darkGrayColor()
            pageControl!.currentPageIndicatorTintColor = UIColor.lightGrayColor()
            pageControl!.frame = CGRectMake(ScreenW / 2 - 50, ScreenH - 50, 100, 20)
            pageControl!.numberOfPages = imgNameArray.count
            self.view.addSubview(pageControl!)
            //KVC修改默认图片
            pageControl!.setValue(UIImage.init(named: "tab_icon_5"),forKeyPath:"pageImage")
            pageControl!.setValue(UIImage.init(named: "tab_icon_4"), forKeyPath: "currentPageImage")
            
            //创建ImageView
            let imgView = UIImageView.init(frame: CGRectMake(ScreenW * index, 0, ScreenW, ScreenH))
            
            imgView.image = UIImage.init(named: imgName)
            guideView.addSubview(imgView)
            //最后那张图
            if index == CGFloat(imgNameArray.count - 1){
                imgView.userInteractionEnabled = true
                let joinBtn = UIButton.init()
                joinBtn.frame = CGRectMake(0, 0, 100, 40)
                joinBtn.center = CGPointMake(CGRectGetWidth(imgView.frame)*0.5, CGRectGetHeight(imgView.frame) - 80)
                joinBtn.setTitle("立即体验", forState: UIControlState.Normal)
                joinBtn.titleLabel?.font = UIFont.systemFontOfSize(16)
                joinBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                joinBtn.layer.borderColor = UIColor.lightGrayColor().CGColor
                joinBtn.layer.cornerRadius = 10
                joinBtn.clipsToBounds = true
                joinBtn.layer.borderWidth = 1
                imgView.addSubview(joinBtn)
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
        let SB = UIStoryboard.init(name: "Main", bundle: nil)
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
        pageControl!.currentPage = page;
    }
}
