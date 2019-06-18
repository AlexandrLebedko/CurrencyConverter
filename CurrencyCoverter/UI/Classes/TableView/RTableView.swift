//
//  RTableView.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit
import ReactiveSwift

open class RTableView: UITableView {
    
    private lazy var rControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.gray
        
        return refreshControl
    }()
    
    @objc var handleRefresh: HandleRefreshAction? {
        didSet {
            self.refreshControl = rControl
        }
    }
    @objc private func refresh() {
        handleRefresh?()
    }
    
    private var _adapter: RTableViewAdapter?
    var adapter: RTableViewAdapter {
        get {
            if let existsAdapter = _adapter { return existsAdapter }
            let newValue = RTableViewAdapter()
            initialize(adapter: newValue)
            _adapter = newValue
            return newValue
        }
        
        set {
            initialize(adapter: newValue)
            _adapter = newValue
        }
    }
    
    private func initialize(adapter: RTableViewAdapter) {
        if let dataSource = adapter.dataSource {
            registerCells(dataSource.cellTypes)
        }
        
        delegate = adapter
        dataSource = adapter
        
        tableFooterView = UIView(frame: .zero)
    }
    
    func set(dataSource: RTableViewDataSource?) {
        guard let ds = dataSource else { return }
        registerCells(ds.cellTypes)
        adapter.dataSource = ds
        
        reloadData()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension Reactive where Base: RTableView {
    
    public var rDataSource: BindingTarget<RTableViewDataSource?> {
        return makeBindingTarget { (tableView, u) in
            if u != nil {
                tableView.set(dataSource: u)
            }
        }
    }
}
