//
//  CurrencyConvertVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyConvertViewModel {
    
    private var currencyService: ICurrencyService
    private var currencyRate: CurrencyRate
    
    init(currencyService: ICurrencyService, currencyRate: CurrencyRate) {
        self.currencyService = currencyService
        self.currencyRate = currencyRate
    }
}
