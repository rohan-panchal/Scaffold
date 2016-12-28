//
//  SCAFEnvironment.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/1/16.
//
//

import Foundation

/**
 A value denoting specific environments.
 
 - Test:        For Test Targets.
 - Development: For Development environment, simulator, default.
 - Staging:     For Production-like Staging environments.
 - Production:  For Production builds.
 */
public enum SCAFEnvironmentType {
    case test
    case development
    case staging
    case production
}

/// Manages a Singleton Environment
open class SCAFEnvironmentManager {
    
    open static let sharedManager: SCAFEnvironmentManager = SCAFEnvironmentManager()
    
    open var environment: SCAFEnvironmentType {
        get {
            return self.internalEnvironment
        }
    }
    var internalEnvironment: SCAFEnvironmentType
    
    /**
     Initializes the Singleton environment.
     
     - parameter environment: An EnvironmentType value.
     */
    open class func initializeEnvironment(_ environment: SCAFEnvironmentType = .development) {
        sharedManager.internalEnvironment = environment
    }
    
    init(environment: SCAFEnvironmentType = .development) {
        self.internalEnvironment = environment
    }
    
}
