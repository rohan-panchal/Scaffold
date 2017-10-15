//
//  EnvironmentTestCase.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/1/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
import Scaffold

class EnvironmentTestCase: XCTestCase {
    
    func testEnvironmentManagerInitializeEnvironmentDefault() {
        EnvironmentManager.initializeEnvironment()
        
        XCTAssert(EnvironmentManager.sharedManager.environment == .development)
    }
    
    func testEnvironmentManagerInitializeEnvironmentNonDefaultValue() {
        EnvironmentManager.initializeEnvironment(.production)
        
        XCTAssert(EnvironmentManager.sharedManager.environment == .production)
    }
    
}
