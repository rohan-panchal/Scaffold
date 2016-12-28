//
//  SCAFTableViewCell.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/6/16.
//
//

import UIKit

open class SCAFTableViewCell: UITableViewCell {
    
    open class func defaultReuseIdentifer() -> String {
        return self.className
    }
    
    open class func defaultHeight() -> CGFloat {
        return 44
    }
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
}

extension SCAFTableViewCell: UIScaffold {
    
    fileprivate func setup() {
        self.contentView.addSubviews(self.initialSubviews())
        self.setupConstraints(self.contentView)
        self.setupActions()
        self.setupColorScheme()
        self.setLocalizedCopy()
    }
    
    public func initialSubviews() -> [UIView] {
        return []
    }
    
    public func setupConstraints(_ rootView: UIView) {
    }
    
    public func setupActions() {
    }
    
    public func setupColorScheme() {
    }
    
    public func setLocalizedCopy() {
    }
    
    @objc public func notificationHandler(_ notification: Notification) {
    }
    
}
