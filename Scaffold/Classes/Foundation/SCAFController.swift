//
//  SCAFController.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/3/16.
//
//

import Foundation

/**
 A value denoting specific environments.
 
 - offline:      Offline status.
 - initializing: Initializing status.
 - repairing:    Repairing status.
 - online:       Online status.
 */
public enum SCAFControllerStatus: Int {
    case offline
    case initializing
    case repairing
    case online
}

/**
 Defines the method interface for a SCAFController.
 */
public protocol SCAFController {
    
    var name: String { get }
    
    var status: SCAFControllerStatus { get }
    
    func start() throws
    
    func stop() throws
    
}

/**
 A SCAFController implementation.
 */
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

/**
 A cascade of SCAFController types.
 */
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
