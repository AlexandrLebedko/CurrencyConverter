//
//  ChangeBaseCurrencyRequest.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

struct ChangeBaseCurrencyRequest: APIRequest {
    typealias Response = ChangeBaseCurrencyResponse
    
    var base: String
    
    init(base: String) {
        self.base = base
    }
    
    var resourceName: String {
        return "latest"
    }
    
    var httpMethod: HTTPMethod {
        return .GET
    }
    
    var headers: [String : String]? {
        return nil
    }
}
