//
//  CurrencyRatesViewModel.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import ReactiveSwift

class CurrencyRatesViewModel {
    
    private var currencyService: ICurrencyService
    private var appSettings: IAppSettings
    let currencyTableDataSource = MutableProperty<RTableViewDataSource?>(nil)
    let baseCurrencySymbol = MutableProperty<String?>(nil)
    
    init(currencyService: ICurrencyService, appSettings: IAppSettings) {
        self.currencyService = currencyService
        self.appSettings = appSettings
    }
    
    func loadData() {
        currencyService.getLatestRates(from: appSettings.baseCurrencySymbol, to: nil, callback: { [weak self] result in
            switch result {
            case let .success(currencyRates):
                self?.currencyTableDataSource.value = CurrencyRatesTableDataSource(currencyRates: currencyRates.rates)
                self?.baseCurrencySymbol.value = currencyRates.base
                
                self?.appSettings.baseCurrencySymbol = currencyRates.base
            case let .failure(error):
                print("Error: ", error)
            }
        })
    }
    
    var baseCurrencyButtonImage: SignalProducer<UIImage?, Never> {
        return baseCurrencySymbol.producer.skipNil().map { UIImage(named: $0.lowercased()) }
    }
    
    var baseCurrencyButtonTitle: SignalProducer<String, Never> {
        return baseCurrencySymbol.producer.skipNil().map { $0.uppercased() }
    }
}
