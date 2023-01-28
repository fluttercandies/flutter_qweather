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
  s.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  s.dependency 'AFNetworking','~>4.0.0'
  s.dependency 'Flutter'
  s.dependency 'QWeather-SDK'
  s.platform = :ios, '9.0'
  s.static_framework = true

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
