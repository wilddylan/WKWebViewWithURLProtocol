//
//  URLProtocol.m
//  WKWebViewWithURLProtocol
//
//  Created by Dylan on 2016/11/14.
//  Copyright © 2016年 Dylan. All rights reserved.
//

#import "URLProtocol.h"

@implementation URLProtocol

  + (BOOL)canInitWithRequest:(NSURLRequest *)request {
    NSLog(@"-> %s: %@", __func__, request.URL);
    return YES;
  }

  + (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    NSLog(@"-> %s: %@", __func__, request.URL);
    return request;
  }

  - (instancetype)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id<NSURLProtocolClient>)client {
    self = [super initWithRequest:request cachedResponse:cachedResponse client:client];
    if ( self ) {
      NSLog(@"-> %s: %@", __func__, request.URL);
    }
    return self;
  }

  - (void)startLoading {

    NSLog(@"-> %s: %@", __func__, self.request.URL);
  }

  - (void)stopLoading {

    NSLog(@"-> %s: %@", __func__, self.request.URL);
  }

@end
