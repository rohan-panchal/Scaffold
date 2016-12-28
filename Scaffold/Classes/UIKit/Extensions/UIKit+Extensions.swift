//
//  UIKit+Extensions.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/4/16.
//
//

import UIKit

let controlStates: [UIControlState] = [.highlighted, .disabled, .selected, .application, .reserved]

extension UIView {
    
    public func addSubviews(_ views: [UIView]) {
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
    
    public class func view(_ frame: CGRect = CGRect.zero,
                           translatesAutoresizingMaskIntoConstraints: Bool = false,
                           tintColor: UIColor = UIColor.black) -> Self {
        return viewGenerator(self,
                             frame: frame,
                             translatesAutoresizingMaskIntoConstraints: translatesAutoresizingMaskIntoConstraints,
                             tintColor: tintColor)
    }
    
    fileprivate class func viewGenerator<T: UIView>(_ type: T.Type,
                                     frame: CGRect = CGRect.zero,
                                     translatesAutoresizingMaskIntoConstraints: Bool = false,
                                     tintColor: UIColor = UIColor.black) -> T {
        let view = T(frame: frame)
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        view.tintColor = tintColor
        
        return view
    }
    
}

extension UIView {
    
    /**
     Cycles through the UIView's constraints and removes any which have the firstItem or the secondItem as the provided
     UIView.
     
     - parameter view: A UIView that any constraint associated with should be removed.
     */
    public func removeConstraintsWithView(_ view: UIView) {
        for constraint in self.constraints {
            if constraint.firstItem as! NSObject == view || constraint.secondItem as! NSObject == view {
                self.removeConstraint(constraint)
            }
        }
    }
    
    /**
     Animates a set of constraint changes.
     
     In reality, any set of changes to attributes of UI elements can be made within the changes closure but with the
     added benefit of calling `layoutIfNeeded` before and during the animation sequence.
     
     - parameter duration:   An NSTimeInterval representing the duration of the animation.
     - parameter delay:      An NSTimeInterval representing the delay before which the animation should execute.
     - parameter options:    A set of UIViewAnimationOptions for the animation to follow.
     - parameter changes:    A closure containing the attribute changes to be called during the animation.
     - parameter completion: A closure called upon completion of the animation, with a Bool as a parameter.
     */
    public func animateConstraintChanges(_ duration: TimeInterval = 0.25,
                                         delay: TimeInterval = 0.0,
                                         options: UIViewAnimationOptions = UIViewAnimationOptions(),
                                         changes: @escaping (() -> Void),
                                         completion: ((Bool) -> Void)?) {
        self.layoutIfNeeded()
        UIView.animate(withDuration: duration,
                                   delay: delay,
                                   options: options,
                                   animations: { [weak self] in
                                    changes()
                                    self?.layoutIfNeeded()
            }, completion: completion)
    }
    
}

extension UIButton {
    
    public class func button(_ frame: CGRect = CGRect.zero,
                             translatesAutoresizingMaskIntoConstraints: Bool = false,
                             buttonType: UIButtonType = .system,
                             title: String = "",
                             titleColor: UIColor = UIColor.black,
                             font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)) -> Self {
        return buttonGenerator(self,
                               frame: frame,
                               translatesAutoresizingMaskIntoConstraints: translatesAutoresizingMaskIntoConstraints,
                               buttonType: buttonType,
                               title: title,
                               titleColor: titleColor,
                               font: font)
    }
    
    fileprivate class func buttonGenerator<T: UIButton>(_ type: T.Type, frame: CGRect = CGRect.zero,
                                       translatesAutoresizingMaskIntoConstraints: Bool = false,
                                       buttonType: UIButtonType = .system,
                                       title: String = "",
                                       titleColor: UIColor = UIColor.black,
                                       font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)) -> T {
        let button = T(type: buttonType)
        button.frame = frame
        button.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        for controlState in controlStates {
            button.setTitle(title, for: controlState)
            button.setTitleColor(titleColor, for: controlState)
        }
        
        button.titleLabel?.font = font
        
        return button
    }
    
}

extension UIImageView {
    
    public class func imageView(_ frame: CGRect = CGRect.zero,
                                translatesAutoresizingMaskIntoConstraints: Bool = false,
                                image: UIImage? = nil) -> Self {
        return imageViewGenerator(self,
                                  frame: frame,
                                  translatesAutoresizingMaskIntoConstraints: translatesAutoresizingMaskIntoConstraints,
                                  image: image)
    }
    
    fileprivate class func imageViewGenerator<T: UIImageView>(_ type: T.Type,
                                          frame: CGRect = CGRect.zero,
                                          translatesAutoresizingMaskIntoConstraints: Bool = false,
                                          image: UIImage? = nil) -> T {
        let imageView = UIImageView(frame: frame)
        imageView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        imageView.image = image
        
        return imageView as! T
    }
    
}

extension UILabel {
    
    public class func label(_ frame: CGRect = CGRect.zero,
                            translatesAutoresizingMaskIntoConstraints: Bool = false,
                            tintColor: UIColor = UIColor.black,
                            text: String = "",
                            textColor: UIColor = UIColor.black,
                            textAlignment: NSTextAlignment = .left,
                            font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize),
                            numberOfLines: Int = 1) -> Self {
        return labelGenerator(self,
                              frame: frame,
                              translatesAutoresizingMaskIntoConstraints: translatesAutoresizingMaskIntoConstraints,
                              tintColor: tintColor,
                              text: text,
                              textColor: textColor,
                              textAlignment: textAlignment,
                              font: font,
                              numberOfLines: numberOfLines)
    }
    
    fileprivate class func labelGenerator<T: UILabel>(_ type: T.Type,
                                      frame: CGRect = CGRect.zero,
                                      translatesAutoresizingMaskIntoConstraints: Bool = false,
                                      tintColor: UIColor = UIColor.black,
                                      text: String = "",
                                      textColor: UIColor = UIColor.black,
                                      textAlignment: NSTextAlignment = .left,
                                      font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize),
                                      numberOfLines: Int = 1) -> T {
        let label = T(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        label.tintColor = tintColor
        
        label.text = text
        label.textColor = textColor
        label.textAlignment = textAlignment
        
        label.font = font
        label.numberOfLines = numberOfLines
        
        return label 
    }
    
}

extension UITextField {
    
    public class func textField(_ frame: CGRect = CGRect.zero,
                                translatesAutoresizingMaskIntoConstraints: Bool = false,
                                tintColor: UIColor = UIColor.black,
                                text: String = "",
                                placeholder: String = "",
                                font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize),
                                borderStyle: UITextBorderStyle = .roundedRect,
                                textColor: UIColor = UIColor.black,
                                secureTextEntry: Bool = false) -> Self {
        return textFieldGenerator(self,
                                  frame: frame,
                                  translatesAutoresizingMaskIntoConstraints: translatesAutoresizingMaskIntoConstraints,
                                  tintColor: tintColor,
                                  text: text,
                                  placeholder: placeholder,
                                  font: font,
                                  borderStyle: borderStyle,
                                  textColor: textColor, 
                                  secureTextEntry: secureTextEntry)

    }
    
    fileprivate class func textFieldGenerator<T: UITextField>(_ type: T.Type,
                                          frame: CGRect = CGRect.zero,
                                          translatesAutoresizingMaskIntoConstraints: Bool = false,
                                          tintColor: UIColor = UIColor.black,
                                          text: String = "",
                                          placeholder: String = "",
                                          font: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize),
                                          borderStyle: UITextBorderStyle = .roundedRect,
                                          textColor: UIColor = UIColor.black,
                                          secureTextEntry: Bool = false) -> T {
        let textField = T(frame: frame)
        textField.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        textField.tintColor = tintColor
        
        textField.text = text
        textField.placeholder = placeholder
        textField.font = font
        textField.borderStyle = borderStyle
        textField.textColor = textColor
        textField.isSecureTextEntry = secureTextEntry
        
        return textField 
    }
    
}
