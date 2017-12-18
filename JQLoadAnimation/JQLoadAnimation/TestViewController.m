//
//  TestViewController.m
//  JQLoadAnimation
//
//  Created by zhangjiaqi on 2017/12/14.
//  Copyright © 2017年 zhangjiaqi. All rights reserved.
//

#import "TestViewController.h"
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define IS_IPHONE_X_UIScreen (SCREEN_HEIGHT > 736.0)
#define Iphone_X_layoutHeight (IS_IPHONE_X_UIScreen?88:64)

@interface TestViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;

@end

@implementation TestViewController

-(UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, Iphone_X_layoutHeight, SCREEN_WIDTH, SCREEN_HEIGHT-Iphone_X_layoutHeight)];
        _webView.delegate = self;
        _webView.backgroundColor = [UIColor whiteColor];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
        
    }
    return _webView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self creatLoadingAnimation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.webView];

}

- (void)timerAction{
    [self loadingdidEnd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationTyp{
    return YES;
}

//开始加载时调用的方法
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self getSources];              //开始加载
}


//结束加载时调用的方法
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self loadingdidEnd];           //加载成功
}

//加载失败时调用的方法
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self loadfailed];              //加载失败
    
}



@end
