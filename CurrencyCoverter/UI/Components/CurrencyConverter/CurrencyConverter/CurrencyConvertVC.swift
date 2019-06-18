//
//  CurrencyConvertVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit
import ReactiveSwift

class CurrencyConvertVC: ViewController, IBindingViewController {
    typealias ViewModel = CurrencyConvertViewModel
    
    private var viewModel: CurrencyConvertViewModel
    private var coordinator: ICurrencyCoordinator
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fromCurrencySymbolLabel: UILabel!
    @IBOutlet weak var fromCurrencyAmountTextField: UITextField!
    @IBOutlet weak var toCurrencySymbolLabel: UILabel!
    @IBOutlet weak var toCurrencyAmountTextField: UITextField!
    
    init(viewModel: CurrencyConvertViewModel, coordinator: ICurrencyCoordinator) {
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
    }
    
    func bind(to viewModel: CurrencyConvertViewModel) {
        super.bind(to: viewModel)
        
        viewModel.fromCurrencyAmount <~ fromCurrencyAmountTextField.reactive.continuousTextValues.map { ($0 as NSString).doubleValue }
        toCurrencyAmountTextField.reactive.text <~ viewModel.toCurrencyAmountTextFieldText
        
        toCurrencySymbolLabel.text = viewModel.toCurrencySymbolLabelText
        fromCurrencySymbolLabel.text = viewModel.fromCurrencySymbolLabelText
        titleLabel.text = viewModel.titleLabelText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fromCurrencyAmountTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        fromCurrencyAmountTextField.resignFirstResponder()
    }
    
    @IBAction func backButtonHandler() {
        navigationController?.popViewController(animated: true)
    }
    
}
