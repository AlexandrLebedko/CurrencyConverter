//
//  CurrencyListTableDataSource.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 18/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyListTableDataSource: RBaseTableViewDataSource, RTableViewDataSource {
    
    private var currencies: [Currency]
    private var baseCurrencySymbol: String?
    
    init(currencies: [Currency], baseCurrencySymbol: String?) {
        self.currencies = currencies.sorted(by: { $0.symbol < $1.symbol })
        self.baseCurrencySymbol = baseCurrencySymbol
    }
    
    var viewModels: [RTableViewCellModel]? {
        if _viewModels == nil {
            _viewModels = currencies
                .compactMap { CurrencyListTVCModel(currency: $0, isBase: $0.symbol == baseCurrencySymbol) }
        }
        
        return _viewModels
    }
    
    var cellTypes: [View] {
        return [View.currencyListTVC]
    }
    
    func cellTypeForObjectAt(indexPath: IndexPath) -> View {
        return View.currencyListTVC
    }
    
    func viewModelForObjectAt(indexPath: IndexPath) -> RTableViewCellModel? {
        return viewModels?[indexPath.row]
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return viewModels?.count ?? 0
    }
    
    func objectAt(indexPath: IndexPath) -> Any? {
        return currencies[indexPath.row]
    }
    
    func indexPathFor(object: Any) -> IndexPath? {
        return nil
    }
}
