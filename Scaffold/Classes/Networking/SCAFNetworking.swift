//
//  SCAFNetworking.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/6/16.
//
//

import Foundation

public enum SCAFNetworkControllerReachabilityStatus {
    case unknown
    case unreachable
    case reachable
}

public protocol SCAFNetworkedController: Controller {
    
    var reachabilityStatus: SCAFNetworkControllerReachabilityStatus { get }
    var reachabilityHost: String? { get }
    var host: String { get }
    
    init(host: String, reachabilityHost: String?)
    
}

open class SCAFNetworkControllerNode: ControllerNode, SCAFNetworkedController {
    
    open var reachabilityStatus: SCAFNetworkControllerReachabilityStatus {
        return .unknown
    }
    open var reachabilityHost: String?
    open var host: String
    
    public required init(host: String, reachabilityHost: String?) {
        self.reachabilityHost = reachabilityHost
        self.host = host
    }
    
}
