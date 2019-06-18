//
//  CurrencyFilter.swift
//  CTranslate
//
//  Created by Александр Лебедько on 18/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import ReactiveSwift

class CurrencyFilter {
    
    let searchString = MutableProperty<String?>(nil)

    public let filterSignal: Signal<Void, Never>
    private let filterSignalObserver: Signal<Void, Never>.Observer
    
    init() {
        (filterSignal, filterSignalObserver) = Signal<Void, Never>.pipe()

        searchString.signal.observeValues { [unowned self] _ in
            self.filterSignalObserver.send(value: ())
        }
    }
    
    func reset() {
        searchString.value = nil
    }
    
}
