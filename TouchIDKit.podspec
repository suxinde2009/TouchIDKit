Pod::Spec.new do |s|

  s.name         = "TouchIDKit"
  s.version      = "1.0.0"
  s.summary      = "A wrapper of TouchID for iOS. This framework is very easy to get started."

  s.homepage     = "https://github.com/suxinde2009/TouchIDKit"
  s.license      = "MIT"
  s.author             = { "suxinde2009" => "suxinde2009@126.com" }
  s.source       = { :git => "https://github.com/suxinde2009/TouchIDKit.git", :tag => "#{s.version}" }
  
  s.swift_version = "4.0"
  s.ios.deployment_target = "9.0"
  
  s.source_files  = "TouchIDKit/**/*.h", "TouchIDKit/**/*.{h,m,swift}"
  s.public_header_files = "TouchIDKit/**/*.h", "TouchIDKit/**/*.h"
  s.frameworks = "LocalAuthentication"
end
