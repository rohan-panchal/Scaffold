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
    
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var borderColor: CGColor? {
        get {
            return self.layer.borderColor
        }
        set {
            self.layer.borderColor = newValue
        }
    }
    
}

extension UIView {
    
    public class func view(frame: CGRect = CGRectZero,
                           translatesAutoresizingMaskIntoConstraints: Bool = false) -> UIView {
        
        let view = UIView(frame: frame)
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        return view
    }
    
}

extension UITextField {
    
    public class func textField(frame: CGRect = CGRectZero,
                                translatesAutoresizingMaskIntoConstraints: Bool = false,
                                text: String = "",
                                placeholder: String = "",
                                borderStyle: UITextBorderStyle = .RoundedRect,
                                textColor: UIColor = UIColor.blackColor(),
                                secureTextEntry: Bool = false) -> UITextField {
        
        let textField = UITextField(frame: frame)
        textField.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        textField.text = text
        textField.placeholder = placeholder
        textField.borderStyle = borderStyle
        textField.textColor = textColor
        textField.secureTextEntry = secureTextEntry
        
        return textField
    }
    
}
