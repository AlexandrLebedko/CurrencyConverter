//
//  ICurrencyService.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

protocol ICurrencyService {
    
    func getLatestRates(from: String?, to: [String]?)
    func changeBaseCurrency(newBaseCurrency: String)
    func convert(from: String, to: String, amount: Float, date: Date?)
}
