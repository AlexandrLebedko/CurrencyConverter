//
//  GetRatesResponse.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class GetRatesResponse: Decodable {
    
    var success: Bool?
    var historical: Bool?
    var date: Date?
    var timestamp: Int?
    var base: String?
    var rates: [String: Float]?
}
