//
//  WKWebViewController.m
//  JSCallBackDemo
//
//  Created by czq on 2017/9/6.
//  Copyright © 2017年 czq. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>

@interface WKWebViewController ()

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 初始化webview
- (void)setupWebView {
    WKWebView *webView = [WKWebView alloc] initWithFrame:(CGRect) configuration:<#(nonnull WKWebViewConfiguration *)#>
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
