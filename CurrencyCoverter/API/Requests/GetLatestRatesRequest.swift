//
//  GetRatesRequest.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class GetLatestRatesRequest: FixerIoApiRequest, APIRequest {
    typealias Response = GetRatesResponse
    
    var base: String?
    var symbols: [String]?
    
    init(base: String?, symbols: [String]?) {
        self.base = base
        self.symbols = symbols
        super.init()
    }
    
    var resourceName: String {
        return "latest"
    }
    
    var body: [String : Any]? {
        return nil
    }
    
    var httpMethod: HTTPMethod {
        return .GET
    }
    
    var headers: [String : String]? {
        return nil
    }
}
