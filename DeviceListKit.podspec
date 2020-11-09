#
#  Be sure to run `pod spec lint DeviceListKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "DeviceListKit"
  spec.version      = "0.0.3"
  spec.summary      = "A CocoaPods library written in Swift"

  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/igorsoares95/DeviceListKit"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "igorsoares95" => "igor_soares95@hotmail.com" }

  spec.ios.deployment_target = "10.3"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/igorsoares95/DeviceListKit.git", :tag => "#{spec.version}" }
  spec.source_files  = "DeviceListKit/**/*.{h,m,swift}"

end