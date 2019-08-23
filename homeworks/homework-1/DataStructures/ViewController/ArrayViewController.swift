//
//  ArrayViewController.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

private enum ArrayVCRow: Int {
    case creation = 0,
    insertAt0,
    insertAtMid,
    insertAtEnd,
    deleteAt0,
    deleteAtMid,
    deleteAtEnd,
    lookupByIndex,
    lookupByObject
}

import UIKit

class ArrayViewController: DataStructuresViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.viewModel = ArrayViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create Array and Test", for: [])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let vm = self.viewModel as? ArrayViewModel {
            switch (indexPath as NSIndexPath).row {
            case ArrayVCRow.creation.rawValue:
                cell.textLabel!.text = "Array Creation:"
                cell.detailTextLabel!.text = formattedTime(vm.creationTime)
            case ArrayVCRow.insertAt0.rawValue:
                cell.textLabel!.text = "Insert At Index 0:"
                cell.detailTextLabel!.text = formattedTime(vm.insertAt0Time)
            case ArrayVCRow.insertAtMid.rawValue:
                cell.textLabel!.text = "Insert In Middle:"
                cell.detailTextLabel!.text = formattedTime(vm.insertAtMidTime)
            case ArrayVCRow.insertAtEnd.rawValue:
                cell.textLabel!.text = "Insert At End:"
                cell.detailTextLabel!.text = formattedTime(vm.insertAtEndTime)
            case ArrayVCRow.deleteAt0.rawValue:
                cell.textLabel!.text = "Remove From Index 0:"
                cell.detailTextLabel!.text = formattedTime(vm.removeAt0Time)
            case ArrayVCRow.deleteAtMid.rawValue:
                cell.textLabel!.text = "Remove From Middle:"
                cell.detailTextLabel!.text = formattedTime(vm.removeAtMidTime)
            case ArrayVCRow.deleteAtEnd.rawValue:
                cell.textLabel!.text = "Remove From End:"
                cell.detailTextLabel!.text = formattedTime(vm.removeAtEndTime)
            case ArrayVCRow.lookupByIndex.rawValue:
                cell.textLabel!.text = "Lookup By Index:"
                cell.detailTextLabel!.text = formattedTime(vm.lookupByIndexTime)
            case ArrayVCRow.lookupByObject.rawValue:
                cell.textLabel!.text = "Lookup By Object:"
                cell.detailTextLabel!.text = formattedTime(vm.lookupByObjectTime)
            default:
                print("Unhandled row! \((indexPath as NSIndexPath).row)")
            }
        }
        return cell
    }
}
