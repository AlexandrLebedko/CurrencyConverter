//
//  CurrencyListTVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 18/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

class CurrencyListTVCModel: RTableViewCellModel {
    
    private var currency: Currency
    private var isBase: Bool
    
    init(currency: Currency, isBase: Bool) {
        self.currency = currency
        self.isBase = isBase
    }
    
    var currencyFlagImageViewImage: UIImage? {
        return UIImage(named: currency.symbol.lowercased())
    }
    
    var currencySymbolLabelText: String {
        return currency.symbol + " (\(currency.name))"
    }
    
    var checkmarkImageIsHidden: Bool {
        return !isBase
    }
}
