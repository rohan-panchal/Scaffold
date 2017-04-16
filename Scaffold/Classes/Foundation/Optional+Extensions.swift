//
//  Optional+Extensions.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/18/16.
//
//

import Foundation

extension Optional {
    
    /**
     A handler that executes if the wrapped value is non-nil.
     
     @param value: The wrapped value.
     */
    func doIfNonNil(_ value: Wrapped?, handler: ((_ value: Wrapped) -> Void)) {
        if let value = self {
            handler(value)
        }
    }
    
    var orNil : String {
        if self == nil {
            return "nil"
        }
        if "\(Wrapped.self)" == "String" {
            return "\"\(self!)\""
        }
        return "\(self!)"
    }
    
}

/**
 Executes a handler if the provided wrapped value is non-nil.
 
 @param value: A wrapped value.
 @param handler: A closure to execute with the provided value if it is non-nil.
 */
public func doIfNonNil<T>(_ value: T?, handler: ((_ value: T) -> Void)) {
    if let value = value {
        handler(value)
    }
}
