#
# Be sure to run `pod lib lint EasyBarChart.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EasyBarChart'
  s.version          = '0.2.0'
  s.summary          = 'Pod to create bar charts.'
  s.swift_version    = '4.1'

  s.description      = 'This CocoaPod provides a simple interface to create multiple bar charts through UICollectionView.'


  s.homepage         = 'https://github.com/yasirfolio3/EasyBarChart'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yasirfolio3' => 'yali@folio3.com' }
  s.source           = { :git => 'https://github.com/yasirfolio3/EasyBarChart.git', :tag => s.version }

  s.ios.deployment_target = '9.0'

  s.source_files = 'EasyBarChart/Classes/**/*'
end
