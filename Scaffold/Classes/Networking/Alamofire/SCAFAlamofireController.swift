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
        case .unknown:
            return SCAFNetworkControllerReachabilityStatus.unknown
        case .notReachable:
            return SCAFNetworkControllerReachabilityStatus.unreachable
        case .reachable:
            return SCAFNetworkControllerReachabilityStatus.reachable
        }
    }
    
}

open class SCAFAlamofireController: SCAFNetworkControllerNode {
    
    open lazy var manager: SessionManager = {
        let manager = SessionManager()
        manager.startRequestsImmediately = true
        return manager
    }()
    
    open lazy var reachabilityManager: NetworkReachabilityManager? = {
        if let reachabilityHost = self.reachabilityHost,
            let manager = NetworkReachabilityManager(host: reachabilityHost) {
            return manager
        }
        return nil
    }()
    
    override open var reachabilityStatus: SCAFNetworkControllerReachabilityStatus {
        if let reachability =  self.reachabilityManager?.networkReachabilityStatus {
            return reachability.scafReachabilityStatus()
        }
        return .unknown
    }
    
    public required init(host: String, reachabilityHost: String?) {
        super.init(host: host, reachabilityHost: reachabilityHost)
    }
    
    open override func start() throws {
        do {
            self.reachabilityManager?.startListening()
            try super.start()
        } catch let error as NSError {
            NSLog(error.description)
        }
    }
    
    open override func stop() throws {
        do {
            self.reachabilityManager?.stopListening()
            try super.stop()
        } catch let error as NSError {
            NSLog(error.description)
        }
    }

}
