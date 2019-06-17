//
//  ConvertCurrencyResponse.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

struct ConvertCurrencyResponse: Decodable {
    
    var success: Bool?
    var date: Date?
    var result: Double?
}
