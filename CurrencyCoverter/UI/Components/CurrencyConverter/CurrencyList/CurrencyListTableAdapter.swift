//
//  CurrencyListTableAdapter.swift
//  CurrencyCoverter
//
//  Created by Alexandr Lebedko on 18/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

class CurrencyListTableAdapter: RTableViewAdapter {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataSource = self.dataSource else {
            return UITableViewCell()
        }
        
        switch tableView.dequeueReusableCell(of: dataSource.cellTypeForObjectAt(indexPath: indexPath), for: indexPath) {
        case let cell as CurrencyListTVC:
            if let cellModel = dataSource.viewModelForObjectAt(indexPath: indexPath) as? CurrencyListTVCModel {
                cell.model = cellModel
            }
            return cell
        default:
            return UITableViewCell()
        }
        
    }
}
