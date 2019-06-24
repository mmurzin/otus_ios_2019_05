//
//  FeedViewController.swift
//  homework-1
//
//  Created by michael on 16/06/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    
    @IBOutlet weak var tableView: UITableView!
    
     let dataItems:[String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9", "Item 10", "Item 11", "Item 12", "Item 13", "Item 14", "Item 15", "Item 16", "Item 17", "Item 18", "Item 19", "Item 20", "Item 21", "Item 22", "Item 23", "Item 24", "Item 25", "Item 26", "Item 27", "Item 28", "Item 29", "Item 30"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        cell.textLabel?.text = dataItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard : UIStoryboard? = UIStoryboard(name: "FeedTab", bundle: nil)
        
        if let sessionViewController = storyboard?.instantiateViewController(withIdentifier: "SessionSummary") as? SessionSummaryViewController {
            sessionViewController.itemName = dataItems[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: false)
            self.navigationController?.pushViewController(sessionViewController, animated: true)
        }
        
    }

}
