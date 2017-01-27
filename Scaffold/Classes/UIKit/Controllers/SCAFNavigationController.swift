//
//  SCAFNavigationController.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/4/16.
//
//

import UIKit

open class SCAFNavigationController: UINavigationController {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        if let initialViewControllers = self.initialViewControllers() {
            self.setViewControllers(initialViewControllers, animated: false)
        }
    }
    
    open func initialViewControllers() -> [UIViewController]? {
        return []
    }
    
}

open class SCAFProgressNavigationController: SCAFNavigationController {
    
    open lazy var progressView: UIProgressView = UIProgressView(progressViewStyle: .bar)
    
    open var isUpdatingProgress: Bool {
        get {
            return self.updatingProgress
        }
    }
    
    fileprivate var updatingProgress: Bool = false
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addProgressView()
    }
    
}

extension SCAFProgressNavigationController {
    
    public func cancelProgressUpdate() {
        self.resetProgress()
    }
    
}

extension SCAFProgressNavigationController {
    
    fileprivate func addProgressView() {
        self.view.addSubview(self.progressView)
        
        let navBar = self.navigationBar
        
        self.view.addConstraint(
            NSLayoutConstraint(item: self.progressView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: navBar,
                attribute: .bottom,
                multiplier: 1,
                constant: -0.5))
        
        self.view.addConstraint(
            NSLayoutConstraint(item: self.progressView,
                attribute: .left,
                relatedBy: .equal,
                toItem: navBar,
                attribute: .left,
                multiplier: 1,
                constant: -0.5))
        
        self.view.addConstraint(
            NSLayoutConstraint(item: self.progressView,
                attribute: .right,
                relatedBy: .equal,
                toItem: navBar,
                attribute: .right,
                multiplier: 1,
                constant: -0.5))
        
        self.progressView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func setProgress(_ progress: Float, animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            
            let progressDifference = abs(progress - self.progressView.progress)
            let newDuration = TimeInterval(progressDifference * 1.0)
            
            self.progressView.progress = progress
            if animated {
                UIView.animate(withDuration: newDuration,
                                           delay: 0.0,
                                           options: UIViewAnimationOptions(),
                                           animations: {
                                            self.progressView.layoutIfNeeded()
                    },
                                           completion: { (complete) in
                                            completion?()
                })
            }
        }
    }
    
    public func resetProgress(_ animated: Bool = false) {
        self.setProgress(0.0, animated: animated)
        self.updatingProgress = false
    }
    
    public func progressAnimationBlock(_ resetOnCompletion: Bool = true,
                                       work: ((_ updateProgress: @escaping ((_ progress: Float) -> Void), @escaping  _ reset: (() -> Void)) -> Void),
                                       completion: @escaping (() -> Void)) {
        
        self.updatingProgress = true
        
        work({ (progress) in
            
            if self.isUpdatingProgress {
                self.setProgress(progress, animated: true, completion: {
                    if progress == 1.0 {
                        
                        //Adds a delay after progress bar is filled to call completion().
                        let delayTime = DispatchTime.now() + Double(Int64(0.25 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
                            completion()
                            if resetOnCompletion {
                                self.resetProgress()
                            }
                        })
                    }
                })
            }
            
        }) {
            self.resetProgress()
        }
        
    }
    
}

extension SCAFProgressNavigationController {
    
    open override func popViewController(animated: Bool) -> UIViewController? {
        self.resetProgress()
        return super.popViewController(animated: animated)
    }
    
    open override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        self.resetProgress()
        return super.popToRootViewController(animated: animated)
    }
    
    open override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        self.resetProgress()
        return super.popToViewController(viewController, animated: animated)
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.resetProgress()
        super.pushViewController(viewController, animated: animated)
    }
    
}
