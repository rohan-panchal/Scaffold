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
        SCAFEnvironmentManager.initializeEnvironment()
        
        XCTAssert(SCAFEnvironmentManager.sharedManager.environment == .Development)
    }
    
    func testEnvironmentManagerInitializeEnvironmentNonDefaultValue() {
        SCAFEnvironmentManager.initializeEnvironment(.Production)
        
        XCTAssert(SCAFEnvironmentManager.sharedManager.environment == .Production)
    }
    
}
