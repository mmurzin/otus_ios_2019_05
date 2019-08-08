//
//  FeedViewController.swift
//  homework-1
//
//  Created by michael on 16/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let suffixArrayManipulator: SuffixArrayManipulator = SwiftSuffixArrayManipulator()
    
    private var dataItems:[String] = Services.feedProvider.feedData()
    private var filteterdDataItems:[String] = []
    
    private var isSearchBarEmpty: Bool {
        guard let query = searchController.searchBar.text else {
            return true
        }
        return query.isEmpty
    }
    
    private var isFiltered: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Algorithm"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        initSearching()
    }
    
    func initSearching() {
        dataItems.append(contentsOf: Services.algoProvider.all)
        let time = suffixArrayManipulator.setupWithObjects(items:dataItems, reverse:true)
        print("freeze time \(time)")
    }
 
}

extension FeedViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query: String = searchController.searchBar.text else {
            return
        }
        filteterdDataItems = suffixArrayManipulator.searchAlgoName(query: query)
        tableView.reloadData()
    }
}

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltered ? filteterdDataItems.count : dataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        cell.textLabel?.text = isFiltered ? filteterdDataItems[indexPath.row] : dataItems[indexPath.row]
        return cell
    }
}

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DataStructures", bundle: nil)
        let name = dataItems[indexPath.row]
        var viewController:UIViewController?
        
        switch name {
        case "Array":
            viewController = storyboard.instantiateViewController(withIdentifier: "ArrayViewController")
        case "Set":
            viewController = storyboard.instantiateViewController(withIdentifier: "SetViewController")
        case "Dictionary":
            viewController = storyboard.instantiateViewController(withIdentifier: "DictionaryViewController")
        case "SuffixArray":
            viewController = storyboard.instantiateViewController(withIdentifier: "SuffixArrayViewController")
        default:
            print("viewController by \(name) not found")
        }
        
        if let pushViewController = viewController {
            self.navigationController?.pushViewController(pushViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
