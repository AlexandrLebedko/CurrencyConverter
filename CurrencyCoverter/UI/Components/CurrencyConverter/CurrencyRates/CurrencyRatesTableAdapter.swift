//
//  CurrencyRatesTableAdapter.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

class AislesTableAdapter: RTableViewAdapter {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataSource = self.dataSource else {
            return UITableViewCell()
        }
        
        switch tableView.dequeueReusableCell(of: dataSource.cellTypeForObjectAt(indexPath: indexPath), for: indexPath) {
        case let cell as CurrencyRateTVC:
            if let cellModel = dataSource.viewModelForObjectAt(indexPath: indexPath) as? CurrencyRateTVCModel {
                cell.model = cellModel
            }
            return cell
        default:
            return UITableViewCell()
        }
        
    }
}
