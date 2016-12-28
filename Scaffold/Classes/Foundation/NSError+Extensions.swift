//
//  NSError+Extensions.swift
//  Pods
//
//  Created by Rohan Panchal on 10/16/16.
//
//

import Foundation

extension NSError {
    
    public class func error(_ domain: String,
                            code: Int,
                            localizedDescription: String? = nil,
                            localizedFailureReason: String? = nil,
                            localizedRecoverySuggestion: String? = nil,
                            localizedRecoveryOptions: [String]? = nil) -> NSError {
        var userInfoDict: [AnyHashable: Any] = [:]
        
        if let localizedDescription = localizedDescription {
            userInfoDict[NSLocalizedDescriptionKey] = localizedDescription
        }
        if let localizedFailureReason = localizedFailureReason {
            userInfoDict[NSLocalizedFailureReasonErrorKey] = localizedFailureReason
        }
        if let localizedRecoverySuggestion = localizedRecoverySuggestion {
            userInfoDict[NSLocalizedRecoverySuggestionErrorKey] = localizedRecoverySuggestion
        }
        if let localizedRecoveryOptions = localizedRecoveryOptions {
            userInfoDict[NSLocalizedRecoveryOptionsErrorKey] = localizedRecoveryOptions
        }
        
        return NSError(domain: domain, code: code, userInfo: userInfoDict)
    }
    
    public class func builder() -> NSErrorBuilder {
        return NSErrorBuilder()
    }
    
}

// MARK: - NSErrorBuilder

open class NSErrorBuilder {
    
    fileprivate var domain: String?
    fileprivate var code: Int?
    
    fileprivate var localizedDescription: String?
    fileprivate var localizedFailureReason: String?
    fileprivate var localizedRecoverySuggestion: String?
    fileprivate var localizedRecoveryOptions: [String]?
    
    public init() {
    }

    /**
     Generates an NSError object.
     
     @return An NSError object.
     */
    open func error() -> NSError? {
        
        guard let domain = self.domain else {
            NSLog("Invalid Error Domain")
            return nil
        }
        guard let code = self.code else {
            NSLog("Invalid Error Code")
            return nil
        }
        
        return NSError.error(domain,
                             code: code,
                             localizedDescription: self.localizedDescription,
                             localizedFailureReason: self.localizedFailureReason,
                             localizedRecoverySuggestion: self.localizedRecoverySuggestion,
                             localizedRecoveryOptions: self.localizedRecoveryOptions)
    }
    
}

extension NSErrorBuilder {
    
    /**
     Sets the domain string of the error.
     */
    public func setDomain(_ domain: String) -> NSErrorBuilder {
        self.domain = domain
        return self
    }
    
    /**
     Sets the code number of the error.
     */
    public func setCode(_ code: Int) -> NSErrorBuilder {
        self.code = code
        return self
    }
    
    /**
     Sets the localized description string of the error.
     */
    public func setLocalizedDescription(_ localizedDescription: String) -> NSErrorBuilder {
        self.localizedDescription = localizedDescription
        return self
    }
    
    /**
     Sets the localized failure reason string of the error.
     */
    public func setLocalizedFailureReason(_ localizedFailureReason: String) -> NSErrorBuilder {
        self.localizedFailureReason = localizedFailureReason
        return self
    }
    
    /**
     Sets the localized recovery suggestion string of the error.
     */
    public func setLocalizedRecoverySuggestion(_ localizedRecoverySuggestion: String) -> NSErrorBuilder {
        self.localizedRecoverySuggestion = localizedRecoverySuggestion
        return self
    }
    
    /**
     Sets the localized recovery options string array of the error.
     */
    public func setLocalizedRecoveryOptions(_ localizedRecoveryOptions: [String]) -> NSErrorBuilder {
        self.localizedRecoveryOptions = localizedRecoveryOptions
        return self
    }
    
}
