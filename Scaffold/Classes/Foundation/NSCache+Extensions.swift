//
//  NSCache+Extensions.swift
//  Pods
//
//  Created by Panchal, Rohan on 9/15/16.
//
//

import Foundation

extension NSCache {
    
    public subscript(key: AnyObject) -> AnyObject? {
        get {
            return objectForKey(key)
        }
        set {
            if let value: AnyObject = newValue {
                setObject(value, forKey: key)
            } else {
                removeObjectForKey(key)
            }
        }
    }
    
}