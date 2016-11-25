//
//  WKViewController.m
//  WKWebViewWithURLProtocol
//
//  Created by Dylan on 11/14/2016.
//  Copyright (c) 2016 Dylan. All rights reserved.
//

#import "WKViewController.h"
#import <WebKit/WebKit.h>
#import <NSURLProtocol+WKWebViewSupport.h>
#import "URLProtocol.h"

@interface WKViewController ()

  @property WKWebView *webView;

@end

@implementation WKViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.

  [NSURLProtocol wk_registerScheme:@"http"];
  [NSURLProtocol wk_registerScheme:@"https"];

  [NSURLProtocol registerClass:[URLProtocol class]];

  _webView = [[WKWebView alloc] initWithFrame:self.view.frame];
  [self.view addSubview:_webView];

  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/"]];
  request.HTTPBody = [@"Hello world" dataUsingEncoding:NSUTF8StringEncoding];
  [request setValue:@"custom header" forHTTPHeaderField:@"field"];

  [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
