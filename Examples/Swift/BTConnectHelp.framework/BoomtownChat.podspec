#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "BoomtownChat"
  s.version          = "1.1"
  s.summary          = "Boomtown Chat component for Member, Relay, and Technician Apps."
  s.description      = <<-DESC
                       Boomtown Chat component for Member, Relay, and Technician Apps
                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "http://goboomtown.com/"
  s.license          = 'MIT'
  s.author           = { "Larry Borsato" => "lborsato@goboomtown.com" }
  s.source           = { :path => "../boomtown-boomtown-ios", :tag => s.version.to_s }
  s.source           = { :path => "../BoomtownChat", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/EXAMPLE'

  s.platform     = :ios, '8.1'
  s.requires_arc = true

  s.source_files = 'Classes/**/*.{h,m}', 'adium-hipchat-emoticons/Hipchat.AdiumEmoticonSet/*.plist'
  s.resources    = '*.{xib}', 'adium-hipchat-emoticons/Hipchat.AdiumEmoticonSet/*'

  # s.ios.exclude_files = 'Classes/osx'
  # s.osx.exclude_files = 'Classes/ios'
  s.public_header_files = 'Classes/**/*.h',
  s.frameworks = 'SystemConfiguration', 'CoreTelephony', 'QuartzCore', 'OpenGLES', 'CoreMedia', 'CoreVideo', 'AudioToolbox', 'AVFoundation', 'CoreGraphics', 'Accelerate'
  s.xcconfig     = {
#  'FRAMEWORK_SEARCH_PATHS' => '../boomtown-boomtownchat-ios',
  'HEADER_SEARCH_PATHS' => '"$(inherited)" "$(SDKROOT)/usr/include/libxml2" "$(SDKROOT)/usr/include/libresolv" "$(SDKROOT)/Pods/XMPPFramework/module"',
  'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
  'OTHER_LDFLAGS' => '"$(inherited)" "-lxml2" "-objc"'
 }
  s.dependency 'XMPPFramework'
  s.dependency 'JSQMessagesViewController'
  s.libraries = 'c++','z'

end
