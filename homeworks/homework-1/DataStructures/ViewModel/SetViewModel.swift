//
//  SetViewModel.swift
//  homework-1
//
//  Created by michael on 09/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class SetViewModel: DataStructuresViewModel {
    
    private let setManipulator = SwiftSetManipulator()
    
    var creationTime: TimeInterval = 0
    var add1ObjectTime: TimeInterval = 0
    var add5ObjectsTime: TimeInterval = 0
    var add10ObjectsTime: TimeInterval = 0
    var remove1ObjectTime: TimeInterval = 0
    var remove5ObjectsTime: TimeInterval = 0
    var remove10ObjectsTime: TimeInterval = 0
    var lookup1ObjectTime: TimeInterval = 0
    var lookup10ObjectsTime: TimeInterval = 0
    
    override func create() {
        creationTime = setManipulator.setupWithObjectCount(numberOfItems)
    }
    
    override func test() {
        if (setManipulator.setHasObjects()) {
            add1ObjectTime = setManipulator.add1Object()
            add5ObjectsTime = setManipulator.add5Objects()
            add10ObjectsTime = setManipulator.add10Objects()
            remove1ObjectTime = setManipulator.remove1Object()
            remove5ObjectsTime = setManipulator.remove5Objects()
            remove10ObjectsTime = setManipulator.remove10Objects()
            lookup1ObjectTime = setManipulator.lookup1Object()
            lookup10ObjectsTime = setManipulator.lookup10Objects()
        } else {
            print("Set is not set up yet!")
        }
    }
}
