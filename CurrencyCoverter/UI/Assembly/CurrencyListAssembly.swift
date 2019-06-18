//
//  CurrencyListAssembly.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 18/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

class CurrencyListAssembly: BaseViewControllerAssembly {
    typealias ViewController = CurrencyListVC
    typealias Context = (ICoordinator, OnCurrencyChangedBlock)
    
    func build(with context: Context) -> CurrencyListVC {
        let model = CurrencyListViewModel(currencyService: dependencyContainer.currencyService,
                                          appSettings: dependencyContainer.settings)
        let vc = CurrencyListVC(viewModel: model, coordinator: context.0, onCurrencyChangedBlock: context.1)
        return vc
    }
}
