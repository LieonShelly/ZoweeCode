//
//  ZELoadingWebViewController.swift
//  WelcomeNewHome
//
//  Created by wanglj on 16/7/22.
//  Copyright © 2016年 TH. All rights reserved.
//

import UIKit
import WebKit

class ZELoadingWebViewController: UIViewController,WKScriptMessageHandler,WKNavigationDelegate {
    var homeModel:ZEHomeImage?
    
    var webView :WKWebView?
    var progressView: UIProgressView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startWkWebView()
        backBtnSet()
        webViewUISet()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    func startWkWebView() -> Void {
        // 创建配置
        let config = WKWebViewConfiguration()
        // 创建UserContentController（提供JavaScript向webView发送消息的方法）
        let userContent = WKUserContentController()
        // 添加消息处理，注意：self指代的对象需要遵守WKScriptMessageHandler协议，结束时需要移除
        userContent.addScriptMessageHandler(self, name: "NativeMethod")
        // 将UserConttentController设置到配置文件
        config.userContentController = userContent
        // 高端的自定义配置创建WKWebView
        let webView = WKWebView(frame: UIScreen.mainScreen().bounds, configuration: config)
        
        webView.navigationDelegate = self
        // 设置访问的URL
        let url = NSURL(string: (homeModel?.Url)!)
        // 根据URL创建请求
        let requst = NSURLRequest(URL: url!)
        // WKWebView加载请求
        webView.loadRequest(requst)
        // 将WKWebView添加到视图
        view.addSubview(webView)
        self.webView = webView
    }
    
    func webViewUISet() {
        progressView = UIProgressView.init(frame: CGRectMake(0, 64, ScreenW, 0))
        //progressView?.progressViewStyle = UIProgressViewStyle.Bar
        progressView?.tintColor = UIColor.blueColor()
        progressView?.trackTintColor = UIColor.whiteColor()
        self.view.addSubview(progressView!)
        webView?.addObserverBlockForKeyPath("estimatedProgress", block: { (object, old, new) in
            let newprogress = new as! Float
            if newprogress == 1 {
                self.progressView?.hidden = true
                self.progressView?.setProgress(0, animated: false)
            } else {
                self.progressView?.hidden = false
                self.progressView?.setProgress(newprogress, animated: true)
            }
        })
        webView?.addObserverBlockForKeyPath("title", block: { (object, old, new) in
            self.title = new as? String
        })

    }
    func backBtnSet() {
        var items = [UIBarButtonItem]()
        let backBtn = UIButton.init(frame: CGRectMake(0, 0, 25, 25))
        backBtn .setImage(UIImage.init(named: "icon_back_蓝"), forState: UIControlState.Normal)
        backBtn.addTarget(self, action: #selector(backBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        let backItem = UIBarButtonItem.init(customView: backBtn)
        
        let closeBtn = UIButton.init(frame: CGRectMake(0, 0, 30, 25))
        closeBtn.setTitle("关闭", forState: UIControlState.Normal)
        closeBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        closeBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        closeBtn.addTarget(self, action: #selector(closeBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        let closeItem = UIBarButtonItem.init(customView: closeBtn)
        
        if self.webView == nil || !(self.webView?.canGoBack)! {
            items.append(backItem)
        }else{
            items.append(backItem)
            items.append(closeItem)
        }
        self.navigationItem.setLeftBarButtonItems(items, animated: false)
    }
    
    func backBtnClick() {
        if self.webView != nil && (self.webView?.canGoBack)! {
            self.webView?.goBack()
        }else{
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    func closeBtnClick() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        
    }
    
    //MARK: 代理
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
       // print("准备加载界面")
    }
    func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!) {
       // print("内容开始加载")
        backBtnSet()
    }
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
       // print("页面加载完成")
    }
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        //print("页面加载失败")
    }
    func webView(webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
      //  print("接收到服务器跳转请求的代理")
    }
    func webView(webView: WKWebView, decidePolicyForNavigationResponse navigationResponse: WKNavigationResponse, decisionHandler: (WKNavigationResponsePolicy) -> Void) {
        //print("在收到响应后，决定是否跳转的代理")
        decisionHandler(WKNavigationResponsePolicy.Allow)
    }
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
       // print("在发送请求之前，决定是否跳转的代理")
        decisionHandler(WKNavigationActionPolicy.Allow)
    }
    deinit {
        webView?.configuration.userContentController.removeScriptMessageHandlerForName("NativeMethod")
        webView?.removeObserverBlocks()
    }
    
    

}
