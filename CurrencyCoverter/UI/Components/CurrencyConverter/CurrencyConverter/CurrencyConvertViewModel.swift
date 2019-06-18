//
//  CurrencyConvertVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import ReactiveSwift

class CurrencyConvertViewModel: BaseViewModel {
    
    private var currencyService: ICurrencyService
    private var appSettings: IAppSettings
    private var currencyRate: CurrencyRate
    
    let fromCurrencyAmount = MutableProperty<Double>(0.0)
    private let toCurrencyAmount = MutableProperty<Double>(0.0)
    
    init(currencyService: ICurrencyService, appSettings: IAppSettings, currencyRate: CurrencyRate) {
        self.currencyService = currencyService
        self.appSettings = appSettings
        self.currencyRate = currencyRate
        
        super.init()
        
        fromCurrencyAmount.signal.observeValues { [unowned self] amount in
            self.toCurrencyAmount.value = amount * Double(self.currencyRate.rate)
        }
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    
    var toCurrencyAmountTextFieldText: SignalProducer<String?, Never> {
        return toCurrencyAmount.producer.map { "\($0)" }
    }
    
    var toCurrencySymbolLabelText: String? {
        return currencyRate.symbol
    }
    
    var fromCurrencySymbolLabelText: String? {
        return appSettings.baseCurrencySymbol
    }
    
    var titleLabelText: String? {
        guard let baseCurrencySymbol = appSettings.baseCurrencySymbol else { return "Converter" }
        return String(format: "%@ TO %@ (%.2f)", baseCurrencySymbol.uppercased(), currencyRate.symbol.uppercased(), currencyRate.rate)
    }
}
