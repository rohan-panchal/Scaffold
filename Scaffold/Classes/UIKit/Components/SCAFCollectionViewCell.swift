//
//  SCAFCollectionViewCell.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/12/16.
//
//

import UIKit

open class SCAFCollectionViewCell: UICollectionViewCell {
    
    open class func defaultReuseIdentifer() -> String {
        return self.className
    }
    
    open class func defaultHeight() -> CGFloat {
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

extension SCAFCollectionViewCell: UIScaffold {
    
    fileprivate func setup() {
        self.contentView.addSubviews(self.initialSubviews())
        self.setupConstraints(self.contentView)
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
    
    public func notificationNames() -> [String] {
        return []
    }
    
}
