//
//  CurrencyRatesVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit
import ReactiveSwift

class CurrencyRatesVC: UIViewController {
    
    private var viewModel: CurrencyRatesViewModel
    private var coordinator: ICurrencyCoordinator
    private var currencyTableAdapter = CurrencyRatesTableAdapter()
    
    @IBOutlet weak var currencyRatesTableView: RTableView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var changeBaseCurrencyButton: UIButton!
    
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
        
        bind()
        setup()
        viewModel.loadData()
    }
    
    func bind() {
        changeBaseCurrencyButton.reactive.image(for: .normal) <~ viewModel.baseCurrencyButtonImage
        changeBaseCurrencyButton.reactive.title(for: .normal) <~ viewModel.baseCurrencyButtonTitle
        currencyRatesTableView.reactive.rDataSource <~ viewModel.currencyTableDataSource
    }
    
    func setup() {
        currencyRatesTableView.adapter = currencyTableAdapter
        currencyTableAdapter.didSelectCellAction = { [unowned self] _, _, object in
            if let currencyRate = object as? CurrencyRate {
                self.coordinator.navigateToConverter(with: currencyRate)
            }
        }
    }
    
    @IBAction func changeBaseCurrencyButtonHandler() {
        coordinator.navigateToCurrencyList()
    }
}

extension CurrencyRatesVC: UpdatableWithCurrency {
    
    func onBaseCurrencyChanged(baseCurrencySymbol: String?) {
        viewModel.loadData()
    }
}
