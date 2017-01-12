//
//  MyWebViewController.m
//  PSBaiSi
//
//  Created by 思 彭 on 17/1/12.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "MyWebViewController.h"
#import <WebKit/WebKit.h>

@interface MyWebViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshItem;
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation MyWebViewController

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    self.webView.frame = self.contentView.bounds;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createWebView];
}

- (void)createWebView {
    
    self.webView = [[WKWebView alloc]init];
    [self.contentView addSubview:self.webView];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:self.url];
    [self.webView loadRequest:request];
    // 添加观察者
    [self.webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    //前进观察者
    [self.webView addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    //title观察者
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    
    //进度条观察者
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    self.backItem.enabled = [self.webView canGoBack];
    self.forwardItem.enabled = [self.webView canGoForward];
    self.title = self.webView.title;
    self.progressView.progress = self.webView.estimatedProgress;
    self.progressView.hidden = self.webView.estimatedProgress >= 1;
}

- (IBAction)backDidClick:(id)sender {

    [self.webView goBack];
}

- (IBAction)forwardDidClick:(id)sender {
    
    [self.webView goForward];
}

- (IBAction)refreshDidClick:(id)sender {
 
    [self.webView reload];
}

// 移除通知
- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"canGoBack"];
    [self.webView removeObserver:self forKeyPath:@"canGoForward"];
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
@end
