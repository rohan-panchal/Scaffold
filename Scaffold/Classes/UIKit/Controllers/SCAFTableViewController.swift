//
//  SCAFTableViewController.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/6/16.
//
//

import UIKit

public class SCAFTableViewController: SCAFViewController {
    
    public var tableView: UITableView!
    public var topView: UIView!
    public var bottomView: UIView!
    
    private lazy var topViewTopSpacingConstraint: NSLayoutConstraint = {
        return NSLayoutConstraint(item: self.topView,
                                  attribute: .TopMargin,
                                  relatedBy: .Equal,
                                  toItem: self.topLayoutGuide,
                                  attribute: .BottomMargin,
                                  multiplier: 1.0,
                                  constant: 0.0)
    }()
    
    private lazy var topViewHeightConstraint: NSLayoutConstraint = {
        return NSLayoutConstraint(item: self.topView,
                                  attribute: .Height,
                                  relatedBy: .Equal,
                                  toItem: nil,
                                  attribute: .NotAnAttribute,
                                  multiplier: 1.0,
                                  constant: self.initialTopViewHeight())
    }()
    
    private lazy var bottomViewHeightConstraint: NSLayoutConstraint = {
        return NSLayoutConstraint(item: self.bottomView,
                                  attribute: .Height,
                                  relatedBy: .Equal,
                                  toItem: nil,
                                  attribute: .NotAnAttribute,
                                  multiplier: 1.0,
                                  constant: self.initialBottomViewHeight())
    }()
    
    public var topViewTopSpacing: CGFloat {
        get {
            return self.topViewTopSpacingConstraint.constant
        }
        set {
            self.topViewTopSpacingConstraint.constant = newValue
        }
    }
    
    public var topViewHeight: CGFloat {
        get {
            return self.topViewHeightConstraint.constant
        }
        set {
            self.topViewHeightConstraint.constant = newValue
        }
    }
    
    public var bottomViewHeight: CGFloat {
        get {
            return self.bottomViewHeightConstraint.constant
        }
        set {
            self.bottomViewHeightConstraint.constant = newValue
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCellIdentifiers(self.tableViewCellIdentifiers())
    }
    
    override public func initialSubviews() -> [UIView] {
        self.edgesForExtendedLayout = UIRectEdge.None
        self.tableView = self.setupTableView()
        self.topView = self.setupTopView()
        self.bottomView = self.setupBottomView()
        return [self.tableView,
                self.topView,
                self.bottomView]
    }
    
    func setupTableView() -> UITableView {
        return UITableView()
    }
    
    func setupTopView() -> UIView {
        return UIView.view()
    }
    
    public func initialTopViewHeight() -> CGFloat {
        return 0.0
    }
    
    public func setupBottomView() -> UIView {
        return UIView.view()
    }
    
    public func initialBottomViewHeight() -> CGFloat {
        return 0.0
    }
    
    public func tableViewCellIdentifiers() -> [String:AnyClass] {
        return [:]
    }
    
    private func registerTableViewCellIdentifiers(identifiers: [String:AnyClass]) {
        for cellIdentifier in identifiers.keys {
            self.tableView.registerClass(identifiers[cellIdentifier], forCellReuseIdentifier: cellIdentifier)
        }
    }
    
    override public func setupConstraints(rootView: UIView) {
        super.setupConstraints(rootView)
        
        let views = ["_tableView": self.tableView,
                     "_topView": self.topView,
                     "_bottomView": self.bottomView]
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[_tableView]|",
            options: NSLayoutFormatOptions.AlignmentMask,
            metrics: nil,
            views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[_topView]|",
            options: NSLayoutFormatOptions.AlignmentMask,
            metrics: nil,
            views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[_bottomView]|",
            options: NSLayoutFormatOptions.AlignmentMask,
            metrics: nil,
            views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[_topView][_tableView][_bottomView]|",
            options: NSLayoutFormatOptions.AlignAllCenterX,
            metrics: nil,
            views: views))
        
        self.view.addConstraint(self.topViewTopSpacingConstraint)
        self.view.addConstraint(self.topViewHeightConstraint)
        self.view.addConstraint(self.bottomViewHeightConstraint)
    }
    
    override public func setupColorScheme() {
        self.tableView.backgroundColor = UIColor.groupTableViewBackgroundColor()
    }
    
}

public class SCAFPlainTableViewController: SCAFTableViewController {
    
    override func setupTableView() -> UITableView {
        return UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
    }
    
}

public class SCAFGroupedTableViewController: SCAFTableViewController {
    
    override func setupTableView() -> UITableView {
        return UITableView(frame: self.view.frame, style: UITableViewStyle.Grouped)
    }
    
}
