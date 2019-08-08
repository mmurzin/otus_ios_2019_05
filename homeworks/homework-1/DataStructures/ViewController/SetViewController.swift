//
//  SetViewController.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import UIKit

private enum SetVCRow: Int {
    case creation = 0,
    add1Object,
    add5Objects,
    add10Objects,
    remove1Object,
    remove5Objects,
    remove10Objects,
    lookup1Object,
    lookup10Objects
}

class SetViewController: DataStructuresViewController {
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.viewModel = SetViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndTestButton.setTitle("Create Set and Test", for: UIControl.State())
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        if let vm = self.viewModel as? SetViewModel {
            switch (indexPath as NSIndexPath).row {
            case SetVCRow.creation.rawValue:
                cell.textLabel!.text = "Set Creation:"
                cell.detailTextLabel!.text = formattedTime(vm.creationTime)
            case SetVCRow.add1Object.rawValue:
                cell.textLabel!.text = "Add 1 Object:"
                cell.detailTextLabel!.text = formattedTime(vm.add1ObjectTime)
            case SetVCRow.add5Objects.rawValue:
                cell.textLabel!.text = "Add 5 Objects:"
                cell.detailTextLabel!.text = formattedTime(vm.add5ObjectsTime)
            case SetVCRow.add10Objects.rawValue:
                cell.textLabel!.text = "Add 10 Objects:"
                cell.detailTextLabel!.text = formattedTime(vm.add10ObjectsTime)
            case SetVCRow.remove1Object.rawValue:
                cell.textLabel!.text = "Remove 1 Object:"
                cell.detailTextLabel!.text = formattedTime(vm.remove1ObjectTime)
            case SetVCRow.remove5Objects.rawValue:
                cell.textLabel!.text = "Remove 5 Objects:"
                cell.detailTextLabel!.text = formattedTime(vm.remove5ObjectsTime)
            case SetVCRow.remove10Objects.rawValue:
                cell.textLabel!.text = "Remove 10 Objects:"
                cell.detailTextLabel!.text = formattedTime(vm.remove10ObjectsTime)
            case SetVCRow.lookup1Object.rawValue:
                cell.textLabel!.text = "Lookup 1 Object:"
                cell.detailTextLabel!.text = formattedTime(vm.lookup1ObjectTime)
            case SetVCRow.lookup10Objects.rawValue:
                cell.textLabel!.text = "Lookup 10 Objects:"
                cell.detailTextLabel!.text = formattedTime(vm.lookup10ObjectsTime)
            default:
                print("Unhandled row! \((indexPath as NSIndexPath).row)")
            }
        }
        return cell
    }
}
