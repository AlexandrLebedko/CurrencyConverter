//
//  CurrencyListTableDataSource.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyRatesTableDataSource: RBaseTableViewDataSource, RTableViewDataSource {
    
    private var currencyRates: [CurrencyRate]
    
    init(currencyRates: [CurrencyRate]) {
        self.currencyRates = currencyRates
    }
    
    var viewModels: [RTableViewCellModel]? {
        if _viewModels == nil {
            _viewModels = currencyRates.compactMap { CurrencyRateTVCModel(currencyRate: $0) }
        }
        
        return _viewModels
    }
    
    var cellTypes: [View] {
        return [View.currencyRateTVC]
    }
    
    func cellTypeForObjectAt(indexPath: IndexPath) -> View {
        return View.currencyRateTVC
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
        return currencyRates[indexPath.row]
    }
    
    func indexPathFor(object: Any) -> IndexPath? {
        return nil
    }
}
