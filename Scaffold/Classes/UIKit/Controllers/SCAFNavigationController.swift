//
//  SCAFNavigationController.swift
//  Scaffold
//
//  Created by Rohan Panchal on 9/4/16.
//
//

import UIKit

public class SCAFNavigationController: UINavigationController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        if let initialViewControllers = self.initialViewControllers() {
            self.setViewControllers(initialViewControllers, animated: false)
        }
    }
    
    public func initialViewControllers() -> [UIViewController]? {
        return []
    }
    
}

public class SCAFProgressNavigationController: SCAFNavigationController {
    
    public lazy var progressView: UIProgressView = UIProgressView(progressViewStyle: .Bar)
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addProgressView()
    }
    
}

extension SCAFProgressNavigationController {
    
    private func addProgressView() {
        self.view.addSubview(self.progressView)
        
        let navBar = self.navigationBar
        
        self.view.addConstraint(
            NSLayoutConstraint(item: self.progressView,
                attribute: .Bottom,
                relatedBy: .Equal,
                toItem: navBar,
                attribute: .Bottom,
                multiplier: 1,
                constant: -0.5))
        
        self.view.addConstraint(
            NSLayoutConstraint(item: self.progressView,
                attribute: .Left,
                relatedBy: .Equal,
                toItem: navBar,
                attribute: .Left,
                multiplier: 1,
                constant: -0.5))
        
        self.view.addConstraint(
            NSLayoutConstraint(item: self.progressView,
                attribute: .Right,
                relatedBy: .Equal,
                toItem: navBar,
                attribute: .Right,
                multiplier: 1,
                constant: -0.5))
        
        self.progressView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func setProgress(progress: Float, animated: Bool = true, completion: (() -> Void)? = nil) {
        dispatch_async(dispatch_get_main_queue()) {
            
            let progressDifference = abs(progress - self.progressView.progress)
            let newDuration = NSTimeInterval(progressDifference * 1.0)
            
            self.progressView.progress = progress
            if animated {
                UIView.animateWithDuration(newDuration,
                                           delay: 0.0,
                                           options: UIViewAnimationOptions.CurveEaseInOut,
                                           animations: {
                                            self.progressView.layoutIfNeeded()
                    },
                                           completion: { (complete) in
                                            completion?()
                })
            }
        }
    }
    
    public func resetProgress(animated: Bool = false) {
        self.setProgress(0.0, animated: animated)
    }
    
    public func progressAnimationBlock(resetOnCompletion: Bool = true,
                                       work: ((updateProgress: ((progress: Float) -> Void), reset: (() -> Void)) -> Void),
                                       completion: (() -> Void)) {
        
        work(updateProgress: { (progress) in
            self.setProgress(progress, animated: true, completion: {
                if progress == 1.0 {
                    
                    //Adds a delay after progress bar is filled to call completion().
                    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.25 * Double(NSEC_PER_SEC)))
                    dispatch_after(delayTime, dispatch_get_main_queue(), {
                        completion()
                        if resetOnCompletion {
                            self.resetProgress()
                        }
                    })
                }
            })
        }) {
            self.resetProgress()
        }
        
    }
    
}
