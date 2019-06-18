//
//  AppSettings.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 18/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

let keychainBaseCurrencySymbolKey = "currencyconverter.basecurrencysymbol"

class AppSettings {
    
    private var keychainWrapper: KeychainWrapper
    private var _baseCurrencySymbol: String?

    init(keychainWrapper: KeychainWrapper) {
        self.keychainWrapper = keychainWrapper
        
        if let savedBaseCurrencySymbol = keychainWrapper.string(forKey: keychainBaseCurrencySymbolKey) {
            _baseCurrencySymbol = savedBaseCurrencySymbol
        }
    }
}

extension AppSettings: IAppSettings {
    
    var baseCurrencySymbol: String? {
        set {
            guard let unwrappedNewValue = newValue else { return }
            keychainWrapper.set(unwrappedNewValue, forKey: keychainBaseCurrencySymbolKey)
            _baseCurrencySymbol = unwrappedNewValue
        }
        
        get {
            if let savedBaseCurrencySymbol = keychainWrapper.string(forKey: keychainBaseCurrencySymbolKey) {
                return savedBaseCurrencySymbol
            }
            
            if let savedBaseCurrencySymbol = _baseCurrencySymbol {
                return savedBaseCurrencySymbol
            }
            
            return nil
        }
    }
}
