//
//  CurrencyRateTVC.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit
import ReactiveSwift

class CurrencyRateTVC: RTableViewCell<CurrencyRateTVCModel> {
    
    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    override func connect(to model: CurrencyRateTVCModel, lifetime: Lifetime) {
        super.connect(to: model, lifetime: lifetime)
        
        self.countryFlagImageView.image = model.countryFlatImageViewImage
        self.rateLabel.text = model.rateLabelText
        self.symbolLabel.text = model.symbolLabelText
    }
    
}
