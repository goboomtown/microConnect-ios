#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "BoomtownAPI"
  s.version          = "2.0.0"
  s.summary          = "Boomtown Server API for Connect, Relay, and ToolBox Apps."
  s.description      = <<-DESC
                       Boomtown Server API for Connect, Relay, and ToolBox Apps
                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "http://goboomtown.com/"
  s.license          = 'MIT'
  s.author           = { "Larry Borsato" => "lborsato@goboomtown.com" }
  s.source           = { :path => "../BoomtownAPI", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'AFNetworking', '~> 2.0'
end
