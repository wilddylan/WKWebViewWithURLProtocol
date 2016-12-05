//
//  URLProtocol.h
//  WKWebViewWithURLProtocol
//
//  Created by Dylan on 2016/11/14.
//  Copyright © 2016年 Dylan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLProtocol : NSURLProtocol

- (instancetype)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id<NSURLProtocolClient>)client;

@end
