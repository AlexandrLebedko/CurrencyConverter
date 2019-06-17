//
//  CurrencyRatesDTOParser.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyRatesDTOParser {
    
    static func currencyRates(from response: GetRatesResponse) -> CurrencyRates? {
        
        guard let base = response.base, let rates = response.rates else { return nil }
        let timestamp = response.timestamp ?? Int(Date().timeIntervalSince1970)
        let date = response.date ?? Date()
        let currencyRates: [CurrencyRate] = rates.compactMap { CurrencyRate(symbol: $0.key, rate: $0.value) }
        
        return CurrencyRates(timestamp: timestamp, base: base, date: date, rates: currencyRates)
    }
}
