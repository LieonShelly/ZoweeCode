//
//  ZEWebViewController.m
//  ZoweeSale
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 TH. All rights reserved.
//

#import "ZEWebViewController.h"

@interface ZEWebViewController ()<UIWebViewDelegate>
@property (nonatomic,weak) UIWebView * webView;

@end

@implementation ZEWebViewController

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
    NSURL * url = [NSURL URLWithString:@"http://www.kzowee.com/"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma  mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return  YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    lieonLog(@"webViewDidFinishLoad");
    [MBProgressHUD showMessage:@"拼命加载中..." toView:self.view];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    lieonLog(@"webViewDidFinishLoad");
    [MBProgressHUD hideHUDForView:self.view];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    [MBProgressHUD showError:@"加载失败" toView:self.view];
}

@end
