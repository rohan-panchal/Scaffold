//
//  SCAFViewController.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/4/16.
//
//

import UIKit

public class SCAFViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
}

extension SCAFViewController: UIScaffold {
    
    private func setup() {
        self.view.addSubviews(self.initialSubviews())
        self.setupConstraints(self.view)
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
