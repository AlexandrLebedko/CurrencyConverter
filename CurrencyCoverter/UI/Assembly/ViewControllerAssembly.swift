//
//  ViewControllerAssembly.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

public protocol ViewControllerAssembly {
    
    associatedtype ViewController: UIViewController
    
    associatedtype Context
    
    func build(with context: Context) -> ViewController
}
