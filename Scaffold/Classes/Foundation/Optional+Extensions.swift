//
//  Optional+Extensions.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/18/16.
//
//

import Foundation

extension Optional {
    
    func doIfNonNil(value: Wrapped?, handler: ((value: Wrapped) -> Void)) {
        if let value = self {
            handler(value: value)
        }
    }
    
}

public func doIfNonNil<T>(value: T?, handler: ((value: T) -> Void)) {
    if let value = value {
        handler(value: value)
    }
}
