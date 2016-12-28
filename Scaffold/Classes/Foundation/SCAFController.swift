//
//  SCAFController.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/3/16.
//
//

import Foundation

public enum SCAFControllerStatus: Int {
    case offline
    case initializing
    case repairing
    case online
}

public protocol SCAFController {
    
    var name: String { get }
    
    var status: SCAFControllerStatus { get }
    
    func start() throws
    
    func stop() throws
    
}

open class SCAFControllerNode: NSObject, SCAFController {
    
    open var name: String {
        get {
            return self.className
        }
    }
    
    open var status: SCAFControllerStatus = .offline
    
    open func start() throws {
        self.status = .online
    }
    
    open func stop() throws {
        self.status = .offline
    }
    
}

open class SCAFControllerCascade: SCAFControllerNode {
    
    open var controllers: [SCAFController] = []
    
    
    public init(controllers: [SCAFController] = []) {
        super.init()
        self.controllers = controllers
    }
    
    open override func start() throws {
        self.status = .initializing
        for controller in self.controllers {
            try controller.start()
        }
        self.status = .online
    }
    
    open override func stop() throws {
        for controller in self.controllers {
            try controller.stop()
        }
    }
    
}
