//
//  Extension-UITableViewDataSource.swift
//  homework-1
//
//  Created by michael on 12/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation
import UIKit

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltered ?  viewModel.filteterdDataItems.count :  viewModel.dataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        let item = isFiltered ?  viewModel.filteterdDataItems[indexPath.row] :  viewModel.dataItems[indexPath.row]
        cell.textLabel?.text = item.name
        if let cellBackgroundColor = UIColor(hex: item.cellBackground) {
            cell.backgroundColor = cellBackgroundColor
        } else {
            cell.backgroundColor = .white
        }
        return cell
    }
}
