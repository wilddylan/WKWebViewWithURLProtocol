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

#import <objc/runtime.h>

@interface WKViewController () <WKNavigationDelegate>

@property WKWebView *webView;

+ (BOOL) request: (NSURLRequest *) request;

@end

@implementation WKViewController

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {

}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.

  [NSURLProtocol wk_registerScheme:@"http"];
  [NSURLProtocol wk_registerScheme:@"https"];

  [NSURLProtocol registerClass:[URLProtocol class]];


//  Class c = NSClassFromString(@"WKCustomProtocol");

  _webView = [[WKWebView alloc] initWithFrame:self.view.frame];

  [self.view addSubview:_webView];

  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com/"]];
  request.HTTPBody = [@"Hello world" dataUsingEncoding:NSUTF8StringEncoding];
  [request setValue:@"custom header" forHTTPHeaderField:@"field"];

  _webView.navigationDelegate = self;
//  [_webView loadRequest:request];

  [[_webView valueForKey:@"browsingContextController"] performSelector:@selector(loadRequest:userData:) withObject:request withObject:@"1234"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
