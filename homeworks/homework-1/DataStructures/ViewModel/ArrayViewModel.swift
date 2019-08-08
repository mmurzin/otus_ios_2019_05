//
//  ArrayViewModel.swift
//  homework-1
//
//  Created by michael on 09/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class ArrayViewModel: DataStructuresViewModel {
    
    private let arrayManipulator: ArrayManipulator = SwiftArrayManipulator()
    
    var creationTime: TimeInterval = 0
    var insertAt0Time: TimeInterval = 0
    var insertAtMidTime: TimeInterval = 0
    var insertAtEndTime: TimeInterval = 0
    var removeAt0Time: TimeInterval = 0
    var removeAtMidTime: TimeInterval = 0
    var removeAtEndTime: TimeInterval = 0
    var lookupByIndexTime: TimeInterval = 0
    var lookupByObjectTime: TimeInterval = 0
    
    override func create() {
        creationTime = arrayManipulator.setupWithObjectCount(self.numberOfItems)
    }
    
    override func test() {
        if (arrayManipulator.arrayHasObjects()) {
            insertAt0Time = arrayManipulator.insertNewObjectAtBeginning()
            insertAtMidTime = arrayManipulator.insertNewObjectInMiddle()
            insertAtEndTime = arrayManipulator.addNewObjectAtEnd()
            removeAt0Time = arrayManipulator.removeFirstObject()
            removeAtMidTime = arrayManipulator.removeMiddleObject()
            removeAtEndTime = arrayManipulator.removeLastObject()
            lookupByIndexTime = arrayManipulator.lookupByIndex()
            lookupByObjectTime = arrayManipulator.lookupByObject()
        } else {
            print("Array not set up yet!")
        }
    }
}
