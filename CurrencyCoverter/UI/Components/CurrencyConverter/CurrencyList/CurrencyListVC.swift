//
//  CurrencyListVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit
import ReactiveSwift
import Typist

typealias OnCurrencyChangedBlock = ((String?) -> Void)

class CurrencyListVC: ViewController, IBindingViewController {
    typealias ViewModel = CurrencyListViewModel
    
    private var viewModel: CurrencyListViewModel
    private var coordinator: ICoordinator
    private var currencyListTableAdapter = CurrencyListTableAdapter()
    private var onCurrencyChangedBlock: ((String?) -> Void)
    
    @IBOutlet weak var currencyListTableView: RTableView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    init(viewModel: CurrencyListViewModel, coordinator: ICoordinator, onCurrencyChangedBlock: @escaping OnCurrencyChangedBlock) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        self.onCurrencyChangedBlock = onCurrencyChangedBlock
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
    
    func bind(to viewModel: CurrencyListViewModel) {
        super.bind(to: viewModel)
        
        currencyListTableView.reactive.rDataSource <~ viewModel.currencyListTableDataSource
        viewModel.currencyChangedObserver.signal.skipNil()
            .observeValues { [weak self] symbol in
                self?.onCurrencyChangedBlock(symbol)
                self?.closeButtonHandler()
        }
    }
    
    override func setup() {
        Signal.merge(viewModel.currencyListTableDataSource.signal.mapToVoid(), viewModel.alertErrorMessageSignal.mapToVoid()).observeValues { [weak self] in
            guard let `self` = self else { return }
            self.currencyListTableView.refreshControl?.endRefreshing()
            
        }
        currencyListTableView.handleRefresh = { [unowned self] in self.viewModel.loadData() }
        
        searchBar.delegate = self
        currencyListTableView.adapter = currencyListTableAdapter
        currencyListTableAdapter.didSelectCellAction = { [unowned self] _, _, object in
            if let currency = object as? Currency {
                self.viewModel.select(currency: currency)
            }
        }
        
        searchBar.reactive.continuousTextValues.observeValues { [unowned self] text in
            self.viewModel.filter(by: text)
        }
    }
    
    @IBAction func closeButtonHandler() {
        dismiss(animated: true, completion: nil)
    }
}

extension CurrencyListVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
