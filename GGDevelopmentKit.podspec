Pod::Spec.new do |spec|
  spec.platform     = :ios
  spec.ios.deployment_target = '10.0'
  spec.name         = "GGDevelopmentKit"
  spec.version      = "0.0.3"
  spec.module_name           = 'Agreements'
  spec.summary      = "All essential code for my applications"


  spec.homepage     = "https://github.com/Crowlleey"
  spec.license      = "MIT"
  spec.author             = { "George Gomes" => "georgevag@protonmail.com" }
 

  spec.source       = { :git => "https://github.com/Crowlleey/GGDevelopmentKit.git", :tag => "#{spec.version}" }



end
