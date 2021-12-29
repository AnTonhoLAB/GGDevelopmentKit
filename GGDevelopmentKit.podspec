Pod::Spec.new do |spec|
  spec.platform     = :ios
  spec.ios.deployment_target = '10.0'
  spec.name         = "GGDevelopmentKit"
  spec.version      = "0.0.5-rc8"
  spec.module_name  = 'GGDevelopmentKit'
  spec.summary      = "All essential code for my applications"


  spec.homepage     = "https://github.com/AnTonhoLAB"
  spec.license      = "MIT"
  spec.author             = { "George Gomes" => "georgevag@protonmail.com" }
 

  spec.source       = { :git => "https://github.com/AnTonhoLAB/GGDevelopmentKit.git", :tag => "#{spec.version}" }

  spec.framework = "UIKit"
  spec.source_files = ["#{spec.module_name}/Coordinator/**/*.{swift}"]
  # spec.source_files  = 'Classes/*.{h,m}'
end
