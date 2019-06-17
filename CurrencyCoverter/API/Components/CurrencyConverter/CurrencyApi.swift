//
//  CurrencyApi.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

struct CurrencyApi {
    
    public static let currencyEndpointUrlString = "http://data.fixer.io/api/"
    public static let currencyApiAccessKey = "14e937400118b1b0c6ec7eae9181948b"
    
    static var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()

}
