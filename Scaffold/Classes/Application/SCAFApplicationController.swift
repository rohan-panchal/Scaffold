//
//  SCAFApplicationController.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/2/16.
//
//

import UIKit

enum SCAFApplicationError: ErrorType {
    case InvalidInitialViewController
    case InvalidLaunchURL
}

public class SCAFApplicationController: UIResponder {
    
    public var window: UIWindow?
    
    public var environment: SCAFEnvironmentType = .Development
    
    public func initialViewController() -> UIViewController? {
        return nil
    }
    
}

extension SCAFApplicationController: UIApplicationDelegate {
    
    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        do {
            try self.setupWindow()
            
            self.window?.makeKeyAndVisible()
        } catch let error as NSError {
            NSLog("Error reason:\(error.localizedFailureReason)")
            return false
        }
        
        if Platform.Simulator {
            self.applicationWillLaunchInSimulator()
        } else if Platform.iOS {
            self.applicationWillLaunchOnDevice()
        }
        
        self.processLaunchOptions(application, launchOptions: launchOptions)
        
        return true
    }
    
}

extension SCAFApplicationController {
    
    public func applicationWillLaunchInSimulator() {
        
    }
    
    public func applicationWillLaunchOnDevice() {
        
    }
    
}

// MARK: - Window Setup Options
extension SCAFApplicationController {
    
    private func setupWindow() throws {
        if self.window == nil {
            self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        }
        
        guard let initialViewController = self.initialViewController() else {
            throw SCAFApplicationError.InvalidInitialViewController
        }
        
        self.window?.rootViewController = initialViewController
    }
    
}

// MARK: - Launch Options
extension SCAFApplicationController {
    
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
