//
//  CurrencyListVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit
import ReactiveSwift

typealias OnCurrencyChangedBlock = ((String?) -> Void)

class CurrencyListVC: UIViewController {
    
    private var viewModel: CurrencyListViewModel
    private var coordinator: ICoordinator
    private var currencyListTableAdapter = CurrencyListTableAdapter()
    private var onCurrencyChangedBlock: ((String?) -> Void)
    
    @IBOutlet weak var currencyListTableView: RTableView!
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    init(viewModel: CurrencyListViewModel, coordinator: ICoordinator, onCurrencyChangedBlock: @escaping OnCurrencyChangedBlock) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        self.onCurrencyChangedBlock = onCurrencyChangedBlock
        super.init(nibName: "CurrencyListVC", bundle: nil)
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
        currencyListTableView.reactive.rDataSource <~ viewModel.currencyListTableDataSource
        viewModel.currencyChangedObserver.signal.skipNil()
            .observeValues { [weak self] in
                self?.onCurrencyChangedBlock($0)
                self?.closeButtonHandler()
        }
    }
    
    func setup() {
        currencyListTableView.adapter = currencyListTableAdapter
        currencyListTableAdapter.didSelectCellAction = { [unowned self] _, _, object in
            if let currency = object as? Currency {
                self.viewModel.select(currency: currency)
            }
        }
    }
    
    @IBAction func closeButtonHandler() {
        dismiss(animated: true, completion: nil)
    }
    

}
