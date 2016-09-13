//
//  SCAFViewController.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/4/16.
//
//

import UIKit

public class SCAFViewController: UIViewController {
    
    public var hidesNavigationBar: Bool {
        return false
    }
    
    public var hideNavigationBackButton: Bool {
        return false
    }
    
    public var progressNavigationController: SCAFProgressNavigationController? {
        guard let navigationController = self.navigationController as? SCAFProgressNavigationController else {
            return nil
        }
        return navigationController
    }
    
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
        
        self.setupControllerCustomization()
    }
    
    public func initialSubviews() -> [UIView] {
        return []
    }
    
    private func setupControllerCustomization() {
        self.navigationController?.setNavigationBarHidden(self.hidesNavigationBar, animated: true)
        self.navigationItem.hidesBackButton = self.hideNavigationBackButton
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
