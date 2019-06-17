//
//  RTableViewDataSource.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

public protocol RTableViewDataSource {
    
    var viewModels: [RTableViewCellModel]? { get }
    var cellTypes: [View] { get }
    
    func cellTypeForObjectAt(indexPath: IndexPath) -> View
    func viewModelForObjectAt(indexPath: IndexPath) -> RTableViewCellModel?
    func numberOfSections() -> Int
    func numberOfRowsIn(section: Int) -> Int
    func objectAt(indexPath: IndexPath) -> Any?
    func indexPathFor(object: Any) -> IndexPath?
    
}
