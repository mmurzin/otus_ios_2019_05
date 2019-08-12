//
//  Extension-UITableViewDelegate.swift
//  homework-1
//
//  Created by michael on 12/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation
import UIKit

extension FeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DataStructures", bundle: nil)
        let name =  viewModel.dataItems[indexPath.row]
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
