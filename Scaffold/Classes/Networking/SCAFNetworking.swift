//
//  SCAFNetworking.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/6/16.
//
//

import Foundation

public enum SCAFNetworkControllerReachabilityStatus {
    case Unreachable
    case Reachable
}

public protocol SCAFNetworkedController: SCAFController {
    
    var reachabilityStatus: SCAFNetworkControllerReachabilityStatus { get }
    var reachabilityHost: String? { get }
    var host: String { get }
    
    init(host: String, reachabilityHost: String?)
    
}

public class SCAFNetworkControllerNode: SCAFControllerNode, SCAFNetworkedController {
    
    public var reachabilityStatus: SCAFNetworkControllerReachabilityStatus = .Unreachable
    public var reachabilityHost: String?
    public var host: String
    
    public required init(host: String, reachabilityHost: String?) {
        self.reachabilityHost = reachabilityHost
        self.host = host
    }
    
}
