//
//  YCLDetailViewController.m
//  YCLProject
//
//  Created by 杨承龙 on 16/7/17.
//  Copyright © 2016年 Albert. All rights reserved.
//

#import "YCLDetailViewController.h"

@interface YCLDetailViewController ()<UIWebViewDelegate>

@end

@implementation YCLDetailViewController
#pragma mark - UIWebView Delegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.view showBusyHUD];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.view hideBusyHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self.view showWarning:error.description];
}

#pragma mark - LifeCycle 生命周期
- (instancetype)initWithURL:(NSURL *)detailURL {
    if (self = [super init]) {
        _detailURL = detailURL;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [UIWebView new];
    [self.view addSubview:webView];
    webView.delegate = self;
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [webView loadRequest:[NSURLRequest requestWithURL:_detailURL]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
