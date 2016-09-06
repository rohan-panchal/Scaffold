//
//  UIKit+Extensions.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/4/16.
//
//

import UIKit

extension UIView {
    
    public class func view(frame: CGRect = CGRectZero) -> UIView {
        let view = UIView(frame: frame)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
}

extension UIView {
    
    public func addSubviews(views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
    
}
