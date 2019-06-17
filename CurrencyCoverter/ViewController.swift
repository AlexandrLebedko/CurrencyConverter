//
//  ViewController.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 16/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let container = DependencyContainer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        container.currencyService.getLatestRates(from: nil, to: nil)
//        container.currencyService.changeBaseCurrency(newBaseCurrency: "RUB")
        container.currencyService.convert(from: "RUB", to: "USD", amount: 10394.3, date: nil)
    }


}

