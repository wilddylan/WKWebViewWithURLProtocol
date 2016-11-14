Pod::Spec.new do |s|
  s.name             = 'WKWebViewWithURLProtocol'
  s.version          = '0.1.0'
  s.summary          = 'Make webView can hooked by URLProtocol.'
  s.description      = <<-DESC
Make webView can hooked by URLProtocol.
                       DESC

  s.homepage         = 'https://github.com/WildDylan/WKWebViewWithURLProtocol'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dylan' => 'dylan@china.com' }
  s.source           = { :git => 'https://github.com/WildDylan/WKWebViewWithURLProtocol.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'WKWebViewWithURLProtocol/**/*'

  s.public_header_files = 'WKWebViewWithURLProtocol/**/*.h'
  s.frameworks = 'Foundation', 'WebKit'
end
