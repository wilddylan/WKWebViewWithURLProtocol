# WKWebViewWithURLProtocol

:Warning:

> Note：If you target iOS 11, you can now use WKURLSchemeHandler to avoid this trick! 😆


###### introductions

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

After `iOS8.0`, `WKWebView` want to instead of `UIWebView`, but with some defects such as: URLProtocol can't process the request from WKWebView.
`WKWebViewWithURLProtocol` want to fix this use runtime. Now-coming!

But Notice, WKWebView ignored HTTP Body in request, it's a bug, resolve with `Javascript bridge` or `NSURLSession`.

```objc
[NSURLProtocol wk_registerScheme:@"http"];
[NSURLProtocol wk_registerScheme:@"https"];

[NSURLProtocol registerClass:[URLProtocol class]];
```

`URLProtocol` is the subclass of `NSURLProtocol`, before this, use `wk_registerScheme` to let `URLProtocol` known what scheme can be hooked from WKWebView. Now this demo want to hook `http` and `https` scheme.

```objc
[_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.devdylan.cn"]]];
```

Now, open your custom URLProtocol, set some breakpoint or logs, oh my god! it's worked!

> Notes: It's only useful when systemVersion > `iOS8.4`

Some questions: 

Q: Used private API when in review:

A: [Watch this issue](https://github.com/brave/browser-ios/issues/96#issuecomment-260365341)

###### Installation

```ruby
pod "WKWebViewWithURLProtocol"
```

###### Author

Dylan, dylan@china.com

###### Thanks

@yeatse, Original repo without cocoapods

###### License

MIT License.

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2FWildDylan%2FWKWebViewWithURLProtocol.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2FWildDylan%2FWKWebViewWithURLProtocol?ref=badge_large)
