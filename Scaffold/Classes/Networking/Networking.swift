//
//  Networking.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/6/16.
//
//

import Foundation

public enum NetworkControllerReachabilityStatus {
    case unknown
    case unreachable
    case reachable
}

public protocol NetworkedController: Controller {
    
    var reachabilityStatus: NetworkControllerReachabilityStatus { get }
    var reachabilityHost: String? { get }
    var host: String { get }
    
    init(host: String, reachabilityHost: String?)
    
}

open class NetworkControllerNode: ControllerNode, NetworkedController {
    
    open var reachabilityStatus: NetworkControllerReachabilityStatus {
        return .unknown
    }
    open var reachabilityHost: String?
    open var host: String
    
    public required init(host: String, reachabilityHost: String?) {
        self.reachabilityHost = reachabilityHost
        self.host = host
    }
    
}
