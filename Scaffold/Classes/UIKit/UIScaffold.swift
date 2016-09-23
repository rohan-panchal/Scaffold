//
//  UIScaffold.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/4/16.
//
//

import UIKit

public protocol UIScaffold {
    
    func initialSubviews() -> [UIView]
    
    func setupConstraints(rootView: UIView)
    
    func setupActions()
    
    func setupColorScheme()
    
    func setLocalizedCopy()
    
    func notificationNames() -> [String]
    
    func notificationHandler(notification: NSNotification)
    
}

extension UIScaffold {
    
    public func notificationNames() -> [String] {
        return []
    }
    
}
