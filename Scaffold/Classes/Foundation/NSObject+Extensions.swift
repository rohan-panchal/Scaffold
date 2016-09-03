//
//  NSObject+Extensions.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/2/16.
//
//

import Foundation

extension NSObject {
    
    public class var className: String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
    
    public var className: String {
        return NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
    }
    
}