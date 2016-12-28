//
//  Optional+Extensions.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/18/16.
//
//

import Foundation

extension Optional {
    
    func doIfNonNil(_ value: Wrapped?, handler: ((_ value: Wrapped) -> Void)) {
        if let value = self {
            handler(value)
        }
    }
    
}

public func doIfNonNil<T>(_ value: T?, handler: ((_ value: T) -> Void)) {
    if let value = value {
        handler(value)
    }
}
