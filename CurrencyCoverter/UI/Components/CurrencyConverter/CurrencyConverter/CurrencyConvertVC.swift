//
//  CurrencyConvertVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

class CurrencyConvertVC: UIViewController {
    
    private var viewModel: CurrencyConvertViewModel
    private var coordinator: ICurrencyCoordinator
    
    init(viewModel: CurrencyConvertViewModel, coordinator: ICurrencyCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: "CurrencyConvertVC", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
