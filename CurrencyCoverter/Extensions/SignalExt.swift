//
//  SignalExt.swift
//  CTranslate
//
//  Created by Александр Лебедько on 19/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

extension Signal {
    
    public func mapToVoid() -> Signal<Void, Error> {
        return map { _ in () }
    }
}
