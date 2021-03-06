//
//  UIKit+Extensions.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/4/16.
//
//

import UIKit

let controlStates: [UIControlState] = [.Normal, .Highlighted, .Disabled, .Selected, .Application, .Reserved]

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
                           translatesAutoresizingMaskIntoConstraints: Bool = false,
                           tintColor: UIColor = UIColor.blackColor()) -> Self {
        return viewGenerator(self,
                             frame: frame,
                             translatesAutoresizingMaskIntoConstraints: translatesAutoresizingMaskIntoConstraints,
                             tintColor: tintColor)
    }
    
    private class func viewGenerator<T: UIView>(type: T.Type,
                                     frame: CGRect = CGRectZero,
                                     translatesAutoresizingMaskIntoConstraints: Bool = false,
                                     tintColor: UIColor = UIColor.blackColor()) -> T {
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
    public func removeConstraintsWithView(view: UIView) {
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
    public func animateConstraintChanges(duration: NSTimeInterval = 0.25,
                                         delay: NSTimeInterval = 0.0,
                                         options: UIViewAnimationOptions = [.CurveEaseInOut],
                                         changes: (() -> Void),
                                         completion: ((Bool) -> Void)?) {
        self.layoutIfNeeded()
        UIView.animateWithDuration(duration,
                                   delay: delay,
                                   options: options,
                                   animations: { [weak self] in
                                    changes()
                                    self?.layoutIfNeeded()
            }, completion: completion)
    }
    
}

extension UIButton {
    
    public class func button(frame: CGRect = CGRectZero,
                             translatesAutoresizingMaskIntoConstraints: Bool = false,
                             buttonType: UIButtonType = .System,
                             title: String = "",
                             titleColor: UIColor = UIColor.blackColor(),
                             font: UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize())) -> Self {
        return buttonGenerator(self,
                               frame: frame,
                               translatesAutoresizingMaskIntoConstraints: translatesAutoresizingMaskIntoConstraints,
                               buttonType: buttonType,
                               title: title,
                               titleColor: titleColor,
                               font: font)
    }
    
    private class func buttonGenerator<T: UIButton>(type: T.Type, frame: CGRect = CGRectZero,
                                       translatesAutoresizingMaskIntoConstraints: Bool = false,
                                       buttonType: UIButtonType = .System,
                                       title: String = "",
                                       titleColor: UIColor = UIColor.blackColor(),
                                       font: UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize())) -> T {
        let button = T(type: buttonType)
        button.frame = frame
        button.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        
        for controlState in controlStates {
            button.setTitle(title, forState: controlState)
            button.setTitleColor(titleColor, forState: controlState)
        }
        
        button.titleLabel?.font = font
        
        return button
    }
    
}

extension UIImageView {
    
    public class func imageView(frame: CGRect = CGRectZero,
                                translatesAutoresizingMaskIntoConstraints: Bool = false,
                                image: UIImage? = nil) -> Self {
        return imageViewGenerator(self,
                                  frame: frame,
                                  translatesAutoresizingMaskIntoConstraints: translatesAutoresizingMaskIntoConstraints,
                                  image: image)
    }
    
    private class func imageViewGenerator<T: UIImageView>(type: T.Type,
                                          frame: CGRect = CGRectZero,
                                          translatesAutoresizingMaskIntoConstraints: Bool = false,
                                          image: UIImage? = nil) -> T {
        let imageView = UIImageView(frame: frame)
        imageView.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        imageView.image = image
        
        return imageView as! T
    }
    
}

extension UILabel {
    
    public class func label(frame: CGRect = CGRectZero,
                            translatesAutoresizingMaskIntoConstraints: Bool = false,
                            tintColor: UIColor = UIColor.blackColor(),
                            text: String = "",
                            textColor: UIColor = UIColor.blackColor(),
                            textAlignment: NSTextAlignment = .Left,
                            font: UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize()),
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
    
    private class func labelGenerator<T: UILabel>(type: T.Type,
                                      frame: CGRect = CGRectZero,
                                      translatesAutoresizingMaskIntoConstraints: Bool = false,
                                      tintColor: UIColor = UIColor.blackColor(),
                                      text: String = "",
                                      textColor: UIColor = UIColor.blackColor(),
                                      textAlignment: NSTextAlignment = .Left,
                                      font: UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize()),
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
    
    public class func textField(frame: CGRect = CGRectZero,
                                translatesAutoresizingMaskIntoConstraints: Bool = false,
                                tintColor: UIColor = UIColor.blackColor(),
                                text: String = "",
                                placeholder: String = "",
                                font: UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize()),
                                borderStyle: UITextBorderStyle = .RoundedRect,
                                textColor: UIColor = UIColor.blackColor(),
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
    
    private class func textFieldGenerator<T: UITextField>(type: T.Type,
                                          frame: CGRect = CGRectZero,
                                          translatesAutoresizingMaskIntoConstraints: Bool = false,
                                          tintColor: UIColor = UIColor.blackColor(),
                                          text: String = "",
                                          placeholder: String = "",
                                          font: UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize()),
                                          borderStyle: UITextBorderStyle = .RoundedRect,
                                          textColor: UIColor = UIColor.blackColor(),
                                          secureTextEntry: Bool = false) -> T {
        let textField = T(frame: frame)
        textField.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        textField.tintColor = tintColor
        
        textField.text = text
        textField.placeholder = placeholder
        textField.font = font
        textField.borderStyle = borderStyle
        textField.textColor = textColor
        textField.secureTextEntry = secureTextEntry
        
        return textField 
    }
    
}
