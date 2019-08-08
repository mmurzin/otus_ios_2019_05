//
//  DictionaryViewController.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import UIKit

private enum DictionaryVCRow: Int {
    case creation = 0,
    add1Entry,
    add5Entries,
    add10Entries,
    remove1Entry,
    remove5Entries,
    remove10Entries,
    lookup1Entry,
    lookup10Entries
}

class DictionaryViewController: DataStructuresViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.viewModel = DictionaryViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create Dictionary and Test", for: UIControl.State())
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let vm = self.viewModel as? DictionaryViewModel {
            switch (indexPath as NSIndexPath).row {
            case DictionaryVCRow.creation.rawValue:
                cell.textLabel!.text = "Dictionary Creation:"
                cell.detailTextLabel!.text = formattedTime(vm.creationTime)
            case DictionaryVCRow.add1Entry.rawValue:
                cell.textLabel!.text = "Add 1 Entry:"
                cell.detailTextLabel!.text = formattedTime(vm.add1EntryTime)
            case DictionaryVCRow.add5Entries.rawValue:
                cell.textLabel!.text = "Add 5 Entries:"
                cell.detailTextLabel!.text = formattedTime(vm.add5EntriesTime)
            case DictionaryVCRow.add10Entries.rawValue:
                cell.textLabel!.text = "Add 10 Entries:"
                cell.detailTextLabel!.text = formattedTime(vm.add10EntriesTime)
            case DictionaryVCRow.remove1Entry.rawValue:
                cell.textLabel!.text = "Remove 1 Entry:"
                cell.detailTextLabel!.text = formattedTime(vm.remove1EntryTime)
            case DictionaryVCRow.remove5Entries.rawValue:
                cell.textLabel!.text = "Remove 5 Entries:"
                cell.detailTextLabel!.text = formattedTime(vm.remove5EntriesTime)
            case DictionaryVCRow.remove10Entries.rawValue:
                cell.textLabel!.text = "Remove 10 Entries:"
                cell.detailTextLabel!.text = formattedTime(vm.remove10EntriesTime)
            case DictionaryVCRow.lookup1Entry.rawValue:
                cell.textLabel!.text = "Lookup 1 Entry:"
                cell.detailTextLabel!.text = formattedTime(vm.lookup1EntryTime)
            case DictionaryVCRow.lookup10Entries.rawValue:
                cell.textLabel!.text = "Lookup 10 Entries:"
                cell.detailTextLabel!.text = formattedTime(vm.lookup10EntriesTime)
            default:
                print("Unhandled row! \((indexPath as NSIndexPath).row)")
            }
        }
        
        
        return cell
    }
}

