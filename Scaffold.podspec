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
    
    #    scaffold.default_subspec = 'Foundation'
    
    scaffold.subspec 'Foundation' do |foundation|
        foundation.source_files = 'Scaffold/Classes/Foundation/*.{swift}'
    end
    
    scaffold.subspec 'Environment' do |environment|
        environment.source_files = 'Scaffold/Classes/Environment/*.{swift}'
    end
    
    scaffold.subspec 'Application' do |application|
        application.dependency 'Scaffold/Environment'
        
        application.frameworks = 'UIKit'
        
        application.source_files = 'Scaffold/Classes/Application/*.{swift}'
    end
    
    scaffold.subspec 'Networking' do |networking|
        networking.subspec 'Controller' do |controller|
            controller.source_files = 'Scaffold/Classes/Networking/*.{swift}'
        end
        
        networking.subspec 'Alamofire' do |alamofire|
            alamofire.dependency 'Scaffold/Networking/Controller'
            
            alamofire.dependency 'Alamofire'
            
            alamofire.source_files = 'Scaffold/Classes/Networking/Alamofire/*.{swift}'
        end
    end
    
    scaffold.subspec 'UIKit' do |uikit|
        uikit.dependency 'Scaffold/Foundation'
        
        uikit.frameworks = 'UIKit'
        
        uikit.source_files = 'Scaffold/Classes/UIKit/*.{swift}'
        
        uikit.subspec 'Scaffold' do |scaffold|
            scaffold.dependency 'Scaffold/Foundation'
            
            scaffold.frameworks = 'UIKit'
            
            scaffold.source_files = 'Scaffold/Classes/UIKit/UIScaffold.swift'
        end
        
        uikit.subspec 'Extensions' do |extensions|
            extensions.dependency 'Scaffold/Foundation'
            
            extensions.frameworks = 'UIKit'
            
            extensions.source_files = 'Scaffold/Classes/UIKit/Extensions/*.{swift}'
        end
        
        uikit.subspec 'Controllers' do |controllers|
            controllers.dependency 'Scaffold/UIKit/Scaffold'
            controllers.dependency 'Scaffold/UIKit/Extensions'
            
            controllers.source_files = 'Scaffold/Classes/UIKit/Controllers/*.{swift}'
        end
        
    end
    
end
