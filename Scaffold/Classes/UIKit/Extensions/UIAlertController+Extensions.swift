//
//  UIAlertController+Extensions.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/20/16.
//
//

import UIKit

extension UIAlertController {
    
    public class func actionSheetController(_ title: String?,
                                      message: String?,
                                      actions: [UIAlertAction]? = []) -> UIAlertController {
        return alertControllerGenerator(title,
                                        message: message,
                                        preferredStyle: .actionSheet,
                                        actions: actions)
    }
    
    public class func alertController(_ title: String?,
                                message: String?,
                                actions: [UIAlertAction]? = []) -> UIAlertController {
        return alertControllerGenerator(title,
                                        message: message,
                                        preferredStyle: .alert,
                                        actions: actions)
    }
    
    public class func alertControllerGenerator(_ title: String?,
                                message: String?,
                                preferredStyle: UIAlertControllerStyle = .alert,
                                actions: [UIAlertAction]? = []) -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        if let actions = actions {
            for action in actions {
                controller.addAction(action)
            }
        }
        
        return controller
    }
    
}
