//
//  CurrencyListTVC.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 18/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit
import ReactiveSwift

class CurrencyListTVC: RTableViewCell<CurrencyListTVCModel> {
    
    @IBOutlet weak var currencyFlagImageView: UIImageView!
    @IBOutlet weak var currencySymbolLabel: UILabel!
    @IBOutlet weak var checkmarkImageView: UIImageView!

    override func connect(to model: CurrencyListTVCModel, lifetime: Lifetime) {
        self.currencyFlagImageView.image = model.currencyFlagImageViewImage
        self.currencySymbolLabel.text = model.currencySymbolLabelText
        self.checkmarkImageView.isHidden = model.checkmarkImageIsHidden
    }
}
