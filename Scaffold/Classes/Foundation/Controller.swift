//
//  Controller.swift
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
public enum ControllerStatus: Int {
    case offline
    case initializing
    case repairing
    case online
}

/**
 Defines the method interface for a SCAFController.
 */
public protocol Controller {
    
    var name: String { get }
    
    var status: ControllerStatus { get }
    
    func start() throws
    
    func stop() throws
    
}

/**
 A Controller implementation.
 */
open class ControllerNode: NSObject, Controller {
    
    open var name: String {
        get {
            return self.className
        }
    }
    
    open var status: ControllerStatus = .offline
    
    open func start() throws {
        self.status = .online
    }
    
    open func stop() throws {
        self.status = .offline
    }
    
}

/**
 A cascade of Controller types.
 */
open class ControllerCascade: ControllerNode {
    
    open var controllers: [String: Controller] = [:]
    
    public init(controllers: [String: Controller] = [:]) {
        super.init()
        self.controllers = controllers
    }
    
    open override func start() throws {
        self.status = .initializing
        for controller in self.controllers.values {
            try controller.start()
        }
        self.status = .online
    }
    
    open override func stop() throws {
        for controller in self.controllers.values {
            try controller.stop()
        }
    }
    
}
