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
 
 - Test:        For Test Targets.
 - Development: For Development environment, simulator, default.
 - Staging:     For Production-like Staging environments.
 - Production:  For Production builds.
 */
public enum EnvironmentType {
    case Test
    case Development
    case Staging
    case Production
}

/// Manages a Singleton Environment
public class EnvironmentManager {
    
    public static let sharedManager: EnvironmentManager = EnvironmentManager()
    
    public var environment: EnvironmentType {
        get {
            return self.internalEnvironment
        }
    }
    var internalEnvironment: EnvironmentType
    
    /**
     Initializes the Singleton environment.
     
     - parameter environment: An EnvironmentType value.
     */
    public class func initializeEnvironment(environment: EnvironmentType = .Development) {
        sharedManager.internalEnvironment = environment
    }
    
    init(environment: EnvironmentType = .Development) {
        self.internalEnvironment = environment
    }
    
}