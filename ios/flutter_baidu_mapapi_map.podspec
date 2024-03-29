#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_baidu_mapapi_map.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_baidu_mapapi_map'
  s.version          = '3.2.0'
  s.summary          = 'flutter_baidu_mapapi_map fork'
  s.description      = <<-DESC
flutter_baidu_mapapi_map fork
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'flutter_baidu_mapapi_base'
  s.dependency 'BaiduMapKit/Map','6.5.2'
  s.platform = :ios, '8.0'
  s.static_framework = true


  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
