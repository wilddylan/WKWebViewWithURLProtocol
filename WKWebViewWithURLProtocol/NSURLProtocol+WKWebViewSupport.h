//
//  NSURLProtocol+WKWebViewSupport.h
//  Pods
//
//  Created by Dylan on 2016/11/14.
//
//

#import <Foundation/Foundation.h>

@interface NSURLProtocol (WKWebViewSupport)

+ (void)wk_registerScheme:(NSString *)scheme;
+ (void)wk_unregisterScheme:(NSString *)scheme;

@end
