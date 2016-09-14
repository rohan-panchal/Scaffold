//
//  SCAFView.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/14/16.
//
//

import UIKit

public class SCAFView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
}

extension SCAFView: UIScaffold {
    
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
    
}
