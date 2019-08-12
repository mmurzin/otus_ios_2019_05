//
//  SuffixArrayViewModel.swift
//  homework-1
//
//  Created by michael on 09/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class SuffixArrayViewModel: DataStructuresViewModel {
    private let suffixArrayMinpulator: SuffixArrayManipulator = SwiftSuffixArrayManipulator()
    
    var creationTime: TimeInterval = 0
    var creationAlgoTime: TimeInterval = 0
    var search10Words: TimeInterval = 0
    
    override init() {
        super.init()
        self.itemsCount = 3
    }
    
    override func create() {
        creationTime = suffixArrayMinpulator.setupWithSize(numberOfItems)
    }
    
    override func test() {
        if suffixArrayMinpulator.arrayHasObjects() {
            let provider:AlgorithmsProvider? = ServiceLocator.shared.getService()
            let algorithmItems = provider?.getAlgorithmsList() ??  [String]()
            creationAlgoTime = suffixArrayMinpulator.setupWithObjects(items:algorithmItems, reverse:false)
            search10Words = suffixArrayMinpulator.searchRandomWords(count: 10, wordSize: 3)
        } else {
            
        }
    }
}
