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
