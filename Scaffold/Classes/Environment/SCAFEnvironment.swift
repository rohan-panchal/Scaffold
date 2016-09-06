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
    case Test
    case Development
    case Staging
    case Production
}

/// Manages a Singleton Environment
public class SCAFEnvironmentManager {
    
    public static let sharedManager: SCAFEnvironmentManager = SCAFEnvironmentManager()
    
    public var environment: SCAFEnvironmentType {
        get {
            return self.internalEnvironment
        }
    }
    var internalEnvironment: SCAFEnvironmentType
    
    /**
     Initializes the Singleton environment.
     
     - parameter environment: An EnvironmentType value.
     */
    public class func initializeEnvironment(environment: SCAFEnvironmentType = .Development) {
        sharedManager.internalEnvironment = environment
    }
    
    init(environment: SCAFEnvironmentType = .Development) {
        self.internalEnvironment = environment
    }
    
}