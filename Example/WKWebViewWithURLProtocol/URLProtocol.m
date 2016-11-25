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

    NSLog(@"%s %@", __func__, [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);
    NSLog(@"%s %@", __func__, [request valueForHTTPHeaderField:@"field"]);

    return YES;
  }

  + (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {

    NSLog(@"%s %@", __func__, [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);
    NSLog(@"%s %@", __func__, [request valueForHTTPHeaderField:@"field"]);

    return request;
  }

  - (instancetype)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id<NSURLProtocolClient>)client {
    self = [super initWithRequest:request cachedResponse:cachedResponse client:client];
    if ( self ) {

    }
    return self;
  }

  - (void)startLoading {

    // simu get data
    NSString *htmlString = @"Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!Hello world!!";

    NSURLResponse *response = [[NSURLResponse alloc] initWithURL:[NSURL URLWithString:@"https://github.com"] MIMEType:@"text/html" expectedContentLength:[htmlString dataUsingEncoding:NSUTF8StringEncoding].length textEncodingName:@"utf-8"];

    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    [self.client URLProtocol:self didLoadData:[htmlString dataUsingEncoding:NSUTF8StringEncoding]];
    [self.client URLProtocolDidFinishLoading:self];
  }

  - (void)stopLoading {

  }

@end
