//
//  CurrencyCoordinator.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

protocol ICurrencyCoordinator {
    
    func changeBaseRate()
    func selectRate()
}

class CurrencyCoordinator: Coordinator {
    
    override func start() {
        let assembly = CurrencyRatesAssembly(dependencyContainer: self.dependencyContainer)
        let vc = assembly.build(with: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension CurrencyCoordinator: ICurrencyCoordinator {
    
    func changeBaseRate() {
        
    }
    
    func selectRate() {
        
    }
}
