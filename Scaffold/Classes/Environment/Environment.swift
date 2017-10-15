//
//  Environment.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/1/16.
//
//

import Foundation

/**
 A value denoting specific environments.
 
 - test:        For Test Targets.
 - development: For Development environment, simulator, default.
 - staging:     For Production-like Staging environments.
 - production:  For Production builds.
 */
public enum EnvironmentType {
    case test
    case development
    case staging
    case production
}

/// Manages a Singleton Environment
open class EnvironmentManager {
    
    open static let sharedManager: EnvironmentManager = EnvironmentManager()
    
    open var environment: EnvironmentType {
        get {
            return self.internalEnvironment
        }
    }
    var internalEnvironment: EnvironmentType
    
    /**
     Initializes the Singleton environment.
     
     - parameter environment: An EnvironmentType value.
     */
    open class func initializeEnvironment(_ environment: EnvironmentType = .development) {
        sharedManager.internalEnvironment = environment
    }
    
    init(environment: EnvironmentType = .development) {
        self.internalEnvironment = environment
    }
    
}
