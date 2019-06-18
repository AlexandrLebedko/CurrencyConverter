//
//  AppCoordinator.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

protocol ICoordinator: AnyObject {
    var dependencyContainer: DependencyContainer { get }
    var childCoordinators: [ICoordinator] { get }
    var navigationController: UINavigationController { get }
    
    func start()
    func back()
    func childDidFinish(_ child: ICoordinator?)
}

class Coordinator: ICoordinator {
    
    internal var dependencyContainer: DependencyContainer
    var childCoordinators = [ICoordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, dependencyContainer: DependencyContainer) {
        self.navigationController = navigationController
        self.dependencyContainer = dependencyContainer
        navigationController.isNavigationBarHidden = true
    }
    
    func start() { }
    
    func back() {
        
    }
    
    func childDidFinish(_ child: ICoordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
