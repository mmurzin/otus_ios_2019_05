//
//  AlgorithmItemsProvider.swift
//  homework-1
//
//  Created by michael on 31/08/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation


struct AlgorithmItemsProvider {
    
    let all:[AlgorithmItem]
    
    init(namesWithTest: [String], namesWithoutTest: [String]) {
        var names = [String]()
        names.append(contentsOf: namesWithTest)
        names.append(contentsOf: namesWithoutTest)
        
        let whiteColor = "#FFFFFF"
        var algorithmItems = [AlgorithmItem]()
        for algorithmName in names {
            algorithmItems.append(AlgorithmItem(
                name: algorithmName, cellBackground: whiteColor))
        }
        self.all = algorithmItems
    }
    
    func getRemoteAlgorithmItems(_ completion: ([AlgorithmItem]) -> ()) {
        completion(self.all)
    }
}
