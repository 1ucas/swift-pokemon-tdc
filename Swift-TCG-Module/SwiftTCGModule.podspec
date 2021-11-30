#
#  Be sure to run `pod spec lint SwiftPokemonModule.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "SwiftTCGModule"
  spec.version      = "0.0.2"
  spec.summary      = "A short description of SwiftTCGModule."
  spec.description  = <<-DESC
                      Descrição
                   DESC

  spec.homepage     = "http://EXAMPLE/SwiftTCGModule"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author       = { "Manobray" => "lucasramos.m@gmail.com" }
  spec.platforms    = { :ios => "15.0" }
  spec.source       = { :git => "file:///.//" }

  spec.source_files  = "Swift TCG Module/**/*.{swift}"
  spec.swift_version = '5.0'
end
