Pod::Spec.new do |s|

  s.name             = "TextFocuser"
  s.version          = "0.0.2"
  s.summary          = "AutoFocus on textField"
  s.homepage         = "https://github.com/taewan0530/TextFocuser"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "taewan kim" => "taewan0530@daum.net" }
  s.source           = { :git => "https://github.com/taewan0530/TextFocuser.git",
                         :tag => s.version.to_s }
  
  s.platform     = :ios, '8.0'
  s.source_files = 'Sources/*.{swift,h}'
  s.frameworks   = 'UIKit', 'Foundation'
  s.requires_arc = true
  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '3.0'
  }
  
end
