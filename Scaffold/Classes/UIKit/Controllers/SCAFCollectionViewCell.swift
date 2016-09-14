//
//  SCAFCollectionViewCell.swift
//  Pods
//
//  Created by Rohan Panchal on 9/12/16.
//
//

import UIKit

public class SCAFCollectionViewCell: UICollectionViewCell {
    
    public class func defaultReuseIdentifer() -> String {
        return self.className
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
    
    private func setup() {
        self.contentView.addSubviews(self.initialSubviews())
        self.setupConstraints(self.contentView)
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
    
}

