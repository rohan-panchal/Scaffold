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
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
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
        
        self.setupNotificationObservers()
    }
    
    private func setupNotificationObservers() {
        for notificationName in self.notificationNames() {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(notificationHandler), name: notificationName, object: nil)
        }
    }
    
    private func setupControllerCustomization() {
        self.navigationController?.setNavigationBarHidden(self.hidesNavigationBar, animated: true)
        self.navigationItem.hidesBackButton = self.hideNavigationBackButton
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
    
    public func notificationNames() -> [String] {
        return []
    }
    
    @objc public func notificationHandler(notification: NSNotification) {
    }
    
}
