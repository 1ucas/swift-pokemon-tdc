#
#  Be sure to run `pod spec lint SwiftPokemonModule.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "SwiftPokemonModule"
  spec.version      = "0.0.2"
  spec.summary      = "A short description of SwiftPokemonModule."
  spec.description  = <<-DESC
                      Descrição
                   DESC

  spec.homepage     = "http://EXAMPLE/SwiftPokemonModule"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author       = { "Manobray" => "lucasramos.m@gmail.com" }
  spec.platforms    = { :ios => "11.0" }
  spec.source       = { :git => "file:///./" }

  spec.pod_target_xcconfig = { 'RUN_DOCUMENTATION_COMPILER' => 'YES' }

  spec.source_files  = "Swift Pokemon Module/Swift Pokemon Module/**/*.{h,m,swift}"
  spec.resources = "Swift Pokemon Module/Swift Pokemon Module/**/*.{png,jpeg,jpg,storyboard,xib,lproj,ttf,xcassets,strings,json}"
  spec.swift_version = '5.0'
end
