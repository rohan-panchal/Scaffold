//
//  UIAlertController+Extensions.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/20/16.
//
//

import UIKit

extension UIAlertController {
    
    public class func actionSheetController(title: String?,
                                      message: String?,
                                      actions: [UIAlertAction]? = []) -> UIAlertController {
        return alertControllerGenerator(title,
                                        message: message,
                                        preferredStyle: .ActionSheet,
                                        actions: actions)
    }
    
    public class func alertController(title: String?,
                                message: String?,
                                actions: [UIAlertAction]? = []) -> UIAlertController {
        return alertControllerGenerator(title,
                                        message: message,
                                        preferredStyle: .Alert,
                                        actions: actions)
    }
    
    public class func alertControllerGenerator(title: String?,
                                message: String?,
                                preferredStyle: UIAlertControllerStyle = .Alert,
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