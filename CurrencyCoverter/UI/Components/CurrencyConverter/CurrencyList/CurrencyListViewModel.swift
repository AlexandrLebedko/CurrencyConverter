//
//  CurrencyListViewModel.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import ReactiveSwift

class CurrencyListViewModel: BaseViewModel {
    
    private var currencyService: ICurrencyService
    private var appSettings: IAppSettings
    
    let currencyListTableDataSource = MutableProperty<RTableViewDataSource?>(nil)
    let currencyChangedObserver = MutableProperty<String?>(nil)
    let filter = CurrencyFilter()
    private var _currencies: [Currency]?
    
    var currencies: [Currency] {
        guard let unwrappedCurrencies = _currencies else { return [] }
        guard let filterValue = filter.searchString.value, !filterValue.isEmpty else { return unwrappedCurrencies }
        return unwrappedCurrencies.filter {
            $0.symbol.lowercased().contains(filterValue.lowercased()) ||
            $0.name.lowercased().contains(filterValue.lowercased())
        }
    }
    
    init(currencyService: ICurrencyService, appSettings: IAppSettings) {
        self.currencyService = currencyService
        self.appSettings = appSettings
        
        super.init()
        
        filter.filterSignal.observeValues { [unowned self] in
            self.updateTableDataSource()
        }
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    func loadData() {
        onLoading(true)
        currencyService.getSupportedSymbols { [weak self] (result) in
            self?.onLoading(false)
            switch result {
            case let .success(currencies):
                self?._currencies = currencies
                self?.updateTableDataSource()
            case let .failure(error):
                self?.onErrorOccured(error: .apiError(error))
            }
        }
    }
    
    func select(currency: Currency) {
        onLoading(true)
        currencyService.changeBaseCurrency(newBaseCurrency: currency.symbol) { [weak self] (result) in
            self?.onLoading(false)
            switch result {
            case let .success(rates):
                self?.appSettings.baseCurrencySymbol = rates.base
                self?.currencyChangedObserver.value = rates.base
            case let .failure(error):
                self?.onErrorOccured(error: .apiError(error))
            }
        }
    }
    
    func filter(by: String?) {
        filter.searchString.value = by
    }
    
    private func updateTableDataSource() {
        currencyListTableDataSource.value = CurrencyListTableDataSource(currencies: currencies,
                                                                              baseCurrencySymbol: appSettings.baseCurrencySymbol)
    }
}
