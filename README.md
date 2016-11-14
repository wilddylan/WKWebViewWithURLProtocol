# WKWebViewWithURLProtocol

###### introductions

After `iOS8.0`, `WKWebView` want to instead of `UIWebView`, but with some defects such as: URLProtocol can't process the request from WKWebView.
`WKWebViewWithURLProtocol` want fix this use runtime. Now, coming!

step.1:

```objc
[NSURLProtocol wk_registerScheme:@"http"];
[NSURLProtocol wk_registerScheme:@"https"];

[NSURLProtocol registerClass:[URLProtocol class]];
```

`URLProtocol` is the subclass of `NSURLProtocol`, before this, use `wk_registerScheme` to let `URLProtocol` know what scheme can be hooked from WKWebView. Now this demo want to hook `http` and `https` scheme.

```objc
[_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.devdylan.cn"]]];
```

Now, go to your custom URLProtocol, set some breakpoint or logs, oh my god! it's worked!


###### Installation

```ruby
pod "WKWebViewWithURLProtocol"
```

###### Author

Dylan, dylan@china.com

###### Thanks

@yeatse <Original repo without cocoapods>

###### License

MIT.


