Pod::Spec.new do |s|
  s.name     = 'PLWebServer'
  s.version  = '1.0'
  s.author   =  { 'Haseeb Yousaf' => 'info@pentaloop.com' }
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage = 'https://github.com/Pentaloop/PLWebServer'
  s.summary  = 'Lightweight GCD based HTTP server for OS X & iOS (includes web based uploader & WebDAV server)'
  
  s.source   = { :git => 'https://github.com/Pentaloop/PLWebServer', :tag => s.version.to_s }
  s.ios.deployment_target = '5.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.7'
  s.requires_arc = true
  
  s.dependency 'CocoaAsyncSocket', '~> 7.4.3'
  s.dependency 'CocoaLumberjack', '~> 2.3.0'
  
  s.source_files = 'PLWebServer/**/*.{h,m}'
  s.requires_arc = true
  s.ios.library = 'z'
  s.ios.frameworks = 'MobileCoreServices', 'CFNetwork'
  s.tvos.library = 'z'
  s.tvos.frameworks = 'MobileCoreServices', 'CFNetwork'
  s.osx.library = 'z'
  s.osx.framework = 'SystemConfiguration'

end