//
//  NSLayoutConstraint+Extensions.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/9/16.
//
//

import UIKit

open class NSLayoutConstraintBuilder: NSObject {
    
    var firstItem: AnyObject?
    var firstAttribute: NSLayoutAttribute?
    var relation: NSLayoutRelation?
    var secondItem: AnyObject?
    var secondAttribute: NSLayoutAttribute?
    var multiplier: CGFloat = 1.0
    var constant: CGFloat = 0.0
    
    open func firstItem(_ firstItem: AnyObject) -> NSLayoutConstraintBuilder {
        self.firstItem = firstItem
        return self
    }
    
    open func firstAttribute(_ attribute: NSLayoutAttribute) -> NSLayoutConstraintBuilder {
        self.firstAttribute = attribute
        return self
    }
    
    open func relatedBy(_ relation: NSLayoutRelation) -> NSLayoutConstraintBuilder {
        self.relation = relation
        return self
    }
    
    open func secondItem(_ secondItem: AnyObject) -> NSLayoutConstraintBuilder {
        self.secondItem = secondItem
        return self
    }
    
    open func secondAttribute(_ attribute: NSLayoutAttribute) -> NSLayoutConstraintBuilder {
        self.secondAttribute = attribute
        return self
    }
    
    open func multiplier(_ value: CGFloat) -> NSLayoutConstraintBuilder {
        self.multiplier = value
        return self
    }
    
    open func constant(_ value: CGFloat) -> NSLayoutConstraintBuilder {
        self.constant = value
        return self
    }
    
    open func constraint() -> NSLayoutConstraint? {
        
        guard let firstItem = self.firstItem,
            let firstAttribute = self.firstAttribute,
            let relation = self.relation,
            let secondItem = self.secondItem,
            let secondAttribute = self.secondAttribute else {
            
                return nil
        }
        return NSLayoutConstraint(item: firstItem,
                                  attribute: firstAttribute,
                                  relatedBy: relation,
                                  toItem: secondItem,
                                  attribute: secondAttribute,
                                  multiplier: self.multiplier,
                                  constant: self.constant)
    }
    
}

extension NSLayoutConstraint {
    
    public class func builder() -> NSLayoutConstraintBuilder {
        return NSLayoutConstraintBuilder()
    }
    
}

extension NSLayoutConstraint {
    
    /**
     Constrains a subview to be equal height and width to a superview.
     
     - parameter superView: A UIView object.
     - parameter subView:   A UIView object.
     
     - returns: An array of NSLayoutConstraints.
     */
    public static func constrainSubViewToEqualFrames(_ superView: UIView,
                                                     subView: UIView) -> [NSLayoutConstraint] {
        let views = ["_superView": superView, "_subView": subView]
        var constraints: [NSLayoutConstraint] = []
        constraints.append(
            contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[_subView]|",
                options: .alignAllCenterX,
                metrics: nil,
                views: views))
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[_subView]|",
            options: .alignAllCenterY,
            metrics: nil,
            views: views))
        return constraints
    }
    
    /**
     Constrains a subview's center to be equal to its superview.
     
     - parameter superView: A UIView object.
     - parameter subView:   A UIView object.
     
     - returns: An array of NSLayoutConstraints.
     */
    public static func constrainSubViewToCenterWithinSuperview(_ superView: UIView, subView: UIView) -> [NSLayoutConstraint] {
        let views = ["_superView": superView, "_subView": subView]
        var constraints: [NSLayoutConstraint] = []
        constraints.append(
            contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:[_superView]-(<=1)-[_subView]",
                options: .alignAllCenterX,
                metrics: nil,
                views: views))
        constraints.append(
            contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:[_superView]-(<=1)-[_subView]",
                options: .alignAllCenterY,
                metrics: nil,
                views: views))
        return constraints
    }
    
    /**
     Creates an NSLayoutConstraint equating the Height attribute of both the first and second view with a multiplier and a constant.
     
     - parameter firstView:  A UIView.
     - parameter secondView: A UIView.
     - parameter multiplier: A CGFloat.
     - parameter constant:   A CGFloat.
     
     - returns: An NSLayoutConstraint object.
     */
    public static func constrainToEqualHeights(_ firstView: UIView,
                                               secondView: UIView,
                                               multiplier: CGFloat,
                                               constant: CGFloat) -> NSLayoutConstraint {
        return constraintForEqualAttribute(firstView, secondView: secondView, attribute: .height, multiplier: multiplier, constant: constant)
    }
    
    /**
     Creates an NSLayoutConstraint equating the Width attribute of both the first and second view with a multiplier and a constant.
     
     - parameter firstView:  A UIView.
     - parameter secondView: A UIView.
     - parameter multiplier: A CGFloat.
     - parameter constant:   A CGFloat.
     
     - returns: An NSLayoutConstraint object.
     */
    public static func constrainToEqualWidths(_ firstView: UIView,
                                              secondView: UIView,
                                              multiplier: CGFloat,
                                              constant: CGFloat) -> NSLayoutConstraint {
        return constraintForEqualAttribute(firstView, secondView: secondView, attribute: .width, multiplier: multiplier, constant: constant)
    }
    
    /**
     Creates an NSLayoutConstraint equating a specific attribute of both the first and second view with a multiplier and a constant.
     
     - parameter firstView:  A UIView.
     - parameter secondView: A UIView.
     - parameter attribute:  An NSLayoutAttribute.
     - parameter multiplier: A CGFloat.
     - parameter constant:   A CGFloat.
     
     - returns: An NSLayoutConstraint object.
     */
    public static func constraintForEqualAttribute(_ firstView: UIView,
                                                   secondView: UIView,
                                                   attribute: NSLayoutAttribute,
                                                   multiplier: CGFloat,
                                                   constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: attribute,
                                  relatedBy: .equal,
                                  toItem: secondView,
                                  attribute: attribute,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    
}
