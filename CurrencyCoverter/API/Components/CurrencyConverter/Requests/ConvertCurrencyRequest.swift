//
//  ConvertCurrencyRequest.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

struct ConvertCurrencyRequest: APIRequest, Decodable {
    typealias Response = ConvertCurrencyResponse
    
    var from: String
    var to: String
    var amount: Float
    var date: Date?
    
    init(from: String, to: String, amount: Float, date: Date?) {
        self.from = from
        self.to = to
        self.amount = amount
    }
    
    var resourceName: String {
        return "convert"
    }
    
    var httpMethod: HTTPMethod {
        return .GET
    }
    
    var headers: [String : String]? {
        return nil
    }
}
