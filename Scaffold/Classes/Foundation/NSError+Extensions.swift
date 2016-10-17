//
//  NSError+Extensions.swift
//  Pods
//
//  Created by Rohan Panchal on 10/16/16.
//
//

import Foundation

extension NSError {
    
    public class func error(domain: String,
                            code: Int,
                            localizedDescription: String? = nil,
                            localizedFailureReason: String? = nil,
                            localizedRecoverySuggestion: String? = nil) -> NSError {
        var userInfoDict: [NSObject: AnyObject] = [:]
        
        if let localizedDescription = localizedDescription {
            userInfoDict[NSLocalizedDescriptionKey] = localizedDescription
        }
        if let localizedFailureReason = localizedFailureReason {
            userInfoDict[NSLocalizedFailureReasonErrorKey] = localizedFailureReason
        }
        if let localizedRecoverySuggestion = localizedRecoverySuggestion {
            userInfoDict[NSLocalizedRecoverySuggestionErrorKey] = localizedRecoverySuggestion
        }
        
        return NSError(domain: domain, code: code, userInfo: userInfoDict)
    }
    
}