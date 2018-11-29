#
# Be sure to run `pod lib lint FooterLinker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FooterLinker'
  s.version          = '0.1.0'
  s.summary          = 'An object that anchor footer to table or scrolling with it.'
  s.homepage         = 'https://github.com/aly23/FooterLinker'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alice Migliorati' => 'alice.migliorati@outlook.it' }
  s.source           = { :git => 'https://github.com/aly23/FooterLinker.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'FooterLinker/Classes/**/*'
end
