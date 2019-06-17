//
//  RTableViewCell.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit
import ReactiveSwift

class RTableViewCell<T: RTableViewCellModel>: UITableViewCell {
    
    private var modelToken = Lifetime.Token()
    
    var model: T? {
        didSet {
            modelToken = Lifetime.Token()
            
            if let model = model {
                connect(to: model, lifetime: Lifetime(modelToken))
            }
        }
    }
    
    func connect(to model: T, lifetime: Lifetime) {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        model = nil
    }
}
