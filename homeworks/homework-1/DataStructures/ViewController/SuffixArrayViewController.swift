//
//  SuffixArrayViewController.swift
//  homework-1
//
//  Created by michael on 01/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//
import UIKit

private enum SuffixArrayVCRow: Int {
    case creation = 0,
    creationWithAlgoNames,
    search10Random,
    search10RandomWithCondition,
    remove1Entry,
    remove5Entries,
    remove10Entries,
    lookup1Entry,
    lookup10Entries
}

class SuffixArrayViewController: DataStructuresViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.viewModel = SuffixArrayViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create SuffixArray and Test", for: [])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let vm = self.viewModel as? SuffixArrayViewModel {
            switch (indexPath as NSIndexPath).row {
            case SuffixArrayVCRow.creation.rawValue:
                cell.textLabel!.text = "Array Creation:"
                cell.detailTextLabel!.text = formattedTime(vm.creationTime)
            case SuffixArrayVCRow.creationWithAlgoNames.rawValue:
                cell.textLabel!.text = "Creation with AlgoProvider:"
                cell.detailTextLabel!.text = formattedTime(vm.creationAlgoTime)
            case SuffixArrayVCRow.search10Random.rawValue:
                cell.textLabel!.text = "Search 10 words:"
                cell.detailTextLabel!.text = formattedTime(vm.search10Words)
            default:
                print("Unhandled row! \((indexPath as NSIndexPath).row)")
            }
        }
        return cell
    }
}
