//
//  ApplicationController.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/2/16.
//
//

import UIKit

enum ApplicationError: ErrorType {
    case InvalidInitialViewController
    case InvalidLaunchURL
}

public class ApplicationController: UIResponder {
    
    public var window: UIWindow?
    
    public var environment: EnvironmentType = .Development
    
    public func initialViewController() -> UIViewController? {
        return nil
    }
    
}

extension ApplicationController: UIApplicationDelegate {
    
    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        do {
            try self.setupWindow()
            
            self.window?.makeKeyAndVisible()
        } catch let error as NSError {
            
            return false
        }
        
        self.processLaunchOptions(application, launchOptions: launchOptions)
        
        return true
    }
    
}

// MARK: - Window Setup Options
extension ApplicationController {
    
    private func setupWindow() throws {
        if self.window == nil {
            self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        }
        
        guard let initialViewController = self.initialViewController() else {
            throw ApplicationError.InvalidInitialViewController
        }
        
        self.window?.rootViewController = initialViewController
    }
    
}

// MARK: - Launch Options
extension ApplicationController {
    
    private func processLaunchOptions(application: UIApplication, launchOptions: [NSObject: AnyObject]?) {
        guard let launchOptions = launchOptions else {
            return
        }
        
        if let launchURL = launchOptions[UIApplicationLaunchOptionsURLKey] as? NSURL {
            self.processLaunchURL(launchURL)
        }
    }
    
    private func processLaunchURL(launchURL: NSURL) {
        // TODO: Process Launch URL.
    }
    
}
