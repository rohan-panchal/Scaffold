//
//  SCAFFoundation.swift
//  Pods
//
//  Created by Rohan Panchal on 9/26/16.
//
//

import Foundation

public struct Platform {
    
    public static var iPhone: Bool {
        return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Phone
    }
    
    public static var iPad: Bool {
        return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.Pad
    }
    
    public static var iOS: Bool {
        return TARGET_OS_IOS != 0
    }
    
    public static var TVOS: Bool {
        return TARGET_OS_TV != 0
    }
    
    public static var WatchOS: Bool {
        return TARGET_OS_WATCH != 0
    }
    
    public static var Simulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
    
}

