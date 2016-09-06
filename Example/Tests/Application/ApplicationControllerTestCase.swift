//
//  ApplicationControllerTestCase.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/2/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
import Scaffold

private class TestApplicationController: SCAFApplicationController {
    
    private override func initialViewController() -> UIViewController? {
        return UIViewController(nibName: nil, bundle: nil)
    }
    
}

class ApplicationControllerTestCase: XCTestCase {

    func testApplicationControllerLaunchingNoInitialViewController() {
        
        let controller = SCAFApplicationController()
        
        XCTAssertFalse(controller.application(UIApplication.sharedApplication(), didFinishLaunchingWithOptions: nil),
                       "ApplicationController didFinishLaunchingWithOptions should return false by default")
    }
    
}
