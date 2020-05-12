#
# Be sure to run `pod lib lint HDPodspecs.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HDPodspecs'
  s.version          = '0.1.0'
  s.summary          = 'HDPodspecs contains custom controls in iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
HDPodspecs contains custom controls in iOS
                       DESC

  s.homepage         = 'https://github.com/Loghdst/HDPodspecs'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { 'Loghdst' => '1778343924@qq.com' }
  s.source           = { :git => 'https://github.com/Loghdst/HDPodspecs.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'HDPodspecs/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HDPodspecs' => ['HDPodspecs/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
