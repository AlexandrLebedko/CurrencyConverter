//
//  CurrencyListVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

class CurrencyListVC: UIViewController {
    
    private var viewModel: CurrencyListViewModel
    private var coordinator: ICurrencyCoordinator
    
    init(viewModel: CurrencyListViewModel, coordinator: ICurrencyCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: "CurrencyListVC", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
