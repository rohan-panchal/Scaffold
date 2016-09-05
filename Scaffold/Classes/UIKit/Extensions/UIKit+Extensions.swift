//
//  UIKit+Extensions.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/4/16.
//
//

import UIKit

extension UIView {
    
    public func addSubviews(views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
    
}
