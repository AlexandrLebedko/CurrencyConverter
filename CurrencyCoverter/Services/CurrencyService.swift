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
    
    func getLatestRates(from: String?, to: [String]?, callback: @escaping GetLatestRatesCallback) {
        let request = GetLatestRatesRequest(base: from, symbols: to)
        currencyApiClient.send(request) { (result) in
            switch result {
            case let .success(getLatestRatesResponse):
                if let rates = CurrencyRatesDTOParser.currencyRates(from: getLatestRatesResponse) {
                    callback(.success(rates))
                } else {
                    callback(.failure(.decoding))
                }
            case let .failure(error):
                callback(.failure(.server(message: error.localizedDescription)))
            }
        }
    }
    
    func changeBaseCurrency(newBaseCurrency: String, callback: @escaping ChangeBaseCurrencyCallback) {
        let request = ChangeBaseCurrencyRequest(base: newBaseCurrency)
        currencyApiClient.send(request) { (result) in
            switch result {
            case let .success(changeBaseCurrencyResponse):
                if let rates = CurrencyRatesDTOParser.currencyRates(from: changeBaseCurrencyResponse) {
                    callback(.success(rates))
                } else {
                    callback(.failure(.decoding))
                }
            case let .failure(error):
                callback(.failure(.server(message: error.localizedDescription)))
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
    
    func getSupportedSymbols(callback: @escaping GetSupportedSymbolsCallback) {
        let request = GetSupportedSymbolsRequest()
        currencyApiClient.send(request) { (result) in
            switch result {
            case let .success(getSupportedSymbolsResponse):
                if let currencies = CurrencyDTOParser.currencies(from: getSupportedSymbolsResponse) {
                    callback(.success(currencies))
                } else {
                    callback(.failure(.decoding))
                }
            case let .failure(error):
                callback(.failure(.server(message: error.localizedDescription)))
            }
        }
    }
}
