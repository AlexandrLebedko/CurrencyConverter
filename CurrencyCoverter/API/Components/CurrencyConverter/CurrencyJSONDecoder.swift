//
//  CurrencyJSONDecoder.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyJSONDecoder: JSONDecoder {
    
    override init() {
        super.init()
        self.dateDecodingStrategy = .formatted(CurrencyApi.dateFormatter)
        self.keyDecodingStrategy = .convertFromSnakeCase
    }
}
