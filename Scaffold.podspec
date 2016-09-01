#
# Be sure to run `pod lib lint Scaffold.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |scaffold|
    scaffold.name             = 'Scaffold'
    scaffold.version          = '0.1.0'
    scaffold.summary          = 'Swift boilerplate, base level, structural, and convenience code for applications.'
    
    scaffold.description      = <<-DESC
    Swift boilerplate, base level, structural, and convenience code for applications.
    
    Defines how views are constructed, persistence abstractions, generic controller structures etc.
    DESC
    
    scaffold.homepage         = 'https://github.com/rohan-panchal/Scaffold'
    scaffold.license          = { :type => 'MIT', :file => 'LICENSE' }
    scaffold.author           = { 'Rohan Panchal' => 'engineering@rohanpanchal.com' }
    scaffold.source           = { :git => 'https://github.com/rohan-panchal/Scaffold.git', :tag => scaffold.version.to_s }
    
    scaffold.ios.deployment_target = '8.0'
    
    scaffold.subspec 'Environment' do |environment|
        environment.source_files = 'Scaffold/Classes/Environment/*.{swift}'
    end
    
end
