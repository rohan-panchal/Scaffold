//
//  SCAFCollectionReusableView.swift
//  Pods
//
//  Created by Panchal, Rohan on 9/19/16.
//
//

import UIKit

open class SCAFCollectionReusableView: UICollectionReusableView {
    
    open static func defaultReuseIdentifer() -> String {
        return self.className
    }
    
    open static func defaultHeight() -> CGFloat {
        return 44
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
}

extension SCAFCollectionReusableView: UIScaffold {
    
    fileprivate func setup() {
        self.addSubviews(self.initialSubviews())
        self.setupConstraints(self)
        self.setupActions()
        self.setupColorScheme()
        self.setLocalizedCopy()
    }
    
    open func initialSubviews() -> [UIView] {
        return []
    }
    
    open func setupConstraints(_ rootView: UIView) {
    }
    
    open func setupActions() {
    }
    
    open func setupColorScheme() {
    }
    
    open func setLocalizedCopy() {
    }
    
    @objc open func notificationHandler(_ notification: Notification) {
    }
    
    
}
