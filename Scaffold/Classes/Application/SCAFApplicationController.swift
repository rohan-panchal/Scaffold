//
//  SCAFApplicationController.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/2/16.
//
//

import UIKit

enum SCAFApplicationError: Error {
    case invalidInitialViewController
    case invalidLaunchURL
}

// MARK: - Application Controller

open class SCAFApplicationController: UIResponder {
    
    open var window: UIWindow?
    
    open var environment: EnvironmentType = .development
    
    open func initialViewController() -> UIViewController? {
        return nil
    }
    
}

// MARK: - Application Delegate

extension SCAFApplicationController: UIApplicationDelegate {
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        do {
            try self.setupWindow()
            
            self.window?.makeKeyAndVisible()
        } catch let error as NSError {
            if let failureReaseon = error.localizedFailureReason {
                NSLog("Window setup error:\(failureReaseon)")
            } else {
                NSLog("Window setup error")
            }
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

// MARK: - Context Callbacks

extension SCAFApplicationController {
    
    /**
     Callback method which gets called when the application is running on an iOS Simulator.
     */
    public func applicationWillLaunchInSimulator() {
    }
    
    /**
    Callback method which gets called when the application is running on an iOS Device.
     */
    public func applicationWillLaunchOnDevice() {
    }
    
}

// MARK: - Window Setup Options

extension SCAFApplicationController {
    
    /**
     Sets up the application UIWindow.
     
     @throws SCAFApplicationError.invalidInitialViewController.
     */
    fileprivate func setupWindow() throws {
        if self.window == nil {
            self.window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        guard let initialViewController = self.initialViewController() else {
            throw SCAFApplicationError.invalidInitialViewController
        }
        
        self.window?.rootViewController = initialViewController
    }
    
}

// MARK: - Launch Options

extension SCAFApplicationController {
    
    /**
     Processes the launch option arguments provided on launch of the application.
     */
    fileprivate func processLaunchOptions(_ application: UIApplication, launchOptions: [AnyHashable: Any]?) {
        guard let launchOptions = launchOptions else {
            return
        }
        
        if let launchURL = launchOptions[UIApplicationLaunchOptionsKey.url] as? URL {
            self.processLaunchURL(launchURL)
        }
    }
    
    /**
     Callback method which gets called when the application is launched with a URL.
     */
    open func processLaunchURL(_ launchURL: URL) {
        // TODO: Process Launch URL.
    }
    
}
