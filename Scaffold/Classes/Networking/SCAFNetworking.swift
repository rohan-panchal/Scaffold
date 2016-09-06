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

public protocol SCAFNetworkController: SCAFController {
    
    init(host: String, reachabilityHost: String?)
    
    var reachabilityStatus: SCAFNetworkControllerReachabilityStatus { get }
    
}
