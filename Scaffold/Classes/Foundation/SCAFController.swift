//
//  SCAFController.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/3/16.
//
//

import Foundation

public enum SCAFControllerStatus: Int {
    case Offline
    case Initializing
    case Repairing
    case Online
}

public protocol SCAFController {
    
    var name: String { get }
    
    var status: SCAFControllerStatus { get }
    
    func start() throws
    
    func stop() throws
    
}

public class SCAFControllerNode: NSObject, SCAFController {
    
    public var name: String {
        get {
            return self.className
        }
    }
    
    public var status: SCAFControllerStatus = .Offline
    
    public func start() throws {
        self.status = .Online
    }
    
    public func stop() throws {
        self.status = .Offline
    }
    
}

public class SCAFControllerCascade: SCAFControllerNode {
    
    public var controllers: [SCAFController] = []
    
    
    public init(controllers: [SCAFController] = []) {
        super.init()
        self.controllers = controllers
    }
    
    public override func start() throws {
        self.status = .Initializing
        for controller in self.controllers {
            try controller.start()
        }
        self.status = .Online
    }
    
    public override func stop() throws {
        for controller in self.controllers {
            try controller.stop()
        }
    }
    
}
