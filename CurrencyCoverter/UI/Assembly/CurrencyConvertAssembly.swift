//
//  CurrencyConverterAssembly.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 18/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyConvertAssembly: BaseViewControllerAssembly {
    typealias ViewController = CurrencyConvertVC
    typealias Context = (ICurrencyCoordinator, CurrencyRate)
    
    func build(with context: Context) -> CurrencyConvertVC {
        let model = CurrencyConvertViewModel(currencyService: dependencyContainer.currencyService,
                                             appSettings: dependencyContainer.settings,
                                             currencyRate: context.1)
        let vc = CurrencyConvertVC(viewModel: model, coordinator: context.0)
        return vc
    }
}
