//
//  SCAFAlamofireController.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/6/16.
//
//

import Alamofire

public class SCAFAlamofireController: SCAFNetworkControllerNode {
    
    private lazy var manager: Manager = {
        let manager = Manager()
        manager.startRequestsImmediately = true
        return manager
    }()
    
    private lazy var reachabilityManager: NetworkReachabilityManager? = {
        if let reachabilityHost = self.reachabilityHost,
            let manager = NetworkReachabilityManager(host: reachabilityHost) {
            return manager
        }
        return nil
    }()
    
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