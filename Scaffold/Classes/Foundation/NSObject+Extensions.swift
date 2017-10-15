//
//  NSObject+Extensions.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/2/16.
//
//

import Foundation

extension NSObject {
    
    /**
     The name of the class.
     
     @return The String name of the class.
     */
    public class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    /**
     The name of the class.
     
     @return The String name of the class.
     */
    public var className: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
    
}
