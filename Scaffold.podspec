#
# Be sure to run `pod lib lint Scaffold.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'Scaffold'
    s.version          = '0.1.0'
    s.summary          = 'Swift boilerplate, base level, structural, and convenience code for applications.'
    
    s.description      = <<-DESC
    Swift boilerplate, base level, structural, and convenience code for applications.
    
    Defines how views are constructed, persistence abstractions, generic controller structures etc.
    DESC
    
    s.homepage         = 'https://github.com/rohan-panchal/Scaffold'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Rohan Panchal' => 'engineering@rohanpanchal.com' }
    s.source           = { :git => 'https://github.com/rohan-panchal/Scaffold.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '8.0'
    
    s.source_files = 'Scaffold/Classes/**/*'
    
end
