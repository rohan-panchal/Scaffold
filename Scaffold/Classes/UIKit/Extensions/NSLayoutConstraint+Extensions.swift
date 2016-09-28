//
//  NSLayoutConstraint+Extensions.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/9/16.
//
//

import UIKit

public class NSLayoutConstraintBuilder: NSObject {
    
    var firstItem: AnyObject?
    var firstAttribute: NSLayoutAttribute?
    var relation: NSLayoutRelation?
    var secondItem: AnyObject?
    var secondAttribute: NSLayoutAttribute?
    var multiplier: CGFloat = 1.0
    var constant: CGFloat = 0.0
    
    public func firstItem(firstItem: AnyObject) -> NSLayoutConstraintBuilder {
        self.firstItem = firstItem
        return self
    }
    
    public func firstAttribute(attribute: NSLayoutAttribute) -> NSLayoutConstraintBuilder {
        self.firstAttribute = attribute
        return self
    }
    
    public func relatedBy(relation: NSLayoutRelation) -> NSLayoutConstraintBuilder {
        self.relation = relation
        return self
    }
    
    public func secondItem(secondItem: AnyObject) -> NSLayoutConstraintBuilder {
        self.secondItem = secondItem
        return self
    }
    
    public func secondAttribute(attribute: NSLayoutAttribute) -> NSLayoutConstraintBuilder {
        self.secondAttribute = attribute
        return self
    }
    
    public func multiplier(value: CGFloat) -> NSLayoutConstraintBuilder {
        self.multiplier = value
        return self
    }
    
    public func constant(value: CGFloat) -> NSLayoutConstraintBuilder {
        self.constant = value
        return self
    }
    
    public func constraint() -> NSLayoutConstraint? {
        
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
    public static func constrainSubViewToEqualFrames(superView: UIView,
                                                     subView: UIView) -> [NSLayoutConstraint] {
        let views = ["_superView": superView, "_subView": subView]
        var constraints: [NSLayoutConstraint] = []
        constraints.appendContentsOf(
            NSLayoutConstraint.constraintsWithVisualFormat("V:|[_subView]|",
                options: .AlignAllCenterX,
                metrics: nil,
                views: views))
        constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[_subView]|",
            options: .AlignAllCenterY,
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
    public static func constrainSubViewToCenterWithinSuperview(superView: UIView, subView: UIView) -> [NSLayoutConstraint] {
        let views = ["_superView": superView, "_subView": subView]
        var constraints: [NSLayoutConstraint] = []
        constraints.appendContentsOf(
            NSLayoutConstraint.constraintsWithVisualFormat("V:[_superView]-(<=1)-[_subView]",
                options: .AlignAllCenterX,
                metrics: nil,
                views: views))
        constraints.appendContentsOf(
            NSLayoutConstraint.constraintsWithVisualFormat("H:[_superView]-(<=1)-[_subView]",
                options: .AlignAllCenterY,
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
    public static func constrainToEqualHeights(firstView: UIView,
                                               secondView: UIView,
                                               multiplier: CGFloat,
                                               constant: CGFloat) -> NSLayoutConstraint {
        return constraintForEqualAttribute(firstView, secondView: secondView, attribute: .Height, multiplier: multiplier, constant: constant)
    }
    
    /**
     Creates an NSLayoutConstraint equating the Width attribute of both the first and second view with a multiplier and a constant.
     
     - parameter firstView:  A UIView.
     - parameter secondView: A UIView.
     - parameter multiplier: A CGFloat.
     - parameter constant:   A CGFloat.
     
     - returns: An NSLayoutConstraint object.
     */
    public static func constrainToEqualWidths(firstView: UIView,
                                              secondView: UIView,
                                              multiplier: CGFloat,
                                              constant: CGFloat) -> NSLayoutConstraint {
        return constraintForEqualAttribute(firstView, secondView: secondView, attribute: .Width, multiplier: multiplier, constant: constant)
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
    public static func constraintForEqualAttribute(firstView: UIView,
                                                   secondView: UIView,
                                                   attribute: NSLayoutAttribute,
                                                   multiplier: CGFloat,
                                                   constant: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: firstView,
                                  attribute: attribute,
                                  relatedBy: .Equal,
                                  toItem: secondView,
                                  attribute: attribute,
                                  multiplier: multiplier,
                                  constant: constant)
    }
    
}
