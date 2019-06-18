//
//  Currency.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

struct Currency {
    var symbol: String
    var name: String
}

extension Currency: Equatable {
    
    static func == (lhs: Currency, rhs: Currency) -> Bool {
        return lhs.symbol == rhs.symbol
    }
}
