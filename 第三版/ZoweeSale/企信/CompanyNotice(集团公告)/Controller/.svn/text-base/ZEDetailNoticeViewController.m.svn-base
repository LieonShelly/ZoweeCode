//
//  ZEDetailNoticeViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/18.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEDetailNoticeViewController.h"
#import "MBProgressHUD+NJ.h"

@interface ZEDetailNoticeViewController () <UIWebViewDelegate>
@property (nonatomic,weak) UIWebView * webView;
@end

@implementation ZEDetailNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}


-(UIWebView *)webView
{
    if (_webView == nil) {
        
    UIWebView * webView = [[UIWebView alloc]init];
    webView.delegate = self;
    webView.backgroundColor = ZECustomerGlobalBackgroudColor;
    [self.view addSubview:webView];
    self.webView = webView;
    
    webView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
    }
    return _webView;
}

#pragma mark - 私有方法

- (void)initUI
{
    
    self.view.backgroundColor =ZECustomerGlobalBackgroudColor;
    NSURL * url = [NSURL URLWithString:self.noticeList.NoticeUrl];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    //self.webView.scalesPageToFit = NO;
    self.webView.scalesPageToFit=YES;
    
    self.webView.multipleTouchEnabled=YES;
    
    self.webView.userInteractionEnabled=YES;
    self.title = self.titleStr;
}

#pragma  mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return  YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    lieonLog(@"webViewDidFinishLoad");
    [MBProgressHUD showMessage:@"拼命加载中..." toView:self.navigationController.view];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    lieonLog(@"webViewDidFinishLoad");
    [MBProgressHUD hideHUDForView:self.navigationController.view];
//    NSString *lJs = @"document.documentElement.innerHTML";
//    NSString *lJs2 = @"document.title";
//    NSString *lHtml1 = [webView stringByEvaluatingJavaScriptFromString:lJs];
//    NSString *lHtml2 = [webView stringByEvaluatingJavaScriptFromString:lJs2];

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [MBProgressHUD hideHUDForView:self.navigationController.view];
    [MBProgressHUD showError:@"加载失败" toView:self.navigationController.view];
}

@end
