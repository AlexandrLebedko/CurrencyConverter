//
//  CurrencyRatesVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

class CurrencyRatesVC: UIViewController {
    
    private var viewModel: CurrencyRatesViewModel
    private var coordinator: ICurrencyCoordinator
    
    init(viewModel: CurrencyRatesViewModel, coordinator: ICurrencyCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: "CurrencyRatesVC", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
