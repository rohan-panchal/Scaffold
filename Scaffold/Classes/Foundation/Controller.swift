//
//  Controller.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/3/16.
//
//

import Foundation

public enum ControllerStatus: Int {
    case Offline
    case Initializing
    case Repairing
    case Online
}

public protocol Controller {
    
    var name: String { get }
    
    var status: ControllerStatus { get }
    
    func start() throws
    
    func stop() throws
    
}

public class ControllerNode: NSObject, Controller {
    
    public var name: String {
        get {
            return self.className
        }
    }
    
    public var status: ControllerStatus = .Offline
    
    public func start() throws {
        self.status = .Online
    }
    
    public func stop() throws {
        self.status = .Offline
    }
    
}
