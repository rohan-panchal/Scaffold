//
//  SCAFCollectionReusableView.swift
//  Pods
//
//  Created by Panchal, Rohan on 9/19/16.
//
//

import UIKit

public class SCAFCollectionReusableView: UICollectionReusableView {
    
    public static func defaultReuseIdentifer() -> String {
        return self.className
    }
    
    public static func defaultHeight() -> CGFloat {
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
    
    private func setup() {
        self.addSubviews(self.initialSubviews())
        self.setupConstraints(self)
        self.setupActions()
        self.setupColorScheme()
        self.setLocalizedCopy()
    }
    
    public func initialSubviews() -> [UIView] {
        return []
    }
    
    public func setupConstraints(rootView: UIView) {
    }
    
    public func setupActions() {
    }
    
    public func setupColorScheme() {
    }
    
    public func setLocalizedCopy() {
    }
    
    @objc public func notificationHandler(notification: NSNotification) {
    }
    
    
}
