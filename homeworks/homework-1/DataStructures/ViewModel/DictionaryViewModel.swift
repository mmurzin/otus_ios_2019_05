//
//  DictionaryViewModel.swift
//  homework-1
//
//  Created by michael on 09/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class DictionaryViewModel: DataStructuresViewModel {
    var creationTime: TimeInterval = 0
    var add1EntryTime: TimeInterval = 0
    var add5EntriesTime: TimeInterval = 0
    var add10EntriesTime: TimeInterval = 0
    var remove1EntryTime: TimeInterval = 0
    var remove5EntriesTime: TimeInterval = 0
    var remove10EntriesTime: TimeInterval = 0
    var lookup1EntryTime: TimeInterval = 0
    var lookup10EntriesTime: TimeInterval = 0
    
    private let dictionaryManipulator: DictionaryManipulator = SwiftDictionaryManipulator()
    
    
    override func create() {
        creationTime = dictionaryManipulator.setupWithEntryCount(numberOfItems)
    }
    
    override func test() {
        if dictionaryManipulator.dictHasEntries() {
            add1EntryTime = dictionaryManipulator.add1Entry()
            add5EntriesTime = dictionaryManipulator.add5Entries()
            add10EntriesTime = dictionaryManipulator.add10Entries()
            remove1EntryTime = dictionaryManipulator.remove1Entry()
            remove5EntriesTime = dictionaryManipulator.remove5Entries()
            remove10EntriesTime = dictionaryManipulator.remove10Entries()
            lookup1EntryTime = dictionaryManipulator.lookup1EntryTime()
            lookup10EntriesTime = dictionaryManipulator.lookup10EntriesTime()
        } else {
            print("Dictionary not yet set up!")
        }
    }
}
