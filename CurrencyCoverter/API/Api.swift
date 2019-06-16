//
//  Api.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

enum HTTPMethod {
    case POST
    case GET
    
    var value: String {
        switch self {
        case .POST:
            return "POST"
        case .GET:
            return "GET"
        }
    }
}

struct Api {
    
    public static let currencyEndpointUrlString = "http://data.fixer.io/api/"
    public static let currencyApiAccessKey = "49f7babac9c6821992cdf3885b2b1320"
}
