//
//  RTableViewCellModel.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import Foundation
import ReactiveSwift

open class RTableViewCellModel: ILifetimeHolder {
    
    public let lifeToken = Lifetime.Token()
}
