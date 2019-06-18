//
//  CurrencyRatesViewModel.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import ReactiveSwift

class CurrencyRatesViewModel: BaseViewModel {
    
    private var currencyService: ICurrencyService
    private var appSettings: IAppSettings
    private let filter = CurrencyFilter()
    let currencyTableDataSource = MutableProperty<RTableViewDataSource?>(nil)
    let baseCurrencySymbol = MutableProperty<String?>(nil)
    
    private var _currencyRates: [CurrencyRate]?
    
    var currencyRates: [CurrencyRate] {
        guard let unwrappedCurrencyRates = _currencyRates else { return [] }
        guard let filterValue = filter.searchString.value, !filterValue.isEmpty else { return unwrappedCurrencyRates }
        return unwrappedCurrencyRates.filter {
            $0.symbol.lowercased().contains(filterValue.lowercased())
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
        currencyService.getLatestRates(from: appSettings.baseCurrencySymbol, to: nil, callback: { [weak self] result in
            self?.onLoading(false)
            switch result {
            case let .success(currencyRates):
                self?._currencyRates = currencyRates.rates
                self?.updateTableDataSource()
                self?.baseCurrencySymbol.value = currencyRates.base
                self?.appSettings.baseCurrencySymbol = currencyRates.base
            case let .failure(error):
                self?.onErrorOccured(error: .apiError(error))
            }
        })
    }
    
    func filter(by: String?) {
        filter.searchString.value = by
    }
    
    var baseCurrencyButtonImage: SignalProducer<UIImage?, Never> {
        return baseCurrencySymbol.producer.skipNil().map { UIImage(named: $0.lowercased()) }
    }
    
    var baseCurrencyButtonTitle: SignalProducer<String, Never> {
        return baseCurrencySymbol.producer.skipNil().map { $0.uppercased() }
    }
    
    private func updateTableDataSource() {
        currencyTableDataSource.value = CurrencyRatesTableDataSource(currencyRates: currencyRates)
    }
}
