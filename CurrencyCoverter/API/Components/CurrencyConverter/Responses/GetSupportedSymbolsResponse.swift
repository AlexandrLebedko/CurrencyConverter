//
//  GetSupportedSymbolsResponse.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 18/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

struct GetSupportedSymbolsResponse: Decodable {
    
    var success: Bool?
    var symbols: [String: String]?
}
