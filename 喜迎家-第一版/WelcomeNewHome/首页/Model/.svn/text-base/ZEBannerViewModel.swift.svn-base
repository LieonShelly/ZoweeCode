//
//  ZEBannerViewModel.swift
//  WelcomeNewHome
//
//  Created by apple on 16/7/19.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit

class ZEBannerViewModel: NSObject {
    var dataArray = [String]()
}

extension ZEBannerViewModel: ZYBannerViewDelegate
{
    func banner(banner: ZYBannerView!, didSelectItemAtIndex index: Int) {
        print("点击了第%d个项目",index)
    }
    
    func bannerFooterDidTrigger(banner: ZYBannerView!) {
        print("没有开的")
    }
}

extension ZEBannerViewModel: ZYBannerViewDataSource
{
    func numberOfItemsInBanner(banner: ZYBannerView!) -> Int {
        return dataArray.count
    }
    
    func banner(banner: ZYBannerView!, titleForFooterWithState footerState: ZYBannerFooterState) -> String! {
        return "sdfsdf"
    }
    
    func banner(banner: ZYBannerView!, viewForItemAtIndex index: Int) -> UIView! {
        let urlstr = dataArray[index]
        let imageView : UIImageView = UIImageView()
        imageView.sd_setImageWithURL(NSURL(string: urlstr),placeholderImage:UIImage(named: "design"))
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        return imageView
        
    }
}