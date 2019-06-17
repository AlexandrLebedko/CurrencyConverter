//
//  View.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

public enum View: String {
    
    case currencyRateTVC = "CurrencyRateTVC"
    
    var className: String {
        let moduleName = NSStringFromClass(AppDelegate.self)
            .components(separatedBy: ".").first!
        return moduleName.appending(".").appending(rawValue)
    }
    
    var clazz: AnyClass? {
        switch self {
        default:
            return nil
        }
    }
    
    func instantiate() -> UINib? {
        return UINib(nibName: rawValue, bundle: nil)
    }
}

// MARK: - UITableView support

extension UITableView {
    
    func registerCells(_ views: [View]) {
        views.forEach { registerCell($0) }
    }
    
    func registerCell(_ view: View) {
        if let nib = view.instantiate() {
            register(nib, forCellReuseIdentifier: view.rawValue)
        } else if let clazz = view.clazz {
            register(clazz, forCellReuseIdentifier: view.rawValue)
        } else {
            fatalError("couldn't register cell \(self)")
        }
    }
    
    func registerHeaderFooter(_ view: View) {
        register(view.instantiate(), forHeaderFooterViewReuseIdentifier: view.rawValue)
    }
    
    func dequeueReusableCell(of view: View) -> UITableViewCell? {
        return dequeueReusableCell(withIdentifier: view.rawValue)
    }
    
    func dequeueReusableCell(of view: View, for indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: view.rawValue, for: indexPath)
    }
    
    func dequeueReusableHeaderFooter(of view: View) -> UITableViewHeaderFooterView? {
        return dequeueReusableHeaderFooterView(withIdentifier: view.rawValue)
    }
}

// MARK: - UICollectionView support

extension UICollectionView {
    
    func registerCells(_ views: [View]) {
        views.forEach { registerCell($0) }
    }
    
    func registerCell(_ view: View) {
        register(view.instantiate(), forCellWithReuseIdentifier: view.rawValue)
    }
    
    func dequeueReusableCell(of view: View, for indexPath: IndexPath) -> UICollectionViewCell? {
        return dequeueReusableCell(withReuseIdentifier: view.rawValue, for: indexPath)
    }
}
