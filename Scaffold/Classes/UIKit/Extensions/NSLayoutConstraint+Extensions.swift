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
