#
# Be sure to run `pod lib lint WGExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WGExtension'
  s.version          = '1.0.2'
  s.summary          = 'WGExtension.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Just the category and tools.'

  s.homepage         = 'https://github.com/Veeco/WGExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Veeco' => '298059748@qq.com' }
  s.source           = { :git => 'https://github.com/Veeco/WGExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'WGExtension/Category/WGExtension.h'

  s.subspec 'Category' do |ss|
    ss.source_files = 'WGExtension/Category/*+WGExtension.*'
  end

  s.subspec 'Header' do |ss|
    ss.source_files = 'WGExtension/Header/*'
  end

  s.subspec 'Tool' do |ss|
    ss.subspec 'UUID' do |sss|
      sss.source_files = 'WGExtension/Util/UUID/*'
    end
  end  
  
  # s.resource_bundles = {
  #   'WGExtension' => ['WGExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
