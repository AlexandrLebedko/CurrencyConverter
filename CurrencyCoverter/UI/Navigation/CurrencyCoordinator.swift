//
//  CurrencyCoordinator.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

protocol UpdatableWithCurrency {
    func onBaseCurrencyChanged(baseCurrencySymbol: String?)
}

protocol ICurrencyCoordinator {
    
    func navigateToCurrencyList()
    func navigateToConverter(with currencyRate: CurrencyRate)
}

class CurrencyCoordinator: Coordinator {
    
    override func start() {
        let assembly = CurrencyRatesAssembly(dependencyContainer: self.dependencyContainer)
        let vc = assembly.build(with: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension CurrencyCoordinator: ICurrencyCoordinator {
    
    func navigateToCurrencyList() {
        let closure: OnCurrencyChangedBlock = { [weak self] newBaseCurrency in
            self?.navigationController.viewControllers.forEach({ (viewController) in
                (viewController as? UpdatableWithCurrency)?.onBaseCurrencyChanged(baseCurrencySymbol: newBaseCurrency)
            })
        }
        
        let assembly = CurrencyListAssembly(dependencyContainer: self.dependencyContainer)
        let vc = assembly.build(with: (self, closure))
        navigationController.present(vc, animated: true, completion: nil)
    }
    
    func navigateToConverter(with currencyRate: CurrencyRate) {
        let assembly = CurrencyConvertAssembly(dependencyContainer: self.dependencyContainer)
        let vc = assembly.build(with: (self, currencyRate))
        navigationController.pushViewController(vc, animated: true)
    }
}
