//
//  SCAFModularViewControllers.swift
//  Scaffold
//
//  Created by Panchal, Rohan on 9/6/16.
//
//

import UIKit

open class SCAFModularViewController: SCAFViewController {
    
    fileprivate lazy var longPressGestureRecognizer: UILongPressGestureRecognizer = {
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressDetected))
        gestureRecognizer.minimumPressDuration = self.longPressMinimumTimeInterval()
        gestureRecognizer.delaysTouchesBegan = true
        return gestureRecognizer
    }()
    
    open var topView: UIView!
    open var centerView: UIView!
    open var bottomView: UIView!
    
    fileprivate lazy var topViewTopSpacingConstraint: NSLayoutConstraint = {
        return NSLayoutConstraint(item: self.topView,
                                  attribute: .top,
                                  relatedBy: .equal,
                                  toItem: self.topLayoutGuide,
                                  attribute: .bottom,
                                  multiplier: 1.0,
                                  constant: 0.0)
    }()
    
    fileprivate lazy var topViewHeightConstraint: NSLayoutConstraint = {
        return NSLayoutConstraint(item: self.topView,
                                  attribute: .height,
                                  relatedBy: .equal,
                                  toItem: nil,
                                  attribute: .notAnAttribute,
                                  multiplier: 1.0,
                                  constant: self.initialTopViewHeight())
    }()
    
    fileprivate lazy var bottomViewHeightConstraint: NSLayoutConstraint = {
        return NSLayoutConstraint(item: self.bottomView,
                                  attribute: .height,
                                  relatedBy: .equal,
                                  toItem: nil,
                                  attribute: .notAnAttribute,
                                  multiplier: 1.0,
                                  constant: self.initialBottomViewHeight())
    }()
    
    open var topViewTopSpacing: CGFloat {
        get {
            return self.topViewTopSpacingConstraint.constant
        }
        set {
            self.topViewTopSpacingConstraint.constant = newValue
        }
    }
    
    open var topViewHeight: CGFloat {
        get {
            return self.topViewHeightConstraint.constant
        }
        set {
            self.topViewHeightConstraint.constant = newValue
        }
    }
    
    open var bottomViewHeight: CGFloat {
        get {
            return self.bottomViewHeightConstraint.constant
        }
        set {
            self.bottomViewHeightConstraint.constant = newValue
        }
    }
    
    override open func initialSubviews() -> [UIView] {
        self.edgesForExtendedLayout = UIRectEdge()
        self.centerView = self.setupCenterView()
        self.topView = self.setupTopView()
        self.bottomView = self.setupBottomView()
        return [self.centerView,
                self.topView,
                self.bottomView]
    }
    
    func setupTopView() -> UIView {
        return UIView.view()
    }
    
    open func initialTopViewHeight() -> CGFloat {
        return 0.0
    }
    
    open func setupCenterView() -> UIView {
        return UIView.view()
    }
    
    open func setupBottomView() -> UIView {
        return UIView.view()
    }
    
    open func initialBottomViewHeight() -> CGFloat {
        return 0.0
    }
    
    override open func setupConstraints(_ rootView: UIView) {
        super.setupConstraints(rootView)
        
        let views: [String: Any] = ["_centerView": self.centerView,
                                    "_topView": self.topView,
                                    "_bottomView": self.bottomView]
        
        self.centerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[_centerView]|",
            options: NSLayoutFormatOptions.alignmentMask,
            metrics: nil,
            views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[_topView]|",
            options: NSLayoutFormatOptions.alignmentMask,
            metrics: nil,
            views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[_bottomView]|",
            options: NSLayoutFormatOptions.alignmentMask,
            metrics: nil,
            views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[_topView][_centerView][_bottomView]|",
            options: NSLayoutFormatOptions.alignAllCenterX,
            metrics: nil,
            views: views))
        
        self.view.addConstraint(self.topViewTopSpacingConstraint)
        self.view.addConstraint(self.topViewHeightConstraint)
        self.view.addConstraint(self.bottomViewHeightConstraint)
    }
    
    override open func setupColorScheme() {
        self.centerView.backgroundColor = UIColor.groupTableViewBackground
    }
    
    override open func setupActions() {
        super.setupActions()
        
        if self.detectsLongPress() {
            self.centerView.addGestureRecognizer(self.longPressGestureRecognizer)
        }
    }
    
}

extension SCAFModularViewController {
    
    open func detectsLongPress() -> Bool {
        return false
    }
    
    open func longPressMinimumTimeInterval() -> CFTimeInterval {
        return 0.5
    }
    
    @objc fileprivate func longPressDetected(_ gestureRecognizer: UILongPressGestureRecognizer) {
    }
    
}

extension SCAFModularViewController {
    
    open func cellIdentifiers() -> [String:AnyClass] {
        return [:]
    }
    
}

open class SCAFTableViewController: SCAFModularViewController {
    
    open var tableView: UITableView!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCellIdentifiers(self.cellIdentifiers())
    }

    open override func setupCenterView() -> UIView {
        self.tableView = self.setupTableView()
        return self.tableView
    }
    
    func setupTableView() -> UITableView {
        return UITableView()
    }
    
    fileprivate func registerTableViewCellIdentifiers(_ identifiers: [String:AnyClass]) {
        for cellIdentifier in identifiers.keys {
            self.tableView.register(identifiers[cellIdentifier], forCellReuseIdentifier: cellIdentifier)
        }
    }
    
}

open class SCAFPlainTableViewController: SCAFTableViewController {
    
    override func setupTableView() -> UITableView {
        return UITableView(frame: self.view.frame, style: UITableViewStyle.plain)
    }
    
}

open class SCAFGroupedTableViewController: SCAFTableViewController {
    
    override func setupTableView() -> UITableView {
        return UITableView(frame: self.view.frame, style: UITableViewStyle.grouped)
    }
    
}

open class SCAFCollectionViewController: SCAFModularViewController {
    
    open var collectionView: UICollectionView!
    
    open func headerCellIdentifiers()-> [String: AnyClass]? {
        return nil
    }
    
    open func footerCellIdentifiers()-> [String: AnyClass]? {
        return nil
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCollectionViewCellIdentifiers(self.cellIdentifiers())
        if let headerCellIdentifiers = self.headerCellIdentifiers() {
            self.registerCollectionViewSupplementaryHeaderCellIdentifiers(headerCellIdentifiers)
        }
        if let footerCellIdentifiers = self.footerCellIdentifiers() {
            self.registerCollectionViewSupplementaryFooterCellIdentifiers(footerCellIdentifiers)
        }
    }
    
    open override func setupCenterView() -> UIView {
        self.collectionView = self.setupCollectionView()
        return self.collectionView
    }
    
    func setupCollectionView() -> UICollectionView {
        return UICollectionView(frame: CGRect.zero, collectionViewLayout: self.setupCollectionViewLayout())
    }
    
    fileprivate func registerCollectionViewCellIdentifiers(_ identifiers: [String:AnyClass]) {
        for cellIdentifier in identifiers.keys {
            self.collectionView.register(identifiers[cellIdentifier], forCellWithReuseIdentifier: cellIdentifier)
        }
    }
    
    fileprivate func registerCollectionViewSupplementaryHeaderCellIdentifiers(_ identifiers: [String:AnyClass]) {
        for cellIdentifier in identifiers.keys {
            self.collectionView.register(identifiers[cellIdentifier],
                                              forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                              withReuseIdentifier: cellIdentifier)
        }
    }
    
    fileprivate func registerCollectionViewSupplementaryFooterCellIdentifiers(_ identifiers: [String:AnyClass]) {
        for cellIdentifier in identifiers.keys {
            self.collectionView.register(identifiers[cellIdentifier],
                                              forSupplementaryViewOfKind: UICollectionElementKindSectionFooter,
                                              withReuseIdentifier: cellIdentifier)
        }
    }
    
    open func setupCollectionViewLayout() -> UICollectionViewLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        return layout
    }
    
}

extension SCAFCollectionViewController {
    
    fileprivate override func longPressDetected(_ gestureRecognizer: UILongPressGestureRecognizer) {
        let location: CGPoint = gestureRecognizer.location(in: self.collectionView)

        let indexPath = self.collectionView.indexPathForItem(at: location)
        
        if let index = indexPath,
            let cell = self.collectionView.cellForItem(at: index) {
            self.didLongPressOnCell(cell, atIndexPath: indexPath)
        }
    }
    
    open func didLongPressOnCell(_ cell: UICollectionViewCell?, atIndexPath indexPath: IndexPath?) {
        
    }
    
}
