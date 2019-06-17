//
//  CurrencyRateTVCModel.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

class CurrencyRateTVCModel: RTableViewCellModel {
    
    private var currencyRate: CurrencyRate
    
    init(currencyRate: CurrencyRate) {
        self.currencyRate = currencyRate
    }
    
    var countryFlatImageViewImage: UIImage? {
        return UIImage(named: currencyRate.symbol.lowercased())
    }
    
    var symbolLabelText: String? {
        return currencyRate.symbol
    }
    
    var rateLabelText: String? {
        return "\(currencyRate.rate)"
    }
}
