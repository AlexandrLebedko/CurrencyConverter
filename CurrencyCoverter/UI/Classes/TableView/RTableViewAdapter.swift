//
//  RTableViewAdapter.swift
//  CurrencyCoverter
//
//  Created by Александр Лебедько on 17/06/2019.
//  Copyright © 2019 Alexandr Lebedko. All rights reserved.
//

import UIKit

typealias PresetTableViewCellAction = (UITableView, IndexPath, Any) -> Void
typealias HandleRefreshAction = () -> Void

class RTableViewAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var dataSource: RTableViewDataSource?
    var didSelectCellAction: PresetTableViewCellAction?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let dataSource = self.dataSource else { return 0 }
        
        return dataSource.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataSource = self.dataSource else { return 0 }
        
        let count = dataSource.numberOfRowsIn(section: section)
        
        if count == 0 {
            func createEmptyLabel() -> UILabel {
                let label = UILabel()
                label.text = "Have no items"
                label.textAlignment = .center
                return label
            }
            
            tableView.backgroundView = createEmptyLabel()
            
        } else {
            tableView.backgroundView = nil
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let dataSource = self.dataSource, let cell = tableView.dequeueReusableCell(of: dataSource.cellTypeForObjectAt(indexPath: indexPath), for: indexPath) as? RTableViewCell else {
            return UITableViewCell()
        }
        
        let cellModel = dataSource.viewModelForObjectAt(indexPath: indexPath)
        cell.model = cellModel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let object = dataSource?.objectAt(indexPath: indexPath) else { return }
        didSelectCellAction?(tableView, indexPath, object)
    }
}
