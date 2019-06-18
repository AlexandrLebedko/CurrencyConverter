//
//  GetSupportedSymbolsRequest.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 18/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

struct GetSupportedSymbolsRequest: APIRequest {
    typealias Response = GetSupportedSymbolsResponse
    
    var resourceName: String {
        return "symbols"
    }
    
    var httpMethod: HTTPMethod {
        return .GET
    }
    
    var headers: [String : String]? {
        return nil
    }
}
