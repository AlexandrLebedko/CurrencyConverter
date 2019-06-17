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
}
