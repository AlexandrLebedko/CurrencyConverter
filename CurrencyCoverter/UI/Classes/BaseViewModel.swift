//
//  BaseViewModel.swift
//  CTranslate
//
//  Created by Александр Лебедько on 19/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import ReactiveSwift

enum BaseViewError {
    
    case string(String)
    case apiError(APIError)
    
    var message: String {
        switch self {
        case let .apiError(error):
            return error.localizedDescription
        case let .string(string):
            return string
        }
    }
}

class BaseViewModel: NSObject {
    
    public let alertErrorMessageSignal: Signal<BaseViewError, Never>
    private let alertErrorMessageObserver: Signal<BaseViewError, Never>.Observer
    public let loadingSignal: Signal<Bool, Never>
    private let loadingSignalObserver: Signal<Bool, Never>.Observer
    
    required override init() {
        (alertErrorMessageSignal, alertErrorMessageObserver) = Signal<BaseViewError, Never>.pipe()
        (loadingSignal, loadingSignalObserver) = Signal<Bool, Never>.pipe()
    }
    
    func onErrorOccured(error: BaseViewError) {
        alertErrorMessageObserver.send(value: error)
    }
    
    func onLoading(_ isLoading: Bool) {
        loadingSignalObserver.send(value: isLoading)
    }
}
