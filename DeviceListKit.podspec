 #
#  Be sure to run `pod spec lint DeviceListKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "DeviceListKit"
  spec.version      = "1.0.6"
  spec.summary      = "DeviceListKit is a helper of UIDevice"

  spec.description  = <<-DESC
DeviceListKit is a helper of UIDevice.
                   DESC

  spec.homepage     = "https://github.com/igorsoares95/DeviceListKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "igorsoares95" => "igor_soares95@hotmail.com" }

  spec.ios.deployment_target = "10.3"
  spec.swift_version = "5.0"

  spec.source        = { :git => "https://github.com/igorsoares95/DeviceListKit.git", :tag => "#{spec.version}" }
  spec.source_files  = "DeviceListKit/**/*.{h,m,swift}"

end