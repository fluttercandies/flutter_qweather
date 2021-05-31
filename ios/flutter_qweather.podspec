#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_qweather.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_qweather'
  s.version          = '0.0.1'
  s.summary          = 'A qweather Flutter plugin.'
  s.description      = <<-DESC
A qweather Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
#  s.preserve_paths = 'Frameworks/*.framework'
  s.vendored_frameworks = 'QWeather.framework'
#  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework QWeather' }
  s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  s.dependency 'AFNetworking','~>4.0.0'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
