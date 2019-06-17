//
//  ILifetimeHolder.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveCocoa

public protocol ILifetimeHolder: class {
    
    var lifeToken: Lifetime.Token { get }
}

extension ILifetimeHolder {
    
    func makeBindingTarget(_ f: @escaping (Self) -> Void) -> BindingTarget<Void> {
        return BindingTarget(lifetime: Lifetime(lifeToken)) { [unowned self] in f(self) }
    }
    
    func makeBindingTarget<T>(_ f: @escaping (Self, T) -> Void) -> BindingTarget<T> {
        return BindingTarget(lifetime: Lifetime(lifeToken)) { [unowned self] in f(self, $0) }
    }
    
}
