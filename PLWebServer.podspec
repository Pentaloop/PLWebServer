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
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |cs|
    cs.source_files = 'PLWebServer/**/*.{h,m}'
    cs.requires_arc = true
    cs.ios.library = 'z'
    cs.ios.frameworks = 'MobileCoreServices', 'CFNetwork'
    cs.tvos.library = 'z'
    cs.tvos.frameworks = 'MobileCoreServices', 'CFNetwork'
    cs.osx.library = 'z'
    cs.osx.framework = 'SystemConfiguration'
  end
end