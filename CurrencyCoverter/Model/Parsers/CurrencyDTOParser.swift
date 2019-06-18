//
//  CurrencyDTOParser.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 18/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyDTOParser {
    
    static func currencies(from response: GetSupportedSymbolsResponse) -> [Currency]? {
        guard let symbols = response.symbols else { return nil }
        
        return symbols.compactMap { Currency(symbol: $0.key, name: $0.value) }
    }
}
