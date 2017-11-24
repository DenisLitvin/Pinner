#
# Be sure to run `pod lib lint Pinner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Pinner'
  s.version          = '0.1.4'
  s.summary          = 'The Easy To Use Auto-Layout Library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Pinner helps you programmaticaly create all kinds of constraints that are easy to understand and maintain in just few lines of code.
    DESC
  s.ios.deployment_target  = '9.3'
  s.homepage         = 'https://github.com/DenisLitvin/Pinner'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DenisLitvin' => 'den.litvinn@gmail.com' }
  s.source           = { :git => 'https://github.com/DenisLitvin/Pinner.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.source_files = 'Pinner/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Pinner' => ['Pinner/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

end
