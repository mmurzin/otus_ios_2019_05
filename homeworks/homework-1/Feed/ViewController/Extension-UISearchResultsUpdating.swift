//
//  Extension-UISearchResultsUpdating.swift
//  homework-1
//
//  Created by michael on 12/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation
import UIKit

extension FeedViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query: String = searchController.searchBar.text else {
            return
        }
        viewModel.search(query: query)
    }
}
