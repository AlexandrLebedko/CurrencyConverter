//
//  CurrencyListViewModel.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import ReactiveSwift

class CurrencyListViewModel {
    
    private var currencyService: ICurrencyService
    private var appSettings: IAppSettings
    
    let currencyListTableDataSource = MutableProperty<RTableViewDataSource?>(nil)
    let currencyChangedObserver = MutableProperty<String?>(nil)
    
    init(currencyService: ICurrencyService, appSettings: IAppSettings) {
        self.currencyService = currencyService
        self.appSettings = appSettings
    }
    
    func loadData() {
        currencyService.getSupportedSymbols { [weak self] (result) in
            switch result {
            case let .success(currencies):
                self?.currencyListTableDataSource.value = CurrencyListTableDataSource(currencies: currencies,
                                                                                      baseCurrencySymbol: self?.appSettings.baseCurrencySymbol)
            case let .failure(error):
                print("Error", error)
            }
        }
    }
    
    func select(currency: Currency) {
        currencyService.changeBaseCurrency(newBaseCurrency: currency.symbol) { [weak self] (result) in
            switch result {
            case let .success(rates):
                self?.appSettings.baseCurrencySymbol = rates.base
                self?.currencyChangedObserver.value = rates.base
            case let .failure(error):
                print("Error: ", error)
            }
        }
    }
}
