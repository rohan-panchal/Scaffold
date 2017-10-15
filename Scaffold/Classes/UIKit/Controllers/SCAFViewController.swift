//
//  SCAFViewController.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/4/16.
//
//

import UIKit

open class SCAFViewController: UIViewController {
    
    open var hidesNavigationBar: Bool {
        return false
    }
    
    open var hideNavigationBackButton: Bool {
        return false
    }
    
    open var progressNavigationController: SCAFProgressNavigationController? {
        guard let navigationController = self.navigationController as? SCAFProgressNavigationController else {
            return nil
        }
        return navigationController
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension SCAFViewController: UIScaffold {
    
    fileprivate func setup() {
        self.view.addSubviews(self.initialSubviews())
        self.setupConstraints(self.view)
        self.setupActions()
        self.setupColorScheme()
        self.setLocalizedCopy()
        
        self.setupControllerCustomization()
        
        self.setupNotificationObservers()
    }
    
    fileprivate func setupNotificationObservers() {
        for notificationName in self.notificationNames() {
            NotificationCenter.default.addObserver(self, selector: #selector(notificationHandler), name: NSNotification.Name(rawValue: notificationName), object: nil)
        }
    }
    
    fileprivate func setupControllerCustomization() {
        self.navigationController?.setNavigationBarHidden(self.hidesNavigationBar, animated: true)
        self.navigationItem.hidesBackButton = self.hideNavigationBackButton
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
    
    open func notificationNames() -> [String] {
        return []
    }
    
    @objc open func notificationHandler(_ notification: Notification) {
    }
    
}
