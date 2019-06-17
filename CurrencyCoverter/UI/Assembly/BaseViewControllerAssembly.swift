//
//  BaseViewControllerAssembly.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation

typealias BaseViewControllerAssembly = BaseViewControllerAssemblyClass & ViewControllerAssembly

class BaseViewControllerAssemblyClass {
    
    private(set) var dependencyContainer: DependencyContainer
    
    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
    }
}
