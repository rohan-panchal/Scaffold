//
//  SCAFAlamofireController.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/6/16.
//
//

import Alamofire

extension NetworkReachabilityManager.NetworkReachabilityStatus {
    
    public func scafReachabilityStatus() -> SCAFNetworkControllerReachabilityStatus {
        switch self {
        case .Unknown:
            return SCAFNetworkControllerReachabilityStatus.Unknown
        case .NotReachable:
            return SCAFNetworkControllerReachabilityStatus.Unreachable
        case .Reachable:
            return SCAFNetworkControllerReachabilityStatus.Reachable
        }
    }
    
}

public class SCAFAlamofireController: SCAFNetworkControllerNode {
    
    public lazy var manager: Manager = {
        let manager = Manager()
        manager.startRequestsImmediately = true
        return manager
    }()
    
    public lazy var reachabilityManager: NetworkReachabilityManager? = {
        if let reachabilityHost = self.reachabilityHost,
            let manager = NetworkReachabilityManager(host: reachabilityHost) {
            return manager
        }
        return nil
    }()
    
    override public var reachabilityStatus: SCAFNetworkControllerReachabilityStatus {
        if let reachability =  self.reachabilityManager?.networkReachabilityStatus {
            return reachability.scafReachabilityStatus()
        }
        return .Unknown
    }
    
    public required init(host: String, reachabilityHost: String?) {
        super.init(host: host, reachabilityHost: reachabilityHost)
    }
    
    public override func start() throws {
        do {
            self.reachabilityManager?.startListening()
            try super.start()
        } catch let error as NSError {
            // TODO: Log Error.
        }
    }
    
    public override func stop() throws {
        do {
            self.reachabilityManager?.stopListening()
            try super.stop()
        } catch let error as NSError {
            // TODO: Log Error.
        }
    }

}