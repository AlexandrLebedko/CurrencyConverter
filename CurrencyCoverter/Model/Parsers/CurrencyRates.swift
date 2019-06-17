//
//  CurrencyRates.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

struct CurrencyRates {
    var timestamp: Int
    var base: String
    var date: Date
    var rates: [CurrencyRate]
}
