//
//  CurrencyRatesVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit
import ReactiveSwift

class CurrencyRatesVC: ViewController, IBindingViewController {
    typealias ViewModel = CurrencyRatesViewModel
    
    private var viewModel: CurrencyRatesViewModel
    private var coordinator: ICurrencyCoordinator
    private var currencyTableAdapter = CurrencyRatesTableAdapter()
    
    @IBOutlet weak var currencyRatesTableView: RTableView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var changeBaseCurrencyButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    init(viewModel: CurrencyRatesViewModel, coordinator: ICurrencyCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        setup()
        viewModel.loadData()
    }
    
    func bind(to viewModel: CurrencyRatesViewModel) {
        super.bind(to: viewModel)

        changeBaseCurrencyButton.reactive.image(for: .normal) <~ viewModel.baseCurrencyButtonImage
        changeBaseCurrencyButton.reactive.title(for: .normal) <~ viewModel.baseCurrencyButtonTitle
        currencyRatesTableView.reactive.rDataSource <~ viewModel.currencyTableDataSource
    }
    
    override func setup() {
        searchBar.delegate = self
        
        Signal.merge(viewModel.currencyTableDataSource.signal.mapToVoid(), viewModel.alertErrorMessageSignal.mapToVoid()).observeValues { [weak self] in
            guard let `self` = self else { return }
            self.currencyRatesTableView.refreshControl?.endRefreshing()
            
        }
        currencyRatesTableView.handleRefresh = { [unowned self] in self.viewModel.loadData() }

        currencyRatesTableView.adapter = currencyTableAdapter
        currencyTableAdapter.didSelectCellAction = { [unowned self] _, _, object in
            if let currencyRate = object as? CurrencyRate {
                self.coordinator.navigateToConverter(with: currencyRate)
            }
        }
        
        searchBar.reactive.continuousTextValues.observeValues { [unowned self] text in
            self.viewModel.filter(by: text)
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

extension CurrencyRatesVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
