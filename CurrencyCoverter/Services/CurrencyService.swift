//
//  CurrencyService.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyService: ICurrencyService {
    
    private var currencyApiClient: ApiClient
    
    init(currencyApiClient: ApiClient) {
        self.currencyApiClient = currencyApiClient
    }
    
    func getLatestRates(from: String?, to: [String]?) {
        let request = GetLatestRatesRequest(base: from, symbols: to)
        currencyApiClient.send(request) { (result) in
            switch result {
            case let .success(getLatestRatesResponse):
                print("Get latest rates response: ", getLatestRatesResponse)
            case let .failure(error):
                print("Get latest rates error: ", error)
            }
        }
    }
    
    func changeBaseCurrency(newBaseCurrency: String) {
        let request = ChangeBaseCurrencyRequest(base: newBaseCurrency)
        currencyApiClient.send(request) { (result) in
            switch result {
            case let .success(changeBaseCurrencyResponse):
                print("Change base currency response: ", changeBaseCurrencyResponse)
            case let .failure(error):
                print("Change base currency error: ", error)
            }
        }
    }
    
    func convert(from: String, to: String, amount: Float, date: Date?) {
        let request = ConvertCurrencyRequest(from: from, to: to, amount: amount, date: date)
        currencyApiClient.send(request) { (result) in
            switch result {
            case let .success(changeBaseCurrencyResponse):
                print("Convert currency response: ", changeBaseCurrencyResponse)
            case let .failure(error):
                print("Convert currency error: ", error)
            }
        }
    }    
}
