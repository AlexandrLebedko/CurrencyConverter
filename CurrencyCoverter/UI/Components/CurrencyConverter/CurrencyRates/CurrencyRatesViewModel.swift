//
//  CurrencyRatesViewModel.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyRatesViewModel {
    
    private var currencyService: ICurrencyService
    
    init(currencyService: ICurrencyService) {
        self.currencyService = currencyService
    }
    
    func loadData() {
        currencyService.getLatestRates(from: nil, to: nil, callback: { result in
            switch result {
            case let .success(currencyRates):
                let dataSource = CurrencyRatesTableDataSource(currencyRates: currencyRates)
            case let .failure(error):
                print("Error: ", error)
            }
        })
    }
}
