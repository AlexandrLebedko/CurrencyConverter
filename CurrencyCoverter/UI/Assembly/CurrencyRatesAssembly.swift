//
//  CurrencyRatesAssembly.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyRatesAssembly: BaseViewControllerAssembly {
    typealias ViewController = CurrencyRatesVC
    typealias Context = ICurrencyCoordinator
    
    func build(with context: ICurrencyCoordinator) -> CurrencyRatesVC {
        let model = CurrencyRatesViewModel(currencyService: dependencyContainer.currencyService)
        let vc = CurrencyRatesVC(viewModel: model, coordinator: context)
        return vc
    }
    
}
