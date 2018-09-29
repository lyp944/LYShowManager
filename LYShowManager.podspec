#
# Be sure to run `pod lib lint LYShowManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LYShowManager'
  s.version          = '0.1.0'
  s.summary          = '处理应用启动时，多个ViewController启动条件和顺序难以管理的问题'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  当应用程序启动时，有时需要监测多个将要显示的页面，比如：引导页、教程页、启动等
                       DESC

  s.homepage         = 'https://github.com/lyp944/LYShowManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mega' => 'yunpeng.li@sdbean.com' }
  s.source           = { :git => 'https://github.com/lyp944/LYShowManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LYShowManager/Classes/**/*'
  
   s.resource_bundles = {
     'LYShowManager' => ['LYShowManager/Assets/*.png']
   }

   s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
