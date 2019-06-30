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
    
     let dataItems:[String] = Services.feedProvider.feedData()
    
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
                print("case SuffixArray")
            default:
                print("viewController by \(name) not found")
        }
        
        if let pushViewController = viewController {
            self.navigationController?.pushViewController(pushViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: false)
        
    }

}
